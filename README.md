# Data Mining Notes -- Notes and Hints on Data Manipulation for Economics

*[under construction]*

In these notes I plan to summarise a bit of my knowledge on data mining for applications in empirical research in economics using R. Topics covered are GIS data, text data and (very basic) web scraping. Most of what I share here I learned while doing RA jobs during in my graduate studies.

They are not supposed to be state-of-the-art methods, but instead a summary of methods that I use, are (relatively) efficient and do their job. Overall, I expect you to be familiar with R basics and standard data manipulation concepts (e.g. merging, appending, reshaping, collapsing, for/while loops). A good starting point for beginners is Simon Ejdemyr's [tutorials](https://sejdemyr.github.io/r-tutorials/basics/) for basic R.

## Overview

1. [GIS Data:](#gis-data)
    - Basics: vector and raster data, grids/fishnets, plotting geo-data;
    - Reading GIS: importing shape files into R, geocoding a dataset;
    - GIS Operations: overlay, buffer zones, zonal statistics, calculating distances.

2. [Text Mining:](#text-mining)
    - Basic String Operations: concatenating, splitting, etc.;
    - Text Cleaning: removing stop words, lemmatising, etc.;
    - Importing Texts into R: loading .txt and .pdfs, OCR;
    - Building Data from Texts: time series of count of words, (un)supervised learning methods for text data classification.

3. [Web Scraping:](#web-scraping)
    - Basic WS: extracting text information from web pages;
    - Filling out forms and retrieving information;
    - Using API platforms for efficient (and fast) data retrieving.

4. [Others:](#others)
    - Data sources for Develop./Pol Economics;
    - Useful R functions;
    - (even) Faster GIS Zonal Stats with Google Earth Engine.

## GIS Data:

GIS is an acronym for *Geographic Information System*, i.e. systems that allows one to handle data with *spatial/geographic* characteristics. In practice, here, it will refer to data that stand for geographic objects (with coordinates). The goals of these notes is to introduce how to create, manipulate and export data of this kind in R. All of the tasks shown here are available in the `gis.R` file.

### Basics:

GIS data are usually available in vector or raster formats. The former stands for objects whose spatial representation is either in points (e.g. coordinates of a set of cities), lines (roads connecting cities) or polygons (borders of a country). The latter stands for data represented by an image, whose pixel (a square) represents a location (I will be more specific about it when creating data of this type).

The distinction of different types of GIS data is important when creating data: you must know which type of data you will be creating. The `rgdal` and `sp` packages in R contain most of the needed functions for vector basic data creation and manipulation. The `raster` package instead is used for dealing with raster data.

*[put here image of different types of GIS data]*

#### Creating and plotting GIS data:

To create vector GIS data, you need to input its coordinates (and eventually the dataset) using a set of `rgdal` functions. For raster data, you will need the *extent* of your raster, together with its *resolution* and the data of each pixel. For both, you will need to set the projection of your geo-data, also know as CRS. In practice, the most important you need to know is to use always the same so to make your objects compatible to one another. Read more about it here.

To set your CRS, use the function `CRS()`:

```r
install.packages('rgdal')   # do this only once
library(rgdal)
crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")
```

Suppose we have a dataset with the coordinates of some cities. This data is stored in the folder 'data/'. Let us load into R:

```r
df <- read.csv2('data/citydata.csv')
> df
city longitude  latitude
1      Sao Paulo -46.63333 -23.55000
2 Rio de Janeiro -43.19639 -22.90833
3       Campinas -47.05722 -22.90083
4 Angra dos Reis -44.31806 -23.00667
5 Belo Horizonte -43.93333 -19.91667
6       Curitiba -49.25000 -25.41667
```

To geocode and plot these cities in the latitude/longitude space, we use the convenient function `Spatial...()`, where `...` refer to the type of data you will be creating. To create a set of points with the coordinates of the cities, we use `SpatialPoints()`, whose inputs must be the coordinates *as a matrix*  as the CRS we previously created. To plot it, we just use the function `plot()`.

```r
spdf.points <- SpatialPoints(coords = as.matrix(df[,c('longitude', 'latitude')]), proj4string = crs.geo)
# plotting it:
plot(spdf.points)
```

To create line data instead, one needs to create the coordinates of the line as a `LinesList` and use it in the `SpatialLines()` command:

```r
# Creating line data with the first 3 points:
llist = list(Lines(Line(as.matrix(df[1:3,c('longitude', 'latitude')])), ID = 'id'))
spdf.line <- SpatialLines(LinesList = llist, proj4string = crs.geo)
# plotting it:
plot(spdf.line, add=T) # I add it to the previous plot
```

Note that the line object created with the first 3 rows of the coordinates' data is indeed a segment of line connecting them. Finally, to create a polygon, again ones need to only input the coordinates. The coordinate of the first point must be repeated at the end so to "close" the polygon:



## Text Mining:

The text mining tools explained in the next are techniques to retrieve information from text. Most of the times, the idea is to build a data set which will be later used in econometric applications. Text is stored as a string, called `character` in `R`. To create a string object, put the text within quotes:
```r
str <- 'text mining'
str
[1] "text mining"
```

### Basic Operations:

A common operation with strings is to concatenate two strings, used with the `paste()` function:
```r
paste(str, 'is cool')
[1] "text mining is cool"
```
By standard, the concatenation adds a whitespace between the two strings. You can change that by using the `sep=` option. The command `paste0()` does the same but adding no separator:
```r
paste(str, 'is cool', sep='-')
[1] "text mining-is cool"
paste0(str, 'is cool')
[1] "text miningis cool"
```
Another common operation is to split strings, done with the `strsplit()` function:
```r
strsplit(str, split = ' ')
[[1]]
[1] "text"   "mining"
```
The second input of the function is the reference string that the function is going to lookf for to split the string. Note that the output is a list, not a vector. This allows for splitting vectors of strings, e.g.
```r
str <- c(str, 'is not cool')
str
[1] "text mining" "is not cool"
strsplit(str, ' ')
[[1]]
[1] "text"   "mining"

[[2]]
[1] "is"   "not"  "cool"
```
provides a list of two elements, each of which with one of the strings divided accordingly. Another way to split a string is to do so by the position of the characters, using the function `substr()`:
```r
str <- 'text mining'
substr(str,1,4)
[1] "text"
```


## Web Scraping:

content of WS

## Others:

content of others.
