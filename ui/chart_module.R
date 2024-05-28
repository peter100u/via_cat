# chart_module.R
library(shiny)

# 图表作品模块的 UI
chartModuleUI <- function(id) {
  ns <- NS(id)
  tabBox(
    title = NULL,
    id = ns("tabset1"),
    width = 8,
    tabPanel("柱状图",
      box(
        title = "柱状图示例",
        width = 12,
        plotOutput(ns("barPlot1"))
      ),
      box(
        title = "柱状图示例2",
        width = 12,
        plotOutput(ns("barPlot2"))
      )
    ),
    tabPanel("折线图", 
      box(
        title = "折线图示例",
        width = 12,
        plotOutput(ns("linePlot1"))
      ),
      box(
        title = "折线图示例2",
        width = 12,
        plotOutput(ns("linePlot2"))
      )
    ),
    tabPanel("散点图", 
      box(
        title = "散点图示例",
        width = 12,
        plotOutput(ns("scatterPlot1"))
      ),
      box(
        title = "散点图示例2",
        width = 12,
        plotOutput(ns("scatterPlot2"))
      )
    )
  )
}

# 图表作品模块的服务器逻辑
chartModuleServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$barPlot1 <- renderPlot({
      barplot(VADeaths, main = "Bar Plot Example 1", col = "skyblue")
    })
    
    output$barPlot2 <- renderPlot({
      barplot(mtcars$mpg, names.arg = rownames(mtcars), main = "Bar Plot Example 2", col = "lightgreen")
    })
    
    output$linePlot1 <- renderPlot({
      plot(1:10, type = "l", main = "Line Plot Example 1", col = "blue", lwd = 2)
    })
    
    output$linePlot2 <- renderPlot({
      plot(cars, type = "l", main = "Line Plot Example 2", col = "red", lwd = 2)
    })
    
    output$scatterPlot1 <- renderPlot({
      plot(mpg ~ wt, data = mtcars, main = "Scatter Plot Example 1", col = "purple", pch = 19)
    })
    
    output$scatterPlot2 <- renderPlot({
      plot(disp ~ hp, data = mtcars, main = "Scatter Plot Example 2", col = "orange", pch = 19)
    })
  })
}
