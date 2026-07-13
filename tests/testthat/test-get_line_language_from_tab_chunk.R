test_that("use", {
  text <- splimata::split_text(
    readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_true(is.list(text))
  expect_equal(length(text), 4)

  chunk_lines <- text[[4]]
  line_language <- get_line_language_from_tab_chunk(chunk_lines)
  expect_equal(length(chunk_lines), length(line_language))
})
