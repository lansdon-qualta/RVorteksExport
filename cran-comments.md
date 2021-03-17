RESUBMISSION

- Please rather use the Authors@R field and declare Maintainer, Authors 
and Contributors with their appropriate roles with person() calls.
FIXED

- Please always write package names, software names and API (application 
programming interface) names in single quotes in title and description. 
FIXED

- Please always explain all acronyms in the description text.
FIXED

- Please add () behind all function names in the description texts 
(DESCRIPTION file). e.g: --> example()
Did not find instances of this?

- Please add \value to .Rd files regarding exported methods and explain 
the functions results in the documentation. Please write about the 
structure of the output (class) and also what the output means. (If a 
function does not return a value, please document that too, e.g. 
\value{No return value, called for side effects} or similar)
Missing Rd-tags:
      ExportDataframeToVDM.Rd: \value
      ExportDataframeToVorteks.Rd: \value
      ExportDataframeToVPE.Rd: \value
      ExportDataframeToVVE.Rd: \value

FIXED
