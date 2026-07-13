#' Convert regular lines of test to list
#' @param lines a text
#' @export
#' @examples
#' text <- create_structured_text(
#'   readr::read_lines(get_splimata_path("example_1.md"))
#' )
#' testthat::expect_true(is.list(text))
create_structured_text <- function(lines) {

  text <- splimata::split_text(lines)

  for (i in seq_along(text)) {
    chunk_lines <- text[[i]]
    testthat::expect_true(is.character(chunk_lines))
    text[[i]] <- splimata::create_structured_chunk(chunk_lines)
  }
  text
}
