rm(list = ls())

library(XML)
library(ggplot2)
library(xlsx)
library(reshape2)
library(dplyr)
library(BatchGetSymbols)

save.df <- TRUE
format.out <- 'wide' # long or wide
format.out <- 'long' # long or wide
threshBadData <- 0.95
fix.na <- TRUE
bench.ticker <- '^GSPC'

my.d <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my.d)

my.name <-'SP500_comp'
last.date <- Sys.Date()
first.date <- last.date - 5*365

# get list of ibovespa's tickers from wbsite (does NOT work)

#myUrl <- 'http://www.infomoney.com.br/ibovespa/composicao'
 
df_SP500 <- GetSP500Stocks()
tickers <- df_SP500$Tickers

# get list from xls

# my.f <- '2016.11.11 Ibovespa.xls'
# df <- XML::readHTMLTable(my.f)[[1]]
# colnames(df) <- c('codigo','acao','tipo','qtd','part')
# tickers <-as.character(df$codigo)
# tickers <- paste(tickers, '.SA', sep = '')
# tickers <- tickers [1:(length(tickers )-2)]
# tickers <- c(tickers, bench.ticker)

# download each data

l.out <- BatchGetSymbols(tickers = tickers,
                         first.date = first.date,
                         last.date = last.date, freq.data = 'yearly',
                         bench.ticker = bench.ticker, thresh.bad.data = threshBadData )

l.out$df.control

df.tickers <- na.omit(l.out$df.tickers)

f.out <- paste0(my.name,'_YEARLY_', format.out, '_',first.date, '_', last.date,'.rds')
saveRDS(object = df.tickers, file = f.out)
#save('df.tickers',file = f.out)
