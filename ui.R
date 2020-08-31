ui <- navbarPage("PG00/024-Registrazioni Non Conformità",
                 theme = shinytheme("cerulean"),
                 
                 tabPanel("Inserimento",
                          
                          fluidPage(
                              useShinyjs(),
                              
                              # Application title
                              titlePanel("Rapporto di Non conformità"),
                              hr(),
                              br(),
                              
                              
                              div(id = "form",
                                  fluidRow( 
                                      column(2, 
                                             textInput("sede", "Identificativo Struttura", "" )),
                                      column(2, 
                                             textInput("Nnc", "Non Conformità N/anno", "")), 
                                      column(2, 
                                             textInput("pnorm", "Rif. al punto schema della PG 00/024 E", "")),
                                      column(2, 
                                             selectInput("origine", "Origine", 
                                                         c("NC da Verif. Isp. Interna", "NC da Verif. Isp. Esterna",
                                                           "OSS da Verif. Isp. Esterna",  "Risultati NC di prova interlaboratorio", 
                                                           "Reclamo", "Altra fonte di NC"))),
                                      column(2, 
                                             textInput("riforigine", "Riferimento Origine*"))),
                                  hr(),
                                  
                                  fluidRow(
                                    
                                          wellPanel(
                                          textAreaInput("descrizione", "Descrizione")), 
                                          
                                          column(4, 
                                                 dateInput("dreg", "Data registrazione")),
                                          column(4,
                                                 textInput("matricola", "Sigla/Matricola",  width = 100))
                                          
                                      ),
                                  hr(), 
                                  
                                  fluidRow(
                                    
                                    
                                  ), 
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  br(),
                                  hr(), 
                                  fluidRow(
                                      column(9,div(align="center",actionButton("submit", "Salva", class = "btn-primary")
                                                   
                                      )),
                                      column(3, shinyjs::hidden(
                                          div(
                                              id = "datainputed_msg",
                                              "Saved",
                                              actionLink("submit_another", "Insert new data")
                                          )
                                      )
                                      ))),
                          )), 
                 tabPanel("Visualizzazione", 
                          
                          DT::dataTableOutput("responsesTable")
                   
                   
                 ))
