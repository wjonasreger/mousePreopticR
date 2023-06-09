% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tableSplit.R
\name{tableSplit}
\alias{tableSplit}
\title{Table split function for large table files}
\usage{
tableSplit(
  data_file,
  nb_comp,
  axis = 0,
  header = FALSE,
  sep = ",",
  verbose = FALSE
)
}
\arguments{
\item{data_file}{A character vector with one element as the path to the file to split}

\item{nb_comp}{A numeric vector with one element to specify how many components to split the file into}

\item{axis}{A numeric vector with one element to specify axis to split (0: rows, 1: columns) (Default: 0)}

\item{header}{A boolean to include header in data import (Default: FALSE)}

\item{sep}{A character vector separates values in data table (Default: ',')}

\item{verbose}{A boolean to print result summary (Default: FALSE)}
}
\description{
Table split function for large table files
}
\examples{
\dontrun{
tableSplit(data_file = "data/example_data/data.tsv", nb_comp = 2, axis = 0,
           header = FALSE, sep = "\t", verbose = FALSE)
}
}
