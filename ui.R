library(shiny)
source("ui/chart_module.R")

fluidPage(
  tags$head(
    includeCSS("www/styles.css"),
    includeScript("www/test.js")
  ),

  # 第一部分：标题和描述
  fluidRow(
    div(
      align = "center",
      br(),
      h2("数据可视化大全"),
      p("无限精美的图表，满足你的一切视觉效果"),
      br(),
    )
  ),
  # 第二部分：搜索框
  fluidRow(
    div(
      align = "center",
      textInput("search", label = NULL, placeholder = "开始您的搜索吧")
    )
  ),

  # 第三部分：图表作品区域
  fluidRow(
    column(width = 12, align = "center", chart_module_ui("chart1"))
  )
)