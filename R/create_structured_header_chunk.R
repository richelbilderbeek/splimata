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
#' testthat::expect_true(is.list(create_structured_header_chunk(text[[2]])))
#' testthat::expect_true(is.list(create_structured_header_chunk(text[[3]])))
create_structured_header_chunk <- function(chunk_lines) {

  is_header_chunk <- ncol(emoji::emoji_extract_all(chunk_lines, simplify = TRUE)) == 2
  is_tab_chunk <- all(splimata::get_is_tab_line(chunk_lines))
  testthat::expect_true(is_header_chunk)
  testthat::expect_false(is_tab_chunk)

  header <- list()
  language_codes <- splimata::get_unique_language_codes(chunk_lines)
  header[language_codes] <- ""

  split_lines <- stringr::str_split(chunk_lines, emoji::emoji_rx, simplify = TRUE)

  for (i in seq_along(language_codes)) {
    language_code <- language_codes[i]
    col_index <- i + 1 # The first row contains the shared text
    lines <- paste0(split_lines[, 1],  split_lines[, col_index])
    header[[language_code]] <- lines
  }
  header
}
