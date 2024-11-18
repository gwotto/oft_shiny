library(shiny)

group.by <- c("cluster", "stage")

ui <- fluidPage(
  
  titlePanel(
    "Single-Cell Analysis of the Developing Mouse Cardiac Outflow Tract"
  ),
  
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("group", label = "Label",
                   choices = c("cluster", "stage")),#, selected = "cluster"),
      actionButton("goDp", "Go!")
    ),

    mainPanel(
      plotOutput("dp", width = "400px")
    )

  ),

  
  
  sidebarLayout(
    sidebarPanel(
      textInput("gene", "Gene symbol, e.g. Cxcr4", value = "Cxcr4"),
      actionButton("goGp", "Go!")
    ),
    
    mainPanel(
      plotOutput("gp", width = "400px")
    )
  )

)
