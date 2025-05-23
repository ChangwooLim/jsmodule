% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/line.R
\name{lineUI}
\alias{lineUI}
\title{lineUI: shiny module UI for lineplot}
\usage{
lineUI(id, label = "lineplot")
}
\arguments{
\item{id}{id}

\item{label}{label}
}
\value{
Shiny module UI for lineplot
}
\description{
Shiny module UI for lineplot
}
\details{
Shiny module UI for lineplot
}
\examples{
library(shiny)
library(ggplot2)
library(ggpubr)
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      lineUI("line")
    ),
    mainPanel(
      plotOutput("line_plot"),
      ggplotdownUI("line")
    )
  )
)

server <- function(input, output, session) {
  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))

  out_line <- lineServer("line",
    data = data, data_label = data.label,
    data_varStruct = NULL
  )

  output$line_plot <- renderPlot({
    print(out_line())
  })
}
}
