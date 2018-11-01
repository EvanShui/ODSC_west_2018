#' Author: Ted Kwartler
#' Date: 6-22-2018
#' Purpose: Simple Moving Avg Example As Indicator
#'

# Opts
options(scipen=999)

# Libs
library(TTR)
library(quantmod)
library(PerformanceAnalytics)

# Get Kapstone Paper & Packaging
getSymbols("KS")
KS <- KS['2018-03-01/2018-06-22']

# Calculate the moving Avgs
KSma10 <- SMA(KS$KS.Close, 10)

# Construct a trading rule
df <-data.frame(KS$KS.Close,KSma10)
df$tradeSig <- Lag(ifelse(df$KS.Close > df$SMA  , 1, 0)) 
# not discussing short (-1)
?Lag


# Examine
tail(df,25)

# Now let's do it for a longer backtest
getSymbols("KS")
KS <- KS['2018-01-01/']
KSma10 <-SMA(KS$KS.Close, 10)
tradeSignal <- Lag(ifelse(KS$KS.Close > KSma10  , 1, 0))
ret <- ROC(Cl(KS))*tradeSignal #Rate of Change TTR::ROC()


# Review your return
charts.PerformanceSummary(ret)

# Now let's be knight cap and switch a sign!
tradeSignal <- Lag(ifelse(KS$KS.Close < KSma10  , 1, 0))
ret <- ROC(Cl(KS))*tradeSignal 

# Review your return
charts.PerformanceSummary(ret)

# End
