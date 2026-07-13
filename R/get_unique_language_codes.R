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
  emoji_names <- names(all_emoji_names[all_emoji_names == splimata::get_unique_emojis(lines)])
  all_language_codes <- dplyr::recode_values(
    emoji_names,
    "gb" ~ "en",
    "flag_United_Kingdom" ~ "en",
    "sweden" ~ "sv"
  )
  unique(all_language_codes)
}
