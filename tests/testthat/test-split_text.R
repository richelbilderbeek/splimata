test_that("use", {
  text <- splimata::split_text(
    readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_true(is.list(text))
  expect_equal(length(text), 4)
})

test_that("use", {
  text <- splimata::split_text(
    readr::read_lines(get_splimata_path("example_2.md"))
  )
  expect_true(is.list(text))
  expect_true(length(text[[1]]) > 0)
  expect_equal(length(text), 9)
})
