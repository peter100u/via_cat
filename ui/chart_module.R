library(shiny)
library(shinydashboard)
library(jsonlite)

# 从json文件中获取的图表信息，请确保文件路径正确
chartInfo <- fromJSON("data/charts_info.json")

# 自定义卡片函数
customCard <- function(title = NULL, description = NULL, imageUrl = NULL, height = "200px") {
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
  lapply(seq_along(chartInfo$tag), function(index) {
    tag <- chartInfo$tag[index]
    contents <- chartInfo$contents[[index]]
    content <- contents[index, ]
    customCard(title = content$title, description = content$description, imageUrl = content$imageUrl)
  })
}



# 图表作品模块的服务器逻辑
chart_module_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # 这里不需要服务器逻辑，因为所有内容都是静态的
  })
}