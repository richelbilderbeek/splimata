test_that("use", {
  lines <- readr::read_lines(get_splimata_path("example_1.md"))
  is_tab_line <- get_is_tab_line(lines)
  expect_equal(length(lines), length(is_tab_line))
})

test_that("use", {
  lines <- readr::read_lines(get_splimata_path("example_2.md"))
  is_tab_line <- get_is_tab_line(lines)
  expect_equal(length(lines), length(is_tab_line))

  # The general address is not in a tab
  expect_false(is_tab_line[12])
})
