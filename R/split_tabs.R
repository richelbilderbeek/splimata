#' Split a MkDocs file based on language tabs.
#' @param input_file_name name of the file that has tabs with
#' multiple languages
#' @param output_file_prefix prefix of the created Markdown files,
#' e.g. `result`
#' @return the names of the files created,
#' e.g. `c("result_en.md", "result_sv.md")`
#' @export
split_tabs <- function(input_file_name, output_file_prefix) {
  lines <- readr::read_lines(input_file_name)
  testthat::expect_true(splimata::count_n_unique_emojis(lines) > 1)
  texts <- splimata::extract_text_per_language(lines)

  output_filenames <- rep(NA, length(texts))
  for (i in seq_along(texts)) {
    language_code <- names(texts)[i]
    message(language_code)
    text <- texts[[language_code]]
    output_filename <- paste0(output_file_prefix, "_", language_code, ".md")
    readr::write_lines(text, output_filename)
    output_filenames[i] <- output_filename
  }
  output_filenames
}
