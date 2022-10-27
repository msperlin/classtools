set.seed(10)

thresh <- 0.95
fix.na <- TRUE
bench_ticker <- '^GSPC'

my_name <-'SP500-stocks'
n_stocks <- 30
last_date <- Sys.Date()
first_date <- last_date - 5*365

# get list of ibovespa's tickers from wbsite (does NOT work)

#myUrl <- 'http://www_infomoney_com_br/ibovespa/composicao'

sp500 <- yfR::yf_index_composition("SP500")

tickers <- c(
  sample(sp500$ticker,
         n_stocks),
  '^GSPC')

df_sp500 <- yfR::yf_get(tickers,
                        first_date,
                        last_date,
                        thresh_bad_data = thresh)

df_sp500 <- df_sp500 |>
  dplyr::select(ref_date,
                ticker,
                price_close,
                price_adjusted,
                ret_adjusted_prices) |>
  na.omit()

f_out <- fs::path(
  'inst/extdata/data/',
  paste0(my_name, '.rds')
)

readr::write_rds(df_sp500, f_out)
