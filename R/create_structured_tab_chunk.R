#' Convert regular lines of one chunk to list
#'
#' A chunk can be one of these, and one of these only:
#'
#' - regular lines of text
#' - a heading
#' - a table
#' @param chunk_lines text of a chunk
#' @export
#' @examples
#' # Split text into chunks
#' text <- split_text(
#'   readr::read_lines(get_splimata_path("example_1.md"))
#' )
#' testthat::expect_true(is.list(text))
#' testthat::expect_equal(length(text), 4)
#'
#' # Structure the chunks
#' testthat::expect_true(is.list(create_structured_tab_chunk(text[[4]])))
create_structured_tab_chunk <- function(chunk_lines) {

  is_header_chunk <- ncol(emoji::emoji_extract_all(chunk_lines, simplify = TRUE)) == 2
  is_tab_chunk <- all(splimata::get_is_tab_line(chunk_lines))
  testthat::expect_false(is_header_chunk)
  testthat::expect_true(is_tab_chunk)
  list()
}
