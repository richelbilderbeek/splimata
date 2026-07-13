#' Deterine per line if this is part of a tab yes/no
#' @param lines a text
#' @export
#' @examples
#' lines <- readr::read_lines(get_splimata_path("example_1.md"))
#' is_tab_line <- get_is_tab_line(lines)
#' testthat::expect_equal(length(lines), length(is_tab_line))
get_is_tab_line <- function(lines) {
  is_tab_line <- rep(NA, length(lines))
  index <- 0
  is_tab <- FALSE
  for (index in seq(1, length(lines))) {
    is_start_of_tab <- stringr::str_detect(lines[index], "^=== \"")
    is_non_indented <- stringr::str_detect(lines[index], "^[:graph:]")
    if (is_start_of_tab == TRUE) {
      is_tab <- TRUE
    } else if (is_non_indented == TRUE) {
      is_tab <- FALSE
    }
    is_tab_line[index] <- is_tab
  }
  is_tab_line
}
