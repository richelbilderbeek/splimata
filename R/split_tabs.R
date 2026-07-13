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
  n_unique_emojis <- splimata::count_n_unique_emojis(lines)
}
