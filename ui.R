ui<-navbarPage("PG00/024-Registrazioni Non Conformità",
               theme = shinytheme("cerulean"),
               
 tabPanel("Inserimento",
    div(id = "form",
    fluidPage(
    sidebarLayout(
     sidebarPanel(width = 4,
         
         textInput("sede", "Identificativo Struttura", "" ), 
         textInput("Nnc", "Rapporto Non Conformità N/anno", ""), 
         textInput("pnorma", "Riferimento al punto schema della PG 00/024 E", ""), 
         selectInput("origine", "Origine", 
                     c("NC da Verif. Isp. Interna", "NC da Verif. Isp. Esterna",
                    "OSS da Verif. Isp. Esterna",  "Risultati NC di prova interlaboratorio", 
                    "Reclamo", "Altra fonte di NC")), 
         textInput("riforigine", "Riferimento Origine*"),
         
    ),
    
      mainPanel(
         textAreaInput("descrizione", "Descrizione", ""), 
         fluidRow( 
             column(4, 
         dateInput("dreg", "Data registrazione")),
             column(4,
         textInput("matricola", "Sigla/Matricola",  width = 100))
         ),
         hr(),
         wellPanel(
         tags$p("Impatto della NC su Attività/Prove"),
         fluidRow(
             column( 3, 
                     selectInput("ripetizione", "Ripetizione", c("No", "Si"))),
             column( 3, 
                     selectInput("informazione", "Informazione al cliente", c("No", "Si"))),
             column( 3, 
                     textInput("rifinfo", "Rif. Informazioni")),
           
         
         fluidRow(  
             column( 3,
                   selectInput("sospensione", "Sospensione attività/prova", c("No", "Si")))), 
             column( 3, 
                     selectInput("valutazione", "Valutazione attività/prova precedenti", c("No", "Si"))),
             column( 3, 
                     selectInput("altro", "Altro", c("No", "Si")))
         ),
         ),
         hr(), 
         textAreaInput("cause", "Prima valutazione delle cause"), 
         
         wellPanel(
           fluidRow(
             column( 4, 
            selectInput("azione", "Azione/i", c("Sola Correzione", "Sola AC", "Correzione + AC"), width = 200 )),
            
            column( 4, 
  
            textInput("rifac", "Rif. AC.", width = 100))
           )
         ), 
         
         hr(), 
         textAreaInput("correzione", "Definizione correzione da attuare subito"),
    
         wellPanel(
           fluidRow(
             column(3,
                    textInput("respcorr", "Responsabile")),
             column(3,
                    dateInput("dtcorr", "data correzione"))
           )
           
         ), 

         fluidRow(
           column(9,div(align="center",actionButton("submit", "Salva", class = "btn-primary")
                        
           )),
           
           column(3, shinyjs::hidden(
             div(
               id = "datainputed_msg",
               "Dati inseriti",
               actionLink("submit_another", "Inserisci nuova NC")
             )
           )
           )),
         
         hr(),
         div(
           
           p("",
             a(href="https://docs.google.com/spreadsheets/d/1ibH5c78LTkyb2DiyPEMKsYOny0GG750bjGlciP13VXM/edit?usp=sharing",
               "Modifica dati"),align="center", style = "font-size:12pt")
         ),
         hr(),
         
     )
                        )
               )
    )
    ),
 
 
 
 
 
#########################################################          
               tabPanel("Visualizzazione",
                        sidebarLayout(
                            sidebarPanel(),
                            mainPanel()
                        )
               ), 
               
               tabPanel("Archivio",
                        sidebarLayout(
                            sidebarPanel(),
                            mainPanel()
                        )
               ), 
               
               tabPanel("....",
                        sidebarLayout(
                            sidebarPanel(),
                            mainPanel()
                        )
               )     
)         

