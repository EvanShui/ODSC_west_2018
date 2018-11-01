#' Author: Ted Kwartler
#' Date: 11-1-2018
#' Purpose: Lending Club Modeling Scoring and Plotting
#'

# WD
setwd("C:/Users/Edward/Desktop/odsc blogs/presentation/ODSC_west_2018/workshop_data/LC")

# Options
options(scipen=999)

# Libraries
library(rpart)
library(randomForest)
library(dplyr)
library(caret)
library(e1071)
library(vtreat)
library(rbokeh)

# I/O
df <- read.csv('20K_sampleLoans.csv') 

# Load the treatment plan
plan <- readRDS( "treatmentPlan_fit3.rds")

# Load the model
fit3 <- readRDS( "LogRegCV_fit3.rds" )

# Get the unseen records
# Partitioning 
set.seed(1234)
num <- (nrow(df) %/% 10) * 8
idx <- sample(1:nrow(df), num)

validationDF <- df[-idx,]

# Data Prep
validationDF$revol_util <- gsub('%', '', validationDF$revol_util) %>%
  as.character() %>% 
  as.numeric()


validationDF$int_rate   <- gsub('%', '', validationDF$int_rate)   %>%
  as.character() %>% 
  as.numeric()

treatedValidation <- prepare(plan, validationDF)

# Chk
ncol(df)
ncol(treatedValidation)

# Predictions
newPreds <- predict(fit3, treatedValidation )

# Conf Matrix
table(newPreds, treatedValidation$y)

# But we want probs!
noteProbs <- predict(fit3, treatedValidation, type = c('prob') )

# Append to original note Interest Rate
results <- data.frame(reward    = treatedValidation$int_rate_clean,
                      prb0  = noteProbs$`0`,
                      prb1  = noteProbs$`1`)
head(results)

# Sort to top probability of success
results <- results[order(results$prb1, decreasing = T),]
head(results,40)

# Plot
p <- figure() %>%
  ly_points(prb0, reward, data = results,
            hover = list(prb0, prb1, reward))
p

# End