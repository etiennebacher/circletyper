
# circletyper

<!-- badges: start -->

[![R-CMD-check](https://github.com/etiennebacher/circletyper/workflows/R-CMD-check/badge.svg)](https://github.com/etiennebacher/circletyper/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/circletyper)](https://CRAN.R-project.org/package=circletyper)
<!-- badges: end -->

The goal of `{circletyper}` is to enable text curving in Shiny apps, by
adapting [CircleType.js](https://github.com/peterhry/CircleType) into R.

## Installation

You can install the CRAN version of `{circletyper}` with:
``` r
install.packages("circletyper")
```
or the development version with:
``` r
# install.packages("devtools")
devtools::install_github("etiennebacher/circletyper")
```

## Example

``` r
library(shiny)
library(magrittr)
library(circletyper)

ui <- fluidPage(
  use_circletype(), # load dependencies

  # Wrap the text element you want to curve into circletype()...
  circletype(h2("this is a title", id = "testh2"), dir = -1, radius = 200),

  # ... or use magrittr's pipe
  strong("this is a bold text", id = "teststrong") %>% circletype(dir = 1),

  br(),

  actionButton("remove", "remove circletype effect")
)

server <- function(input, output, session) {

  # You can also remove the circletype effect
  observeEvent(input$remove, {
    remove_circletype("teststrong")
  })

}

shinyApp(ui, server)
```

| Initial              | After clicking on the button |
|----------------------|------------------------------|
| ![](demo_before.png) | ![](demo_after.png)          |
