# SQL in R



# Materials

Where to find the materials:

Reference/cheat sheet:

- http://swcarpentry.github.io/sql-novice-survey/reference.html

Software Carpentry Material (where the survey data comes from)

- http://swcarpentry.github.io/sql-novice-survey/

Aaron's material:

- basic SQL: http://dads2busy.github.io/2012/05/SQL
- SQL in R: http://dads2busy.github.io/2012/05/RPostgreSQLCommands
- Using SQL and RPostgreSQL: http://dads2busy.github.io/2012/05/ConnectPostgreSQL


```r
library(RPostgreSQL)
```

```
## Loading required package: DBI
```

```r
# disconnect all previous connections to the DB and create a new connection
drv <- dbDriver("PostgreSQL")
all_cons <- dbListConnections(drv)
for (con in all_cons){dbDisconnect(con)}

con <- dbConnect(drv,
                 dbname="surveydata",
                 host="localhost",
                 port=5432,
                 user="chend",
                 password="chend")
```

# Selecting Data


```r
dbGetQuery(con, "SELECT * FROM person;")
```

```
##   row.names    ident  personal   family
## 1         1     dyer   William     Dyer
## 2         2       pb     Frank  Pabodie
## 3         3     lake  Anderson     Lake
## 4         4      roe Valentina  Roerich
## 5         5 danforth     Frank Danforth
```


```r
df <- dbGetQuery(con, "SELECT * FROM person;")
df
```

```
##   row.names    ident  personal   family
## 1         1     dyer   William     Dyer
## 2         2       pb     Frank  Pabodie
## 3         3     lake  Anderson     Lake
## 4         4      roe Valentina  Roerich
## 5         5 danforth     Frank Danforth
```

```r
dbGetQuery(con, "SELECT COUNT(*) FROM person;")
```

```
##   count
## 1     5
```

```r
dbGetQuery(con, "SELECT * FROM survey ORDER BY taken ASC, person DESC;")
```

```
##    row.names taken person quant reading
## 1          2   619   dyer   sal    0.13
## 2          1   619   dyer   rad    9.82
## 3          3   622   dyer   rad    7.80
## 4          4   622   dyer   sal    0.09
## 5          7   734     pb  temp  -21.50
## 6          5   734     pb   rad    8.41
## 7          6   734   lake   sal    0.05
## 8          9   735   <NA>   sal    0.06
## 9         10   735   <NA>  temp  -26.00
## 10         8   735     pb   rad    7.22
## 11        11   751     pb   rad    4.35
## 12        12   751     pb  temp  -18.50
## 13        13   751   lake   sal    0.10
## 14        17   752    roe   sal   41.60
## 15        16   752   lake  temp  -16.00
## 16        14   752   lake   rad    2.19
## 17        15   752   lake   sal    0.09
## 18        20   837    roe   sal   22.50
## 19        18   837   lake   rad    1.46
## 20        19   837   lake   sal    0.21
## 21        21   844    roe   rad   11.25
```

# filtering data

```r
# filtering
dbGetQuery(con, "SELECT * from visited WHERE site = 'DR-1';")
```

```
##   row.names ident site      dated
## 1         1   619 DR-1 1927-02-08
## 2         2   622 DR-1 1927-02-10
## 3         8   844 DR-1 1932-03-22
```

```r
dbGetQuery(con, "SELECT ident FROM visited WHERE site = 'DR-1';")
```

```
##   ident
## 1   619
## 2   622
## 3   844
```

```r
dbGetQuery(con, "SELECT * FROM visited WHERE site = 'DR-1' AND dated < '1930-01-01'")
```

```
##   row.names ident site      dated
## 1         1   619 DR-1 1927-02-08
## 2         2   622 DR-1 1927-02-10
```

```r
dbGetQuery(con, "SELECT * FROM survey WHERE person = 'lake' OR person = 'roe'")
```

```
##    row.names taken person quant reading
## 1          6   734   lake   sal    0.05
## 2         13   751   lake   sal    0.10
## 3         14   752   lake   rad    2.19
## 4         15   752   lake   sal    0.09
## 5         16   752   lake  temp  -16.00
## 6         17   752    roe   sal   41.60
## 7         18   837   lake   rad    1.46
## 8         19   837   lake   sal    0.21
## 9         20   837    roe   sal   22.50
## 10        21   844    roe   rad   11.25
```

```r
dbGetQuery(con, "SELECT * FROM sUrVeY WHERE person IN ('lake', 'roe')")
```

```
##    row.names taken person quant reading
## 1          6   734   lake   sal    0.05
## 2         13   751   lake   sal    0.10
## 3         14   752   lake   rad    2.19
## 4         15   752   lake   sal    0.09
## 5         16   752   lake  temp  -16.00
## 6         17   752    roe   sal   41.60
## 7         18   837   lake   rad    1.46
## 8         19   837   lake   sal    0.21
## 9         20   837    roe   sal   22.50
## 10        21   844    roe   rad   11.25
```

```r
# make a new calculation
dbGetQuery(con, "SELECT 1.05*reading FROM survey WHERE quant = 'rad';")
```

```
##   ?column?
## 1  10.3110
## 2   8.1900
## 3   8.8305
## 4   7.5810
## 5   4.5675
## 6   2.2995
## 7   1.5330
## 8  11.8125
```

```r
# round
# sum
# avg/ mean

dbGetQuery(con, "SELECT * FROM visited;")
```

```
##   row.names ident  site      dated
## 1         1   619  DR-1 1927-02-08
## 2         2   622  DR-1 1927-02-10
## 3         3   734  DR-3 1939-01-07
## 4         4   735  DR-3 1930-01-12
## 5         5   751  DR-3 1930-02-26
## 6         6   752  DR-3       <NA>
## 7         7   837 MSK-4 1932-01-14
## 8         8   844  DR-1 1932-03-22
```

```r
dbGetQuery(con, "SELECT * FROM visited WHERE dated < '1930-01-01';")
```

```
##   row.names ident site      dated
## 1         1   619 DR-1 1927-02-08
## 2         2   622 DR-1 1927-02-10
```

```r
dbGetQuery(con, "SELECT * FROM visited WHERE dated IS NULL")
```

```
##   row.names ident site dated
## 1         6   752 DR-3  <NA>
```

```r
dbGetQuery(con, "SELECT *
                 FROM visited
                 WHERE dated IS NOT NULL")
```

```
##   row.names ident  site      dated
## 1         1   619  DR-1 1927-02-08
## 2         2   622  DR-1 1927-02-10
## 3         3   734  DR-3 1939-01-07
## 4         4   735  DR-3 1930-01-12
## 5         5   751  DR-3 1930-02-26
## 6         7   837 MSK-4 1932-01-14
## 7         8   844  DR-1 1932-03-22
```

```r
# paste0
# paste
# sprintf
q <- "SELECT * FROM visited WHERE dated IS NOT NULL LIMIT 1;"
dbGetQuery(con, q)
```

```
##   row.names ident site      dated
## 1         1   619 DR-1 1927-02-08
```

```r
q <- sprintf('SELECT * FROM %s WHERE dated IS NOT NULL %s;',
             'visited',
             'LIMIT 1')
dbGetQuery(con, q)
```

```
##   row.names ident site      dated
## 1         1   619 DR-1 1927-02-08
```

# Combining tables

```r
dbGetQuery(con,
           "SELECT site.lat, site.long, visited.dated
           FROM site
           JOIN visited
           ON site.name = visited.site")
```

```
##      lat    long      dated
## 1 -49.85 -128.57 1927-02-08
## 2 -49.85 -128.57 1927-02-10
## 3 -47.15 -126.72 1939-01-07
## 4 -47.15 -126.72 1930-01-12
## 5 -47.15 -126.72 1930-02-26
## 6 -47.15 -126.72       <NA>
## 7 -48.87 -123.40 1932-01-14
## 8 -49.85 -128.57 1932-03-22
```

```r
dbGetQuery(con,
           "SELECT s.lat, s.long, v.dated
           FROM site as s
           JOIN visited as v
           ON s.name = v.site")
```

```
##      lat    long      dated
## 1 -49.85 -128.57 1927-02-08
## 2 -49.85 -128.57 1927-02-10
## 3 -47.15 -126.72 1939-01-07
## 4 -47.15 -126.72 1930-01-12
## 5 -47.15 -126.72 1930-02-26
## 6 -47.15 -126.72       <NA>
## 7 -48.87 -123.40 1932-01-14
## 8 -49.85 -128.57 1932-03-22
```

```r
q <- "SELECT site.lat, visited.dated
FROM site
JOIN visited
ON   site.name=visited.site;" 
dbGetQuery(con, q)
```

```
##      lat      dated
## 1 -49.85 1927-02-08
## 2 -49.85 1927-02-10
## 3 -47.15 1939-01-07
## 4 -47.15 1930-01-12
## 5 -47.15 1930-02-26
## 6 -47.15       <NA>
## 7 -48.87 1932-01-14
## 8 -49.85 1932-03-22
```

```r
# join 3 tables and filter on non-NULL values
q <- "SELECT site.lat, site.long, visited.dated, survey.quant, survey.reading
FROM site
JOIN visited
ON   site.name = visited.site
JOIN survey
ON  visited.ident = survey.taken
WHERE visited.dated IS NOT NULL;"
dbGetQuery(con, q)
```

```
##       lat    long      dated quant reading
## 1  -49.85 -128.57 1927-02-08   sal    0.13
## 2  -49.85 -128.57 1927-02-08   rad    9.82
## 3  -49.85 -128.57 1927-02-10   sal    0.09
## 4  -49.85 -128.57 1927-02-10   rad    7.80
## 5  -49.85 -128.57 1932-03-22   rad   11.25
## 6  -47.15 -126.72 1939-01-07  temp  -21.50
## 7  -47.15 -126.72 1939-01-07   rad    8.41
## 8  -47.15 -126.72 1930-01-12  temp  -26.00
## 9  -47.15 -126.72 1930-01-12   sal    0.06
## 10 -47.15 -126.72 1930-01-12   rad    7.22
## 11 -47.15 -126.72 1930-02-26   sal    0.10
## 12 -47.15 -126.72 1930-02-26  temp  -18.50
## 13 -47.15 -126.72 1930-02-26   rad    4.35
## 14 -47.15 -126.72 1939-01-07   sal    0.05
## 15 -48.87 -123.40 1932-01-14   sal    0.21
## 16 -48.87 -123.40 1932-01-14   rad    1.46
## 17 -48.87 -123.40 1932-01-14   sal   22.50
```

# Write dataframe back to database

```r
# write a df to the db
# dbWriteTable(con,"newTable",dframe)
```

