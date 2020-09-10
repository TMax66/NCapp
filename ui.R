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
                                                 dateInput("dreg", "Data registrazione", format = "dd-mm-yyyy")),
                                          column(4,
                                                 textInput("matricola", "Sigla/Matricola",  width = 100))
                                          
                                      ),
                                  hr(), 
                                  
                                    wellPanel(
                                      tags$p("Impatto della NC su Attività/Prove"),
                                      fluidRow(
                                        column( 4, 
                                                selectInput("ripetizione", "Ripetizione", c("No", "Si"))),
                                        column( 4, 
                                                selectInput("informazione", "Informazione al cliente", c("No", "Si"))),
                                        column( 4, 
                                                textInput("rifinfo", "Rif. Informazioni"))),
                                        
                                        
                                        fluidRow(  
                                          column(4,
                                                  selectInput("sospensione", "Sospensione attività/prova", c("No", "Si"))), 
                                        column( 4, 
                                                selectInput("valutazione", "Valutazione attività/prova precedenti", c("No", "Si"))),
                                        column( 4, 
                                                selectInput("altro", "Altro", c("No", "Si"))))
                                      ),
                                  hr(), 
                                  fluidRow(
                                  wellPanel(
                                  textAreaInput("cause", "Prima valutazione delle cause")), 
                                  
                                
                                   
                                      column( 4, 
                                              selectInput("azione", "Azione/i", c("Sola Correzione", "Sola AC", "Correzione + AC"), width = 200 )),
                                      
                                      column( 4, 
                                              
                                              textInput("rifac", "Rif. AC.", width = 100))
                                    ),
                                
                                  
                                  hr(), 
                                  
                                  fluidRow( 
                                  wellPanel(
                                  textAreaInput("correzione", "Definizione correzione da attuare subito")),
                                  
                                 
                                 
                                      column(3,
                                             textInput("respcorr", "Responsabile")),
                                      column(3,
                                             dateInput("dtcorr", "data correzione"))
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
                          ), 
                          hr(),
                          div(align="center",
                              downloadButton("report","download Report"))), 
                
                 
                  tabPanel("Visualizzazione", 
                          
                          DT::dataTableOutput("responsesTable")
                   
                   
                 ))
