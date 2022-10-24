graphics.off()
rm(list = ls())

library(GetTDData)
library(ggplot2)
library(xlsx)
library(dplyr)

myFolder <- dirname(rstudioapi::getActiveDocumentContext()$path)
  
#myFolder <-'/home/msperlin/Dropbox/Computer Code/R Code/Finance Related Code/Download Tesouro Direto/'
setwd(myFolder)

asset.codes = NULL

GetTDData::download.TD.data(
  asset.codes = asset.codes,
  do.overwrite = F,
  do.clean.up = F
)

df <- read.TD.files(maturity = NULL)

saveRDS(object = df, file = paste0('TDData_ALL_', Sys.Date(), '.rds'))
