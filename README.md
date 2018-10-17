# ODSC_west_2018
Intro to Technical Financial Evaluation with R Resources 

## This repo contains files and scripts used in the ODSC 2018 West.  
The following code will install libraries from CRAN needed to execute scripts.
```
# Vector of CRAN packages
libs<-c('TTR',
        'quantmod',
        'dygraphs',
        'htmltools',
        'PerformanceAnalytics',
        'jsonlite',
        'rpart',
        'randomForest',
        'dplyr',
        'caret',
        'e1071',
        'vtreat',
        'ModelMetrics',
        'rbokeh')


# Get most of the libs
install.packages(libs, 
                 repos = "http://cran.r-project.org")


```
To be on the safe side, you can check for errors by calling each package in a manner similar to below

```
library(TTR)

```
