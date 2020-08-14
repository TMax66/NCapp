ui<-navbarPage("PG00/024-Registrazioni Non Conformità",
               theme = shinytheme("cerulean"),
               
 tabPanel("Inserimento",
    div(id = "form",
    fluidPage(
    sidebarLayout(
     sidebarPanel(width = 4,
         
         textInput("sede", "Identificativo Struttura", "" ), 
         textInput("Nconf", "Rapporto Non Conformità N/anno", ""), 
         textInput("norma", "Riferimento al punto schema della PG 00/024 E", ""), 
         selectInput("orig", "Origine", 
                     c("NC da Verif. Isp. Interna", "NC da Verif. Isp. Esterna",
                    "OSS da Verif. Isp. Esterna",  "Risultati NC di prova interlaboratorio", 
                    "Reclamo", "Altra fonte di NC")), 
         fluidRow(
             column(6, 
                    textInput("rif1", "Rif. VI:n/anno/n.prog")),
             column(6, 
                    textInput("rif2", "Rif. VIE:ORG/anno/n.di.n."))),
         fluidRow(
             column(6, 
                    textInput("rif3", "Rif. VIE-OSS:ORG/anno/n.di.n.")),
             column(6, 
                    textInput("rif4", "Rif. PV:anno/id.circuito"))), 
         fluidRow(
             column(6, 
                    textInput("rif5", "Rif. Reclamo: N./anno"))
                    ),
    ),
    
      mainPanel(
         textAreaInput("descr", "Descrizione", ""), 
         fluidRow( 
             column(4, 
         dateInput("reg", "Data registrazione")),
             column(4,
         textInput("matr", "Sigla/Matricola",  width = 100))
         ),
         hr(),
         wellPanel(
         tags$p("Impatto della NC su Attività/Prove"),
         fluidRow(
             column( 3, 
                     selectInput("rip", "Ripetizione", c("No", "Si"))),
             column( 3, 
                     selectInput("info", "Informazione al cliente", c("No", "Si"))),
             column( 3,
                     selectInput("Sospensione dell'attività/prova", "Ripetizione", c("No", "Si")))
         ),
         
         fluidRow(  
             column( 3, 
                     selectInput("val", "Valutazione attività/prova precedenti", c("No", "Si"))),
             column( 3, 
                     selectInput("alt", "Altro", c("No", "Si")))
         ),
         ),
         hr(), 
         textAreaInput("cause", "Prima valutazione delle cause"), 
         
         wellPanel(
            selectInput("azione", "Azione/i", c("Sola Correzione", "Sola AC", "Correzione + AC")), 
            hr(),
            textInput("rifac", "Rif. AC.")
         ), 
         
         hr(), 
         textAreaInput("corr", "Definizione correzione da attuare subito"))
         
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
