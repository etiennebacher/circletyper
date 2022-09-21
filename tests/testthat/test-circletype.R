test_that("circletype must be applied on a ui_element", {
  expect_error(circletype())
})

test_that("circletype must be applied on an shiny element", {
  expect_error(circletype("this is some text"))
})

test_that("ui_element must have an id", {
  expect_error(
    circletype(
      shiny::p("this is some text")
    )
  )
})

test_that("dir possible values are 1 and -1", {
  x <- -10
  y <- 10
  expect_error(
    circletype(
      shiny::p("this is some text", id = "test"), dir = x
    )
  )
  expect_error(
    circletype(
      shiny::p("this is some text", id = "test"), dir = y
    )
  )
  expect_error(
    circletype(
      shiny::p("this is some text", id = "test"), dir = 0
    )
  )
})

test_that("radius must be numeric", {
  expect_error(
    circletype(
      shiny::p("this is some text", id = "test"),
      dir = -1, radius = "text"
    )
  )
})

test_that("circletype returns the right output", {
  circletype(shiny::p("this is some text", id = "test"), dir = -1) %>%
    paste %>%
    gsub("\\t", "", .)  %>%
    gsub("\\n", "", .) %>%
    # remove additional spaces
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", ., perl = TRUE) %>%
    testthat::expect_snapshot_output()
})



