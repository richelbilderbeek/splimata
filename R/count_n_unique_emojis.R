#' Count the number of unique emojis
#' @param lines a text
#' @export
#' @examples
#' n <- count_n_unique_emojis(
#'   lines = readr::read_lines(get_splimata_path("example_1.md"))
#' )
#' testthat::expect_equal(2, n)
count_n_unique_emojis <- function(lines) {
  length(splimata::get_unique_emojis(lines))
}
