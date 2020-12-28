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
  x <- sample(2:100, 1)
  y <- sample(-100:2, 1)
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
  x <- circletype(shiny::p("this is some text", id = "test"), dir = -1)
  x <- paste(x)
  x <- gsub("\\t", "", x)
  x <- gsub("\\n", "", x)
  # remove additional spaces
  x <-  gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", x, perl = TRUE)

  expect_equal(
    x,
    "<p id=\"test\">this is some text</p><script>var circleTypes = { 'circletypetest': new CircleType(document.getElementById('test')) .dir(-1) .forceWidth(true) .radius(200) }; circleTypes['circletypetest']</script>"
  )
})



