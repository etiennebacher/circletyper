remove_circletype <- function(id, session = NULL) {

  if(is.null(session))
    session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage("circletype-destroy", id)

}
