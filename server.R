server <- function(input, output, session) {
    
    # loadData <- function() {
    #     ds<-read_sheet(id$id)
    # }
    
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
    

    
    
}
