test_that("use", {
  language_codes <- get_unique_language_codes(
    lines = readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_equal(2, length(language_codes))
  expect_true("en" %in% language_codes)
  expect_true("sv" %in% language_codes)

  # Must preserve order
  expect_equal(c("sv", "en"), language_codes)
})
