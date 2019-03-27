# Data Mining Notes -- Notes and Hints on Data Manipulation for Economics

In these notes I plan to summarize a bit of my knowledge on data mining for applications in empirical research in economics using R. Topics covered are GIS data, text data and (very basic) web scraping. Most of what I share here I learned while doing RA jobs in my graduate studies.

They are not supposed to be state-of-the-art methods of dealing with data, but instead a summary of methods I used that turned out to very efficient and do their job. Overall, I expect you to be familiar with data manipulation (e.g. merging, appending, reshaping, collapsing, for/while loops). A good starting point for beginners is Simon Ejdemyr's tutorials for basic R.

## Overview

1. GIS Data
  - Basics: vector and raster data, grids/fishnets, plotting geo-data;
  - Reading GIS: importing shape files into R;
  - GIS Operations: overlay, buffer zones, zonal statistics, calculating distances;
  - Others.

2. Text Mining:
  - Basic String Operations: concatenating, splitting, etc.;
  - Text Cleaning: removing stop words, lemmatizing, etc.;
  - Importing Texts into R: loading .txt and .pdfs, OCR;
  - Building Data from Texts: time series of count of words, (un)supervised learning methods for data classification.

3. Web Scraping:
  - Basic ws: extracting text information from web pages;
  - Filling out forms and retrieving information;
  - Using API for efficient (and fast) data retrieving.
