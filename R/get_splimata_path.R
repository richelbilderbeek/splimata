#' Get the path to a `splimata` file
#' @param filename name of the file in `inst/extdata`
#' @export
get_splimata_path <- function (filename) {
  full <- system.file("extdata", filename, package = "splimata")
  if (!file.exists(full)) {
    stop("'filename' must be the name of a file in 'inst/extdata'")
  }
  full
}
