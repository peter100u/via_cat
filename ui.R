library(shiny)
library(shinydashboard)


fluidPage(
  tags$head(
    includeCSS("www/styles.css")
  ),
  tags$head(
    includeScript("www/test.js")
  ),
  # 第一部分：标题和描述
  fluidRow(
    column(
      12,
      align = "center",
      box(
        title = "数据可视化大全",
        status = "primary",
        solidHeader = TRUE,
        width = 12,
        p("无限精美的图表，满足你的一切视觉效果")
      )
    )
  ),
  # 第二部分：搜索框
  fluidRow(
    column(12,
      align = "center",
      box(
        textInput("search", label = NULL, placeholder = "开始您的搜索吧"),
        width = 8
      )
    )
  ),

  # 第三部分：图表作品区域
  fluidRow(
    tabBox(
      title = NULL,
      id = "tabset1",
      width = 12,
      tabPanel(
        "柱状图",
        box(
          title = "柱状图示例",
          width = 12,
          plotOutput("barPlot1")
        ),
        box(
          title = "柱状图示例2",
          width = 12,
          plotOutput("barPlot2")
        )
      ),
      tabPanel(
        "折线图",
        box(
          title = "折线图示例",
          width = 12,
          plotOutput("linePlot1")
        ),
        box(
          title = "折线图示例2",
          width = 12,
          plotOutput("linePlot2")
        )
      ),
      tabPanel(
        "散点图",
        box(
          title = "散点图示例",
          width = 12,
          plotOutput("scatterPlot1")
        ),
        box(
          title = "散点图示例2",
          width = 12,
          plotOutput("scatterPlot2")
        )
      )
    )
  )
)