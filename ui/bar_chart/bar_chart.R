library(shiny)
library(ggplot2)
library(jsonlite)
library(shinyWidgets)

# 读取 JSON 文件并生成参数输入控件
generate_ui <- function(id, json_file, data) {
  ns <- NS(id)
  params <- fromJSON(json_file)$parameters
  ui_elements <- lapply(params, function(param) {
    input_id <- ns(param$name)
    label <- param$label
    type <- param$type
    default <- param$default
    
    if (type == "select") {
      selectInput(input_id, label, choices = names(data), selected = default)
    } else if (type == "text") {
      textInput(input_id, label, value = default)
    } else if (type == "color") {
      colourInput(input_id, label, value = default)
    }
  })
  
  ui_elements
}

# 定义 UI
barChartUI <- function(id) {
  ns <- NS(id)
  tagList(
    fluidPage(
      titlePanel("柱状图"),
      sidebarLayout(
        sidebarPanel(
          selectInput(ns("dataSource"), "选择数据源", choices = c("iris", "上传数据文件"), selected = "iris"),
          fileInput(ns("dataFile"), "上传数据文件", accept = c(".csv")),
          uiOutput(ns("params_ui"))
        ),
        mainPanel(
          plotOutput(ns("plot"))
        )
      )
    )
  )
}

# 定义服务器逻辑
barChartServer <- function(input, output, session) {
  ns <- session$ns
  
  # 初始化数据为系统自带的数据集 iris
  data <- reactiveVal(iris)
  
  # 如果用户上传了自己的数据文件，则使用上传的数据文件
  observeEvent(input$dataFile, {
    if (!is.null(input$dataFile)) {
      data(read.csv(input$dataFile$datapath))
    }
  })
  
  observeEvent(input$dataSource, {
    # 生成参数输入控件
    params_ui <- generate_ui(session$ns(NULL), "ui/bar_chart/bar_chart.json", data())
    output$params_ui <- renderUI({ params_ui })
  })
  
  observe({
    # 重新绘制图表
    output$plot <- renderPlot({
      req(input$dataSource)
      params <- fromJSON("ui/bar_chart/bar_chart.json")$parameters
      
      # 动态获取输入控件的值
      param_values <- lapply(params, function(param) input[[param$name]])
      names(param_values) <- sapply(params, function(param) param$name)
      
      # 生成图表
      p <- ggplot(data(), aes_string(x = param_values$xvar)) +
        geom_bar(fill = param_values$fill) +
        labs(title = param_values$title)
      
      print(p)
    })
  })
}
