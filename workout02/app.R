library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   
    titlePanel("Savings Simulation"),
   
    fluidRow(
      column(4,
             sliderInput("initial", "Initial Amount",
                         min = 0, max = 100000,
                         step = 500, value = 1000,
                         pre = "$"),
             sliderInput("annual", "Annual Contribution",
                         min = 0, max = 50000,
                         step = 500, value = 2000,
                         pre = "$")
             
      ),
      
      column(4,
             sliderInput("return", "Return Rate(in %)",
                         min = 0, max = 20,
                         step = 0.1, value = 5),
             sliderInput("growth", "Growth Rate(in %)",
                         min = 0, max = 20,
                         step = 0.1, value = 2)
      ),
      
      column(4,
             sliderInput("years", "Years",
                         min = 0, max = 50,
                         step = 1, value = 20),
             selectInput("facet", "Facet?",
                         choices = c("No", "Yes"), selected = "No")
      )
    ),
    
    fluidRow(
      column(10, offset = 1,
             h3("Timelines"),
             plotOutput("distPlot")
      )
    ),
    
    fluidRow(
       column(10, offset = 1,
              h3("Balance"),
              tableOutput("table")
              )
    )
    
)

server <- function(input, output) {
  
   dat <- reactive({
     balance_no_contri <- c(input$initial, rep(0, input$years))
     balance_fixed_contri <- c(input$initial, rep(0, input$years))
     balance_growing_contri <- c(input$initial, rep(0, input$years))
     growing_contri <- input$annual
     
     for (y in 1:input$years) {
       balance_no_contri[y+1] <- balance_no_contri[y] * (1 + input$return * 0.01)
       balance_fixed_contri[y+1] <- balance_fixed_contri[y] * (1 + input$return * 0.01) + input$annual
       balance_growing_contri[y+1] <- balance_growing_contri[y] * (1 + input$return * 0.01) + growing_contri
       growing_contri <- growing_contri * (1 + input$growth * 0.01)
     }
     dat <- data.frame(
       year = 0:input$years,
       bal_no_contri = balance_no_contri,
       bal_fixed_contri = balance_fixed_contri,
       bal_growing_contri = balance_growing_contri
     )
     return(dat)
   }) 
  
   output$distPlot <- renderPlot({
      types <- c("no_contrib", "fixed_contrib", "growing_contrib")
      types <- rep(types, each = length(dat()$year))
      data <- data.frame(year = rep(dat()$year, 3), 
                         balance = c(dat()$bal_no_contri, dat()$bal_fixed_contri, dat()$bal_growing_contri),
                         type = types)
      data$type <- factor(data$type, levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
      gg <- ggplot(data = data, aes(x = year, y = balance)) + 
              geom_point(aes(color = type), size = 1) +
              geom_line(aes(color = type)) +
              theme_bw() +
              ggtitle("Three modes of investing") +
              xlab("Year") +
              ylab("Balance(dollars)")
      if (input$facet == "Yes") {
        gg <- gg + geom_area(aes(fill = type), alpha = 0.5) + facet_wrap(~type)
      }
      gg
      
   })
   output$table <- renderTable({dat()},
                               spacing = "s",
                               striped = TRUE, bordered = TRUE,
                               width = "100%", align = 'c',
                               digits = 3)
}

shinyApp(ui = ui, server = server)

