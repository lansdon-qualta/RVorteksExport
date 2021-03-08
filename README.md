# RVorteksExport
Export a dataframe to Vorteks Visualization Environment

Example usage when importing the R package from github:
```
library(devtools)
install_github('lansdon-qualta/RVorteksExport')
library(RVorteksExport)

df = data.frame(a=c(1,2,3,4,5), b=c(11,22,33,44,55))
ExportDataframeToVorteks(df, "mydf")
```

Note: A current version of Vorteks is required for this to work! (Later than 3/2021)
