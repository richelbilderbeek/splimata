test_that("use", {
  text <- splimata::split_text(
    readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_true(is.list(text))
  expect_equal(length(text), 4)

  expect_true(is.list(create_structured_header_chunk(chunk_lines = text[[2]])))
  expect_true(is.list(create_structured_header_chunk(chunk_lines = text[[3]])))

  header_chunk <- create_structured_header_chunk(chunk_lines = text[[2]])
  expect_true("en" %in% names(header_chunk))
  expect_true("sv" %in% names(header_chunk))
  expect_true(is.character(header_chunk[["en"]]))
  expect_true(is.character(header_chunk[["sv"]]))

})
