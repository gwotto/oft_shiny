library(shiny)
library(Seurat)

load(file = '../data/heart-data-cxcr4.RData')



server <- function(input, output, session) {
  gp <- eventReactive(input$goGp, {
    
    validate(
      need(!is.na(match(input$gene, row.names(heart.data.cxcr4))), 
          
           paste("Your query \"", input$gene, "\" is not contained in the dataset. Please use MGI gene symbols, with the correct capitalisation (e.g. Cxcr4, Wnt4 etc.)", sep = "")
      )
    )
      FeaturePlot(heart.data.cxcr4, features = input$gene, reduction = "umap")
  })
    
  output$gp <- renderPlot({
    gp()
  })
  
  dp <- eventReactive(input$goDp, {
    
    group <- input$group
    
    if (group == "cluster") {
      DimPlot(heart.data.cxcr4, reduction = "umap")
      ## apparently 2two "if" tests do mnot work here, have to use "else"
    } else {
      
      ## if (group == "stage") {
      DimPlot(heart.data.cxcr4, reduction = "umap", group.by = "orig.ident")
    }
    
  })
  
  output$dp <- renderPlot({
    dp()
  })
  
  
  }

