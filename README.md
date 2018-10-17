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
Lastly, time permitting, we will be perform a non-traditional market evaluation.  To do so, please install the following packages.

```
install.packages('RCurl')
install.packages('bitops')
install.packages('triangle')
install.packages('XML')
```

To save time, there is a custom package based on the above four libraries. To do so, use the following code *but change the path to the tar.gz file*
```
install.packages("somePath/someFolder/ODSC_west_2018/BoosterBox_0.0.2.tar.gz",
                  repos = NULL, type = "source")
```