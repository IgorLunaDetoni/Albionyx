
# Carregar pacotes --------------------------------------------------------
library(dplyr)
library(forecast)
library(FinTS)
library(tseries)
library(ggplot2)
library(tidyverse)
library(tsfgrnn)
library(plumber)
library(Rook)


# Return message input ----------------------------------------------------

#* Status Check
#* @param msg The message to echo
#* @get /echo

Check <-function(msg="") {
  list(msg = paste0("Im listenning, export data in csv format '", msg, "'"), time = Sys.time())
}







# Carregar os dados usando o ROOK abaixo e ver como que é feito pra linkar o caminho da pasta e colocar um exemplo
# Usar o result como saida para transformar em time series e rodar o modelo.

#* parse csv file
#* @param req the request object
#* @post /file

function(req) {
  file <- Rook::Multipart$parse(req)$req$tempfile
  result <- read.csv(file)
  result
}
# Variáveis da Rest API e conexão -----------------------------------------



# Teste de carregamento de dados ------------------------------------------


#* parse csv file
#* @param req the request object
#* @post /file










# Primeiro modelo ---------------------------------------------------------



# Adicione um conjunto de dados 
#* @apiTitle Holt winters
#* predição
#* @post /predict/values

function(req){
  
  req<-as.data.frame(req) %>% na.omit()
  
  dt$date <- as.Date(req$date, "%d/%m/%Y")
  

  ciclos<-dt[, .N, by=year(date)] 
  ciclos$N
  mean(ciclos$N)
  sum(ciclos$N == x)
  
  
  # Transformando em time series
  
  dt %>% 
    # transform to date format with lubridate
    mutate(Data = ymd(Data())) %>% 
    # find min and max
    summarise(min = min(Data),
              max = max(Data))
  
  dfts <- ts(dt$Valor, 
             frequency=round(length(mean(ciclos$N))/sum(ciclos$N == x)),
             start=dt %>% summarise(min(date)))
  
  # Modelo
  HW1 <- HoltWinters(dfts)
}

