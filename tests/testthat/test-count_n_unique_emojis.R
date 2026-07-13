test_that("use", {
  n <- count_n_unique_emojis(
    readr::read_lines(get_splimata_path("example_1.md"))
  )
  expect_equal(2, n)
})
