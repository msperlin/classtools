rm(list = ls())

thresh <- 0.95
fix.na <- TRUE
bench_ticker <- '^BVSP'

my_name <-'ibovespa'
last_date <- Sys.Date()
first_date <- last_date - 15*365

# get list of ibovespa's tickers from wbsite (does NOT work)

#myUrl <- 'http://www_infomoney_com_br/ibovespa/composicao'

df_ibov <- yfR::yf_get(bench_ticker,
                       first_date,
                       last_date,
                       thresh_bad_data = thresh) |>
  na.omit()

f_out <- fs::path(
  'inst/extdata/data/',
  paste0(my_name, '.rds')
)

readr::write_rds(df_ibov, f_out)
