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

  text <- splimata::create_structured_text(lines)
  testthat::expect_true(is.list(text))

  # Concatenate the parts for each language
  texts <- list()
  language_codes <- splimata::get_unique_language_codes(lines)
  texts[language_codes] <- list()
  for (i in seq_along(text)) {
    if (is.character(text[[i]])) {
      for (language_code in language_codes) {
        texts[language_code][[i]] <- text[[i]]
      }
    }
    else {
      testthat::expect_true(is.list(text[[language_code]]))
      for (language_code in language_codes) {
        texts[language_code][[i]] <- text[[language_code]]
      }
    }
  }

  # Convert the 1 list per language to characters
  for (language_code in language_codes) {
    testthat::expect_true(is.list(texts[language_codes]))
    texts[language_codes] <- unlist(texts[language_codes])
    testthat::expect_true(is.character(texts[language_codes]))
  }

  texts
}
