library(tidyverse)
library(shiny)
library(googlesheets4)
library(googledrive)
library(knitr)
library(kableExtra)
library(DT)
library(shinyjs)
library(shinythemes)

# options(gargle_oauth_cache = ".secrets")
# gargle::gargle_oauth_cache()
# drive_auth()
# list.files(".secrets/")
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
# df<-read_sheet(id$id)

fields <- c("sede", "Nnc", "pnorm", "origine", "riforigine", "descrizione", "dreg", "matricola", 
            "ripetizione","informazione","rifinfo","sospensione","valutazione","altro","cause",
            "azione","rifac","correzione","respcorr","dtcorr"
            )

loadData <- function() {
ds<-read_sheet(id$id)}