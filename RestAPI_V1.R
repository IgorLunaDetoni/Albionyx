
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

test<-read.csv("../DadosTeste/test.xlsx")

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






#* @serializer csv
#* @post /csv
function(req) {
  req$rook.input$rewind()
  f <- tempfile()
  writeLines(req$rook.input$read_lines(), f)
  df <- read.csv(f)
  response <- list(response = df)
  response
}

library(httr)
library(readr)

write.csv(mtcars, "mtcars.csv")
req <- POST("http://127.0.0.1:8833/csv", body = upload_file("mtcars.csv"))
content(req)

