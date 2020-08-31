shinyServer(function(input, output, session) {

#REPORT####
###Funzione per produrre e scaricare il il pdf del report###

output$download <- downloadHandler(
        filename = "listing.pdf",
        content = function(f) {
            e <- new.env()
            # For each of the data sets selected, get the variable based on the string
            #e$datasets <- lapply(input$datasets, get)
            rmarkdown::render('report.Rmd', output_format = rmarkdown::pdf_document(),
                              output_file=f,
                              envir = e)
        }
    )  


###############Codice per popolare i campi nel dataframe ############# 

fields <- reactive({c("sede", "Nnc", "pnorma", "origine", "riforigine", "descrizione", "dreg", 
           "matricola", "ripetizione", "informazione", "rifinform", "sospensione", "valutazione", "altro", 
           "cause", "azione", "rifAC", "correzione", "respcorr", "dtcorr", "verifica", "dtverif")
})


formData <- reactive({
    data <- sapply(fields(), function(x) input[[x]])
    data <- as.data.frame(t(data))
    data
})
#######Codice per salvare nel  file del drive  i nuovi dati inseriti #####
saveData <- function(data) {
    ss <- as_sheets_id(id$id)
    sheet_append(ss,  data, sheet = 1)
}


##############CODICI PER LE AZIONI LEGATE AL BOTTONE DELLA PARTE DI INTRODUZIONE DATI#############

observeEvent(input$submit, {
     saveData(formData())
     shinyjs::reset("form")
     shinyjs::show("datainputed_msg")
})

observeEvent(input$submit_another, {
    shinyjs::show("form")
    shinyjs::hide("datainputed_msg")
    
})   

session$onSessionEnded(function() {
    stopApp()
    #q("no")
    
    


    
    
    
})













 
})


