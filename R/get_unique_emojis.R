#' Get the unique emojis
#' @export
get_unique_emojis <- function(lines) {
  emojis_and_empty <- unique(
    as.vector(emoji::emoji_extract_all(lines, simplify = TRUE))
  )
  emojis_and_empty[emojis_and_empty != ""]
}
