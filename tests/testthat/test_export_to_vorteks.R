library(VorteksExport)

cleanup <- function(filename) {
  if(file.exists(filename))
    file.remove(filename)
}

test_that("path is correct", {
  df = data.frame(a=c(1,2,3,4,5), b=c(11,22,33,44,55))
  expect_output(ExportDataframeToVorteks(df, 'mydf'), 'Vorteks Export: mydf.vvedf')
  expect_output(ExportDataframeToVorteks(df), 'Vorteks Export: dataframe_export.vvedf')
  cleanup("mydf.vvedf")
  cleanup("dataframe_export.vvedf")
})
#> Test passed 😸

test_that("missing dataframe has error", {
  expect_error(ExportDataframeToVorteks(), 'Invalid dataframe')
  expect_error(ExportDataframeToVorteks(NULL), 'Invalid dataframe')
  expect_error(ExportDataframeToVorteks("not a dataframe"), 'Invalid dataframe')
})
#> Test passed 😸

test_that("missing filename has error", {
  df = data.frame(a=c(1,2,3,4,5), b=c(11,22,33,44,55))
  expect_error(ExportDataframeToVorteks(df, NULL), 'Invalid filename')
  expect_error(ExportDataframeToVorteks(df, ""), 'Invalid filename')
  expect_error(ExportDataframeToVorteks(df, df), 'Invalid filename')
})
#> Test passed 😸


