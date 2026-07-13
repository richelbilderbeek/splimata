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

  tabs <- list()
  unique_language_codes <- splimata::get_unique_language_codes(chunk_lines)
  tabs[unique_language_codes] <- ""

  line_language <- splimata::get_line_language_from_tab_chunk(chunk_lines)


  # Extract the text from the tabs, including tab and maintaining indentation
  for (i in seq_along(unique_language_codes)) {
    language_code <- unique_language_codes[i]
    lines <- chunk_lines[which(line_language == language_code)]
    tabs[[language_code]] <- lines
  }

  # Remove the language tab (line 1) and unindent the rest
  for (i in seq_along(unique_language_codes)) {
    language_code <- unique_language_codes[i]
    tabs[[language_code]] <- tabs[[language_code]][-1]
    tabs[[language_code]] <- stringr::str_replace(tabs[[language_code]], pattern = "^    ", replacement = "")
  }
  tabs
}
