#' Table split function for large table files
#'
#' @param data_file A character vector with one element as the path to the file to split
#' @param nb_comp A numeric vector with one element to specify how many components to split the file into
#' @param axis A numeric vector with one element to specify axis to split (0: rows, 1: columns) (Default: 0)
#' @param header A boolean to include header in data import (Default: FALSE)
#' @param sep A character vector separates values in data table (Default: ',')
#' @param verbose A boolean to print result summary (Default: FALSE)
#'
#' @export
#'
#' @examples
#' \dontrun{
#' tableSplit(data_file = "data/example_data/data.tsv", nb_comp = 2, axis = 0,
#'            header = FALSE, sep = "\t", verbose = FALSE)
#' }
tableSplit = function(data_file, nb_comp, axis = 0, header = FALSE, sep = ',', verbose = FALSE) {
  # create data directory
  data_dir = utils::head(strsplit(data_file, "[.]")[[1]], -1)
  dir.create(data_dir, showWarnings = FALSE)

  # load data
  df = utils::read.table(file = data_file, header = header, sep = sep)
  size = ifelse(axis == 0, nrow(df), ncol(df))
  comp_size = ceiling(size/nb_comp)

  # subset data
  continue = TRUE; iter = 1
  while (continue) {
    # indexes
    start_index = (iter - 1)*comp_size + 1
    end_index = iter*comp_size
    if (end_index > size) {continue = FALSE; end_index = size}
    if (end_index == size) {continue = FALSE; end_index = end_index}
    idx = start_index:end_index

    # subset data
    if (axis == 0) {
      df_tmp = df[idx, ]
    } else {
      df_tmp = df[, idx]
    }

    # save data
    file_path = file.path(data_dir, sprintf("comp_%s.tsv", iter))
    utils::write.table(df_tmp, file_path, sep = "\t", col.names = FALSE, row.names = FALSE)
    iter = iter + 1
  }
  message = paste(
    "Splitting object:",
    paste("  Split:", data_file),
    paste("  Data dimension:", nrow(df), ncol(df)),
    paste("  Number of components:", nb_comp),
    paste0("  Components saved in: ~/", data_dir),
    "", sep = "\n"
  )
  if (verbose) cat(message)
}
