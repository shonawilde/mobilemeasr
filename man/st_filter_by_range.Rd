% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/st_filter_by_range.R
\name{st_filter_by_range}
\alias{st_filter_by_range}
\title{Function to filter spatial geometries based on a latitude or longitude range}
\usage{
st_filter_by_range(st, min, max, direction = "x")
}
\arguments{
\item{st}{\code{sf} POINTS object.}

\item{min}{Minimum latitude/longitude value.}

\item{max}{Maximum latitude/longitude value.}

\item{direction}{Dimension to filter - either 'x' or 'y'. If 'x' use a longitude range. If 'y' use a latitude range.}
}
\value{
Filtered \code{sf} object.
}
\description{
Function to filter spatial geometries based on a latitude or longitude range
}
\author{
Shona Wilde
}
