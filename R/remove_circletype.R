remove_circletype <- function(circletype_id) {

  htmltools::tags$script(
    paste0(
      circletype_id, ".destroy();
      console.log('test');"
    )
  )

}
