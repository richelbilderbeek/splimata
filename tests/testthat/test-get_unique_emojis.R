test_that("use", {
  unique_emojis <- get_unique_emojis(
    readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_equal(2, length(unique_emojis))
})
