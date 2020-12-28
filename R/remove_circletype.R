#' Remove circletype effect
#'
#' @param id Id of the text element that has a circletype effect.
#' @param session Session of the Shiny app
#'
#' @return Removes circletype effect
#' @export
#'
#' @examples
#' if (interactive()) {
#' library(shiny)
#' library(circletyper)
#'
#' ui <- fluidPage(
#'   use_circletype(), # load dependencies
#'
#'   circletype(strong("this is a bold text", id = "teststrong")),
#'
#'   br(),
#'
#'   # You can also remove the circletype effect
#'   actionButton("remove", "remove circletype effect for bold text")
#' )
#'
#' server <- function(input, output, session) {
#'
#'
#'   observeEvent(input$remove, {
#'     remove_circletype("teststrong", session = session)
#'   })
#'
#' }
#'
#' shinyApp(ui, server)
#' }
remove_circletype <- function(id, session = NULL) {

  if(is.null(session))
    session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage("circletype-destroy", id)

}
