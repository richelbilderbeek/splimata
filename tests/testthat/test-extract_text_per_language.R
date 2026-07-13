test_that("use", {
  texts <- extract_text_per_language(
    lines = readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_true("en" %in% names(texts))
  expect_true("sv" %in% names(texts))
  expect_true(is.character(texts$en))
  expect_true(is.character(texts$sv))
})

test_that("use", {
  texts <- extract_text_per_language(
    lines = readr::read_lines(get_splimata_path("example_2.md"))
  )
  expect_true("en" %in% names(texts))
  expect_true("sv" %in% names(texts))
  expect_true(is.character(texts$en))
  expect_true(is.character(texts$sv))
})
