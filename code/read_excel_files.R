library(readxl)

my_excel_df <- read_excel("~/my/excel/file.xls",
                          sheet = "control", # what sheet? or you can leave blank
                          col_names = TRUE,  # is there a header column?
                          na = "NA", # what are the missing values
                          skip = 0) # do you want to skip any rows from the top?
