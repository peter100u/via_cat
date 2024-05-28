library(shiny)
library(bslib)
library(shiny.router)
source("ui/chart_module.R")
source("ui/index/home.R")
source("ui/bar_chart/bar_chart.R")

bslib::page(
  theme = bslib::bs_theme(version = 5),
  tags$head(
    includeCSS("www/styles.css"),
    includeScript("www/test.js")
  ),
  router_ui(
    # route("/", home_module_ui),
    # http://127.0.0.1:4401/#!/bar_chart
    # route("bar_chart", barChartUI("barChartUI"))
    route("/", barChartUI("barChartUI"))
  )
)