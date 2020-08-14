shinyServer(function(input, output) {

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

















 
})


