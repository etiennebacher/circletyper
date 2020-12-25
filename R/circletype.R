#' Apply a curvature on text elements
#'
#' @param ui_element Text element on which the curvature should be applied. Must be something like `h1()`, `h2()`, etc. This element MUST have an id. Doesn't work on other HTML elements such as buttons.
#' @param dir Sets the text direction, must be equal to 1 (clockwise) or -1 (counter-clockwise).
#' @param radius Sets the desired text radius. The lower the value, the more curved the text.
#'
#' @return A curved text.
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
circletype <- function(ui_element, dir = c(-1, 1), radius = 200) {

  if (missing(ui_element)) stop("Must have an ui_element")

  if (!("shiny.tag" %in% class(ui_element))) {
    stop("Class of ui_element must be shiny.tag")
  }

  if (!is.null(ui_element$attribs$id)) {
    id_element <- ui_element$attribs$id
  } else {
    stop("ui_element must have an id")
  }

  circletype_id <- paste0("circletype", id_element)

  htmltools::tagList(
    ui_element,
    htmltools::tags$script(
      paste0(

        # About forceWidth:
        # in CircleType.js, the argument forceWidth is here to remove the centering
        # (if TRUE, then the centering is removed).
        # See https://github.com/peterhry/CircleType/issues/92
        # I decide to remove the centering permanently, i.e if the user wants to
        # center the text, this should be done via "classic" centering of shiny
        # elements.

        "const ", circletype_id, " = new CircleType(document.getElementById('", id_element, "'))
                  .dir(", dir, ")
                  .forceWidth(true)
                  .radius(", radius, ");",
        circletype_id
      )
    )
  )

}
