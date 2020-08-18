library(tidyverse)
library(shiny)
library(googlesheets4)
library(googlesheets)
library(googledrive)
library(knitr)
library(kableExtra)
library(DT)
library(shinyjs)
library(shinythemes)

#LINK A GOOGLEDRIVE####
#IL CODICE SEGUENTE SI FA SOLO LA PRIMA VOLTA CHE SI ACCEDE AL DRIVE DI GOOGLE
# options(gargle_oauth_cache = ".secrets")
# gargle::gargle_oauth_cache()
# drive_auth()
# list.files(".secrets/")

#IMPORTA DATI DAL GDRIVE####
options(
  gargle_oauth_cache = ".secrets",
  gargle_oauth_email = TRUE
)
drive_auth()
gs4_auth(token = drive_token())
mydrive<-drive_find(type = "spreadsheet")
id<-mydrive %>% 
  filter(name=="dtNC") %>% 
  select(2)
dati<-read_sheet(id$id)


#tracciato record
campi <- c("sede", "Nnc", "pnorma", "origine", "riforigine", "descrizione", "dreg", 
           "matricola", "ripetizione", "informazione", "rifinform", "sospensione", "valutazione", "altro", 
           "cause", "azione", "rifAC", "correzione", "respcorr", "dtcorr", "verifica", "dtverif")

#####FUNZIONE LOAD DATA- CARICA IL FILE DOPO L'AGGIUNTA DI NUOVI RECORD#######
loadData <- function() {
  #Sys.sleep(3)
  ds<-read_sheet(id$id)
  
}

#-----------------------------------------------

shinyjs::useShinyjs()