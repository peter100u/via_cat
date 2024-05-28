library(shiny)
library(bslib)
source("ui/chart_module.R")

home_module_ui <- fluidPage(
  tags$head(
    includeCSS("www/styles.css"),
    includeScript("www/test.js")
  ),
  # 第一部分：标题和描述
  fluidRow(
    div(
      align = "center",
      br(),
      h2("数据可视化"),
      p("体验数据之美"),
      br(),
    )
  ),
  # 第二部分：搜索框 （目前没太多的数据，不需要搜索）
  # fluidRow(
  #   div(
  #     align = "center",
  #     textInput("search", label = NULL, placeholder = "开始您的搜索吧")
  #   )
  # ),

  # 第三部分：图表作品区域
  fluidRow(
    column(width = 12, align = "center", chart_module_ui("chart1"))
  )
)
