% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tableMerge.R
\name{tableMerge}
\alias{tableMerge}
\title{Table merge function for table component files}
\usage{
tableMerge(data_dir, axis = 0, verbose = FALSE)
}
\arguments{
\item{data_dir}{A character vector with one element as the path to the directory of components to merge}

\item{axis}{A numeric vector with one element to specify axis to merge (0: rows, 1: columns) (Default: 0)}

\item{verbose}{A boolean to print result summary (Default: FALSE)}
}
\value{
A Data.Frame dataset
}
\description{
Table merge function for table component files
}
\examples{
\dontrun{
tableMerge(data_dir = "data/example_data/data", axis = 0, verbose = FALSE)
}
}
