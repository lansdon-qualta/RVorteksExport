#' Export dataframe to Vorteks Visualization Environment
#' @export
#' @param df dataframe variable
#' @param filename name of exported file variable
#' @importFrom utils write.table
ExportDataframeToVorteks <- function(df, filename = "dataframe_export") {

  # Validate dataframe arg
  if(missing(df) || is.null(df) || !is.data.frame(df))
    stop("Invalid dataframe")

  # Validate filename arg
  if(is.null(filename) || !(is.character(filename) && length(filename) == 1) || nchar(filename) < 1)
    stop("Invalid filename")

  check <- tryCatch({
    #create filename with vorteks dataframe extension
    path <- paste(filename,".vvedf", sep = "")

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
