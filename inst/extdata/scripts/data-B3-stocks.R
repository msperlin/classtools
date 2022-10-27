set.seed(10)

thresh <- 0.95
fix.na <- TRUE
bench_ticker <- '^BVSP'
n_stocks <- 30
my_name <-'B3-stocks'
last_date <- Sys.Date()
first_date <- last_date - 5*365

# get list of ibovespa's tickers from wbsite (does NOT work)

#myUrl <- 'http://www_infomoney_com_br/ibovespa/composicao'
ibov <- yfR::yf_index_composition("IBOV")

tickers <- paste0(
  sample(
    ibov$ticker,
    n_stocks
  ), '.SA')

df_ibov <- yfR::yf_get(tickers,
                       first_date,
                       last_date,
                       thresh_bad_data = thresh)

df_ibov <- df_ibov |>
  na.omit() |>
  dplyr::select(ref_date, ticker,
                price_adjusted, price_close,
                ret_adjusted_prices)

f_out <- fs::path(
  'inst/extdata/data/',
  paste0(my_name, '.rds')
)

readr::write_rds(df_ibov, f_out)
