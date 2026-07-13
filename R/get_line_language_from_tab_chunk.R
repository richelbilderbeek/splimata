#' From the text of a tab chunk, deduce which language each line belongs to
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
#' chunk_lines <- text[[4]]
#' line_language <- get_line_language_from_tab_chunk(chunk_lines)
#' testthat::expect_equal(length(chunk_lines), length(line_language))
get_line_language_from_tab_chunk <- function(chunk_lines) {

  is_header_chunk <- ncol(emoji::emoji_extract_all(chunk_lines, simplify = TRUE)) == 2
  is_tab_chunk <- all(splimata::get_is_tab_line(chunk_lines))
  testthat::expect_false(is_header_chunk)
  testthat::expect_true(is_tab_chunk)

  line_language <- rep(NA, length(chunk_lines))
  current_language <- NA
  for (i in seq_along(chunk_lines)) {
    chunk_line <- chunk_lines[i]
    these_languages <- names(emoji::emoji_name[emoji::emoji_name == emoji::emoji_extract(chunk_line)])
    if (length(these_languages) != length(emoji::emoji_name)) {
      if ("sweden" %in% these_languages) {
        current_language <- "sv"
      } else {
        testthat::expect_true("gb" %in% these_languages)
        current_language <- "en"
      }
    }
    line_language[i] <- current_language
  }
  line_language
}
