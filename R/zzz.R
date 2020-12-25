.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "circletype-assets",
    system.file("circletype", package = "circletyper")
  )
}
