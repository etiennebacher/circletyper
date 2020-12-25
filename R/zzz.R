.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "circletype-assets",
    system.file("circletype", package = "circletyper")
  )
  shiny::addResourcePath(
    "custom-assets",
    system.file("custom", package = "circletyper")
  )
}
