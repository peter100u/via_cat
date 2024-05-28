library(shiny)
library(shinydashboard)

# 假设 chartInfo 是一个列表，每个元素包含 tag 和 contents
chartInfo <- list(
  list(
    tag = "柱状图",
    contents = list(
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg")
    )
  ),
  list(
    tag = "折线图",
    contents = list(
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg")
    )
  )
)

# 自定义卡片函数
chartCard <- function(title = NULL, description = NULL, imageUrl = NULL, height = "200px") {
  div(
    class = "card",
    div(class = "card-header", title),
    div(
      class = "card-body",
      p(description, class = "card-text"),
      img(src = imageUrl, class = "card-img-bottom", style = paste0("height:", height))
    )
  )
}

# 图表作品模块的 UI
chart_module_ui <- function(id) {
  ns <- NS(id)
  tabBox(
    title = NULL,
    id = ns("tabSet1"),
    width = 8,
    do.call(tabsetPanel, lapply(chartInfo, function(category) {
      tabPanel(
        title = category$tag,
        do.call(tagList, lapply(category$contents, function(content) {
          chartCard(title = content$title, description = content$description, imageUrl = content$imageUrl)
        }))
      )
    }))
  )
}