test_that("use", {
  text <- splimata::create_structured_text(
    lines = readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_true(is.list(text))
})
