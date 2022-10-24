set.seed(10)

thresh <- 0.95
fix.na <- TRUE
bench_ticker <- '^GSPC'

my_name <-'SP500-stocks-yearly'
n_stocks <- 50
last_date <- Sys.Date()
first_date <- last_date - 10*365

# get list of ibovespa's tickers from wbsite (does NOT work)

#myUrl <- 'http://www_infomoney_com_br/ibovespa/composicao'

sp500 <- yfR::yf_index_composition("SP500")

tickers <- sample(
  sp500$ticker,
  n_stocks
)

df_sp500 <- yfR::yf_get(tickers,
                        first_date,
                        last_date,
                        thresh_bad_data = thresh,
                        freq_data = 'yearly')

df_sp500 <- df_sp500 |>
  dplyr::select(ticker, ref_date, price_close, price_adjusted, ret_adjusted_prices) |>
  na.omit()

f_out <- fs::path(
  'inst/extdata/data/',
  paste0(my_name, '.rds')
)

readr::write_rds(df_sp500, f_out)
