rm(list = ls())

my.d <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my.d)

thresh <- 0.95
fix.na <- TRUE
bench_ticker <- '^BVSP'

my_d <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my_d)

my_name <-'B3-stocks'
last_date <- Sys.Date()
first_date <- last_date - 5*365

# get list of ibovespa's tickers from wbsite (does NOT work)

#myUrl <- 'http://www_infomoney_com_br/ibovespa/composicao'

df_ibov <- yfR::yf_collection_get('IBOV',
                                  thresh_bad_data = thresh,
                                  do_complete_data = TRUE)

f.out <- fs::path(
  '../../extdata/data/',
  paste0(my_name, '.csv')
)

readr::write_rds(df_ibov, f_out)
