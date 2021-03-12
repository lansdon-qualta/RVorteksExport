library(VorteksExport)

cleanup <- function(filename) {
  if(file.exists(filename))
    file.remove(filename)
}

test_that("path is correct", {
  df = data.frame(a=c(1,2,3,4,5), b=c(11,22,33,44,55))
  if(IsWindows()) {
    expect_output(ExportDataframeToVVE(df, 'mydf'), 'Vorteks Export: mydf.vvedf')
    expect_output(ExportDataframeToVVE(df), 'Vorteks Export: dataframe_export.vvedf')
    cleanup("mydf.vvedf")
    cleanup("dataframe_export.vvedf")
  } else {
    expect_error(ExportDataframeToVVE(df), 'Unsupported OS (Windows required)')
  }
})
#> Test passed 😸

test_that("missing dataframe has error", {
  if(IsWindows()) {
    expect_error(ExportDataframeToVVE(), 'Invalid dataframe')
    expect_error(ExportDataframeToVVE(NULL), 'Invalid dataframe')
    expect_error(ExportDataframeToVVE("not a dataframe"), 'Invalid dataframe')
  } else {
    expect_error(ExportDataframeToVVE(df), 'Unsupported OS (Windows required)')
  }
})
#> Test passed 😸

test_that("missing filename has error", {
  df = data.frame(a=c(1,2,3,4,5), b=c(11,22,33,44,55))
  if(IsWindows()) {
    expect_error(ExportDataframeToVVE(df, NULL), 'Invalid filename')
    expect_error(ExportDataframeToVVE(df, ""), 'Invalid filename')
    expect_error(ExportDataframeToVVE(df, df), 'Invalid filename')
  } else {
    expect_error(ExportDataframeToVVE(df), 'Unsupported OS (Windows required)')
  }
})
#> Test passed 😸


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
