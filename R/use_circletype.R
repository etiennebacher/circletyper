#' Load CircleType dependencies
#'
#' @return Load depepdencies
#' @export
#'
#' @examples
#' if (interative()) {
#' library(shiny)
#'
#' ui <- fluidPage(
#'   use_circletype(), # load dependencies
#'   circletype(h1("this is a title", id = "test_h1"), dir = -1, radius = 200)
#' )
#'
#' server <- function(input, output, session) {}
#'
#' shinyApp(ui, server)
#' }

use_circletype <- function() {

  shiny::singleton(
    shiny::tags$head(
      shiny::tags$script(
        src = "circletype-assets/circletype.min.js"
      ),
      shiny::tags$script(
        src = "custom-assets/destroy.js"
      )
    )
  )
}
