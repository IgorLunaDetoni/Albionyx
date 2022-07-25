
# Carregar pacotes --------------------------------------------------------
library(dplyr)
library(forecast)
library(FinTS)
library(tseries)
library(ggplot2)
library(tidyverse)
library(tsfgrnn)
library(plumber)


# Return message input ----------------------------------------------------

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="") {
  list(msg = paste0("Im listenning, export data in csv format '", msg, "'"))
}


#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
  as.numeric(a) + as.numeric(b)
}


# Variáveis da Rest API e conexão -----------------------------------------



# Run Models --------------------------------------------------------------



