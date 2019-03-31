# Data Mining Notes -- Notes and Hints on Data Manipulation for Economics

*[under construction]*

In these notes I plan to summarize a bit of my knowledge on data mining for applications in empirical research in economics using R. Topics covered are GIS data, text data and (very basic) web scraping. Most of what I share here I learned while doing RA jobs during in my graduate studies.

They are not supposed to be state-of-the-art methods, but instead a summary of methods that I use, are (relatively) efficient and do their job. Overall, I expect you to be familiar with data manipulation (e.g. merging, appending, reshaping, collapsing, for/while loops). A good starting point for beginners is Simon Ejdemyr's tutorials for basic R.

## Overview

1. [GIS Data](#GIS-Data:)
    - Basics: vector and raster data, grids/fishnets, plotting geo-data;
    - Reading GIS: importing shape files into R, geocoding a dataset;
    - GIS Operations: overlay, buffer zones, zonal statistics, calculating distances.

2. Text Mining:
    - Basic String Operations: concatenating, splitting, etc.;
    - Text Cleaning: removing stop words, lemmatizing, etc.;
    - Importing Texts into R: loading .txt and .pdfs, OCR;
    - Building Data from Texts: time series of count of words, (un)supervised learning methods for text data classification.

3. Web Scraping:
    - Basic WS: extracting text information from web pages;
    - Filling out forms and retrieving information;
    - Using API platforms for efficient (and fast) data retrieving.

4. Others:
    - Data sources for Develop./Pol Economics;
    - Useful R functions;
    - (even) Faster GIS Zonal Stats with Google Earth Engine.

## GIS Data:

GIS is an acronym for *Geographic Information System*, i.e. systems that allows one to handle data with *spatial/geographic* characteristics. In practice, here, it will refer to data that stand for geographic objects (with coordinates). The goals of these notes is to introduce how to create, manipulate and export data of this kind in R.

### Basics:
