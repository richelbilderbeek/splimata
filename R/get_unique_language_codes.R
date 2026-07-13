#' Get the unique emojis
#' @param lines lines of text
#' @export
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
