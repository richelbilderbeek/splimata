test_that("use", {
  text <- splimata::split_text(
    readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_true(is.list(text))
  expect_equal(length(text), 4)

  expect_true(is.character(create_structured_chunk(chunk_lines = text[[1]])))
  expect_true(is.list(create_structured_chunk(chunk_lines = text[[2]])))
  expect_true(is.list(create_structured_chunk(chunk_lines = text[[3]])))
  expect_true(is.list(create_structured_chunk(chunk_lines = text[[4]])))
})
