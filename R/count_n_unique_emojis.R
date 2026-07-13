#' Count the number of unique emojis
#' @export
count_n_unique_emojis <- function(lines) {
  length(splimata::get_unique_emojis(lines))
}
