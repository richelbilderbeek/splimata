#' Split text is different sections:
#' - Headings
#' - Regular text
#' - Language tabs
#' @param lines a text
#' @export
#' @examples
#' text <- split_text(
#'   lines = readr::read_lines(get_splimata_path("example_1.md"))
#' )
#' testthat::expect_true(is.list(text))
split_text <- function(lines) {

  is_language_line <- emoji::emoji_extract_all(lines, simplify = TRUE)[, 1] != ""
  is_tab_line <- splimata::get_is_tab_line(lines)

  list_indices <- rep(NA, length(lines))
  list_index <- 1
  for (i in seq_along(list_indices)) {
    if (is_language_line[i] && !is_tab_line[i]) {
      list_index <- list_index + 1
    } else if (i > 1 && !is_tab_line[i - 1] && is_tab_line[i]){
      list_index <- list_index + 1
    } else if (i > 1 && is_tab_line[i - 1] && !is_tab_line[i]){
      list_index <- list_index + 1
    }
    list_indices[i] <- list_index
  }
  n_indices <- utils::tail(list_indices, n = 1)
  text <- list()
  for (list_index in seq_len(n_indices)) {
    text[[list_index]] <- lines[list_indices == list_index]
  }
  text
}
