#' Get the unique language codes
#' @param lines lines of text
#' @export
#' @examples
#' language_codes <- get_unique_language_codes(
#'   readr::read_lines(get_splimata_path("example_1.md"))
#' )
#' testthat::expect_equal(2, length(language_codes))
#' testthat::expect_true("en" %in% language_codes)
#' testthat::expect_true("sv" %in% language_codes)
get_unique_language_codes <- function(lines) {
  all_emoji_names <- emoji::emoji_name
  unique_emojis <- splimata::get_unique_emojis(lines)
  language_codes <- rep(NA, length(unique_emojis))
  for (i in seq_along(unique_emojis)) {
    unique_emoji <- unique_emojis[i]
    this_language_codes <- names(all_emoji_names[unique_emoji == all_emoji_names])
    language_code <- NA
    if ("uk" %in% this_language_codes) {
      language_code <- "en"
    } else {
      testthat::expect_true("sweden" %in% this_language_codes)
      language_code <- "sv"
    }
    language_codes[i] <- language_code
  }
  language_codes
}
