#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


library(shiny)
library(shiny.router)
source("ui/chart_module.R")
source("ui/bar_chart/bar_chart.R")

# Define server logic required to draw a histogram
function(input, output, session) {
  router_server()
  # chart_module_server("chart1")
  callModule(barChartServer, "barChartUI")
}
