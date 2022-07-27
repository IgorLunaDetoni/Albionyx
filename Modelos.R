# Carregar pacotes --------------------------------------------------------


list.of.packages <- c("tseries", "tsfgrnn","ggplot2", "jsonlite","plumber","tidyverse")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
if (!require("plumber")) install.packages("plumber")
if (!require("jsonlite")) install.packages("jsonlite")
if (!require("dplyr")) install.packages("dplyr")
if (!require("tseries")) install.packages("tseries")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("tsfgrnn")) install.packages("tsfgrnn")

# if (!require("plumber")) install.packages("plumber")
# if (!require("jsonlite")) install.packages("jsonlite")
# if (!require("dplyr")) install.packages("dplyr")
# if (!require("tseries")) install.packages("tseries")
# if (!require("ggplot2")) install.packages("ggplot2")
# if (!require("tsfgrnn")) install.packages("tsfgrnn")





# Tratamento de dados -----------------------------------------------------



# Wed Jul 27 14:01:43 2022 ------------------------------


# Pra ver os ciclos anuais

library(data.table)
dt <- fread("listing_id    date    city    type    host_id availability
703451  25/03/2013  amsterdam   Entire_home/apt 3542621 245
703451  20/04/2013  amsterdam   Entire_home/apt 3542621 245
703451  28/05/2016  amsterdam   Entire_home/apt 3542621 245
703451  15/07/2013  amsterdam   Entire_home/apt 3542621 245
703451  30/07/2016  amsterdam   Entire_home/apt 3542621 245
703451  19/08/2013  amsterdam   Entire_home/apt 3542621 245")
dt$date <- as.Date(dt$date, "%d/%m/%Y")

# Dessa forma temos os ciclos anuais
ciclos<-dt[, .dias, by=year(date)] 
ciclos$.dias
mean(ciclos$.dias)













