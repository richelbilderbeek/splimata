#' Extract the languages
#' @param lines a text
#' @export
#' @examples
#' texts <- extract_text_per_language(
#'   lines = readr::read_lines(get_splimata_path("example_1.md"))
#' )
#' testthat::expect_true("en" %in% names(texts))
#' testthat::expect_true("sv" %in% names(texts))
#' testthat::expect_true(is.character(texts$en))
#' testthat::expect_true(is.character(texts$sv))
extract_text_per_language <- function(lines) {

  texts <- list()
  texts[ splimata::get_unique_language_codes(lines) ] <- ""
  texts
}
