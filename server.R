server <- function(input, output, session) {
    
   ####codice per inserire il nuovo record######
    formData <- reactive({
        data <- sapply(fields, function(x) input[[x]])
        data <- as.data.frame(t(data))
        data
    })

    #######Codice per salvare nel  file del drive  i nuovi dati inseriti #####
    saveData <- function(data) {
        ss <- as_sheets_id(id$id)
        sheet_append(ss,  data, sheet = 1)
    }
    
    #####action after save button press####
    
    observeEvent(input$submit, {
        saveData(formData())
        output$responsesTable <- DT::renderDataTable(
        loadData(),
        rownames = FALSE,class = 'cell-border stripe',
        options = list(searching = TRUE, lengthChange = FALSE))
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
    
######REPORT####
###Funzione per produrre e scaricare il il pdf del report###
    
    output$report <- downloadHandler(
        filename = "NC.pdf",
        content = function(f) {
            e <- new.env()
            # For each of the data sets selected, get the variable based on the string
            #e$datasets <- lapply(input$datasets, get)
            rmarkdown::render('report.Rmd', output_format = rmarkdown::pdf_document(),
                              output_file=f,
                              envir = e)
        }
    )  
    
    
}
