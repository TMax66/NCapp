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
formData <- reactive({
    data <- sapply(campi, function(x) input[[x]])
    data <- as.data.frame(t(data))
    data
})
#######Codice per salvare nel  file del drive  i nuovi dati inseriti #####
saveData <- function(data) {
    dati <- read_sheet(id$id)
    sheet_append(dati,  data)
}


##############CODICI PER LE AZIONI LEGATE AL BOTTONE DELLA PARTE DI INTRODUZIONE DATI- PRIMA FORM#############
observeEvent(input$submit, {
    saveData(formData())
    shinyjs::reset("form")
    # output$responsesTable <- DT::renderDataTable(
    #     loadData(),
    #     rownames = FALSE,filter='top',
    #     options = list(searching = TRUE, lengthChange = FALSE)) 
    #shinyjs::hide("form")
    shinyjs::show("datainputed_msg")
})
observeEvent(input$submit_another, {
    shinyjs::show("form")
    shinyjs::hide("datainputed_msg")
    # write.csv(x = loadData(), file = file.path(getwd(), "backup.csv"),
    #             row.names = FALSE)
})   

session$onSessionEnded(function() {
    stopApp()
    #q("no")
    
})













 
})


