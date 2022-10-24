graphics.off()
rm(list = ls())

asset.codes = c("LFT","LTN", "NTN-B Principal")
first_date <- as.Date("2015-01-01")

dir_temp <- fs::path_temp('TD-files')

GetTDData::download.TD.data(
  asset.codes = asset.codes,
  do.overwrite = F,
  do.clean.up = F,
  dl.folder = dir_temp
)

df_TD <- GetTDData::read.TD.files(dir_temp) |>
  na.omit()

df_TD <- df_TD |>
  dplyr::filter(ref.date >= first_date)

readr::write_rds(df_TD, 'inst/extdata/data/TD-data.rds')
