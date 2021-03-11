#' Export dataframe to Vorteks Visualization Environment (VVE)
#' @export
#' @param df dataframe variable
#' @param filename name of exported file variable
#' @importFrom utils write.table
ExportDataframeToVVE <- function(df, filename = "dataframe_export") {
  ExportDataframeToVorteks(df, ".vvedf", filename)
}

#' Export dataframe to Vorteks Data Manager (VDM)
#' @export
#' @param df dataframe variable
#' @param filename name of exported file variable
#' @importFrom utils write.table
ExportDataframeToVDM <- function(df, filename = "dataframe_export") {
  ExportDataframeToVorteks(df, ".vdmdf", filename)
}

#' Export dataframe to Vorteks Processing Environment (VPE)
#' @export
#' @param df dataframe variable
#' @param filename name of exported file variable
#' @importFrom utils write.table
ExportDataframeToVPE <- function(df, filename = "dataframe_export") {
  ExportDataframeToVorteks(df, ".vpedf", filename)
}

#' Export dataframe to Vorteks Visualization Environment
#' @param df dataframe variable
#' @param extension must be one of supported extensions (.vvedf, .vpedf, .vdmdf)
#' @param filename name of exported file variable
#' @importFrom utils write.table
ExportDataframeToVorteks <- function(df, extension, filename = "dataframe_export") {

  # validate operating system
  if(!IsWindows())
    stop("Unsupported OS (Windows required)")

  # Validate dataframe arg
  if(missing(df) || is.null(df) || !is.data.frame(df))
    stop("Invalid dataframe")

  # Validate filename arg
  if(is.null(filename) || !(is.character(filename) && length(filename) == 1) || nchar(filename) < 1)
    stop("Invalid filename")

  check <- tryCatch({
    #create filename with vorteks dataframe extension
    path <- paste(filename, extension, sep = "")

    # Write dataframe to current working directory
    write.table(df, path, sep = ",", row.names = FALSE)

    # open saved file - Should open Vorteks if appropriate version is installed via file association
    shell.exec(path)

    print(paste("Vorteks Export:", path))
  },
  warning = function(war)
  {
    print(paste("Vorteks Export WARNING:", war))
  },
  error = function(err)
  {
    print(paste("Vorteks Export ERROR:", err))
  },
  finally = function(f)
  {
    #    print(paste("Vorteks Export: ", path))
  })
}

#' Test for Windows OS
IsWindows <- function() {
  if(Sys.info()[['sysname']] == 'Windows') {
    print("OS: Windows")
    return(TRUE)
  } else {
    print("OS: UNSUPPORTED (Windows required)")
    return(FALSE)
  }
}
