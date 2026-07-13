#' Get the unique emojis
#' @param lines a text
#' @export
#' @examples
#' unique_emojis <- get_unique_emojis(
#'   readr::read_lines(get_splimata_path("example_1.md"))
#' )
#' testthat::expect_equal(2, length(unique_emojis))
get_unique_emojis <- function(lines) {
  emojis_and_empty <- unique(
    as.vector(emoji::emoji_extract_all(lines, simplify = TRUE))
  )
  emojis_and_empty[emojis_and_empty != ""]
}
