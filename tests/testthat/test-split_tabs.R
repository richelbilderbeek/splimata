test_that("use", {
  input_file_name <- get_splimata_path("example_1.md")
  output_file_prefix <- tempfile(pattern = "example_1_", fileext = "")
  output_file_names <- split_tabs(
    input_file_name = input_file_name,
    output_file_prefix = output_file_prefix
  )
  en_path <- paste0(output_file_prefix, "_en.md")
  expect_true(en_path %in% output_file_names)
  sv_path <- paste0(output_file_prefix, "_sv.md")
  expect_true(sv_path %in% output_file_names)
  expect_true(file.exists(en_path))
  expect_true(file.exists(sv_path))

  lines <- readr::read_lines(en_path)
  expect_true(all(emoji::emoji_detect(lines) == FALSE))

  lines <- readr::read_lines(sv_path)
  expect_true(all(emoji::emoji_detect(lines) == FALSE))
})

test_that("use", {
  input_file_name <- get_splimata_path("example_2.md")
  output_file_prefix <- tempfile(pattern = "example_2_", fileext = "")
  output_file_names <- split_tabs(
    input_file_name = input_file_name,
    output_file_prefix = output_file_prefix
  )
  en_path <- paste0(output_file_prefix, "_en.md")
  expect_true(en_path %in% output_file_names)
  sv_path <- paste0(output_file_prefix, "_sv.md")
  expect_true(sv_path %in% output_file_names)
  expect_true(file.exists(en_path))
  expect_true(file.exists(sv_path))

  lines <- readr::read_lines(en_path)
  expect_true(all(emoji::emoji_detect(lines) == FALSE))

  lines <- readr::read_lines(sv_path)
  expect_true(all(emoji::emoji_detect(lines) == FALSE))
})
