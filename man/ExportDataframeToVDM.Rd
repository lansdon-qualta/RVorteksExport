% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExportToVorteks.R
\name{ExportDataframeToVDM}
\alias{ExportDataframeToVDM}
\title{Export dataframe to 'Vorteks Data Manager (VDM)'}
\usage{
ExportDataframeToVDM(df, filename = "dataframe_export")
}
\arguments{
\item{df}{dataframe variable}

\item{filename}{name of exported file variable}
}
\value{
(No return value, called to perform export process)
}
\description{
A .vdmdf file will be written to the current working directory.
In windows, the file will be executed in an attempt to launch 'Vorteks Data Manager (VDM)'
}
