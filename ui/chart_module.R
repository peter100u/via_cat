library(shiny)
library(bslib)

# 假设 chartInfo 是一个列表，每个元素包含 tag 和 contents
chartInfo <- list(
  list(
    tag = "柱状图",
    contents = list(
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例1", description = "这是柱状图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "柱状图示例2", description = "这是柱状图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg")
    )
  ),
  list(
    tag = "折线图",
    contents = list(
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例1", description = "这是折线图示例1的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg"),
      list(title = "折线图示例2", description = "这是折线图示例2的描述。", imageUrl = "https://www.chartjs.org/img/chartjs-logo.svg")
    )
  )
)

# 自定义卡片函数
chartCard <- function(
    title = NULL,
    description = NULL,
    image_url = NULL,
    height = "200px") {
  div(
    class = "card",
    div(class = "card-header", title),
    div(
      class = "card-body",
      p(description, class = "card-text"),
      img(
        src = image_url,
        class = "card-img-bottom",
        style = paste0("height:", height)
      )
    )
  )
}

# 图表作品模块的 UI
chart_module_ui <- function(id) {
  ns <- NS(id)
  bslib::navset_card_underline(
    id = ns("tabSet1"),
    do.call(tabsetPanel, lapply(chartInfo, function(category) {
      bslib::nav_panel(
        title = category$tag,
        fluidRow(
          do.call(tagList, lapply(category$contents, function(content) {
            column(
              width = 3, # 根据网格系统选择列宽，这里我们使用12/3列布局
              chartCard(
                title = content$title,
                description = content$description,
                image_url = content$imageUrl
              )
            )
          }))
        )
      )
    }))
  )
}

chart_module_server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}