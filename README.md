# Data Mining Notes -- Notes and Hints on Data Manipulation for Economics

*[under construction]*

In these notes I plan to summarise a bit of my knowledge on data mining for applications in empirical research in economics using R. Topics covered are GIS data, text data and (very basic) web scraping. Most of what I share here I learned while doing RA jobs during in my graduate studies.

They are not supposed to be state-of-the-art methods, but instead a summary of methods that I use, are (relatively) efficient and do their job. Overall, I expect you to be familiar with R basics and standard data manipulation concepts (e.g. merging, appending, reshaping, collapsing, for/while loops). A good starting point for beginners is Simon Ejdemyr's tutorials for basic R.

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

```{r}
install.packages('rgdal')   # do this only once
library(rgdal)
crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")
```

Suppose we have a dataset of some cities, its coordinates and some further information.

## Text Mining:

content of text mining

## Web Scraping:

content of WS

## Others:

content of others.
