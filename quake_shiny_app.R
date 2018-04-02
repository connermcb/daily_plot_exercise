#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# get requisite packages
library(ggplot2)
library(readr)
library(dplyr)
library(maps)
library(cowplot)
library(lubridate)
library(shiny)
library(sp)
library(maptools)
library(SDMTools)
library(plotly)

get_quake_data <- function(output_format="csv",
                           starttime=today()-180,
                           endtime=today(),
                           minlatitude=27,
                           minlongitude=-103,
                           maxlatitude=33,
                           maxlongitude=-100,
                           minmagnitude=2.5,
                           maxmagnitude=10){
  
  # compose API request
  base_url <- "https://earthquake.usgs.gov/fdsnws/event/1/query?"
  
  # add format arg
  api_url <- paste0(base_url, "format=", output_format)
  
  # add start, end times
  api_url <- paste0(api_url, "&starttime=", starttime)
  api_url <- paste0(api_url, "&endtime=", endtime)
  
  # set longitude range
  api_url <- paste0(api_url, "&minlongitude=", minlongitude)
  api_url <- paste0(api_url, "&maxlongitude=", maxlongitude)
  
  # set latitude range
  api_url <- paste0(api_url, "&minlatitude=", minlatitude)
  api_url <- paste0(api_url, "&maxlatitude=", maxlatitude)
  
  # set magnitude range
  api_url <- paste0(api_url, "&minmagnitude=", minmagnitude)
  api_url <- paste0(api_url, "&maxmagnitude=", maxmagnitude)
  
  return(api_url)
}

test_pnt_in_ploy <- function(map_poly, pnt_df){

  test_poly <- as.matrix(map_poly[ , 1:2])
  test_coords <- as.matrix(pnt_df[, c("longitude", "latitude")])

  idxs <- pnt.in.poly(test_coords, test_poly)[ , "pip"]
  idxs <- as.logical(idxs)

  new_df <- pnt_df[idxs, ]

  return(new_df)
}


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Earthquakes by State and Year"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        
        selectInput("state_adjust",
                    "Select State",
                    choices = state.name[!(state.name %in% 
                                             c("Alaska", "Hawaii"))],
                    selected = "California",
                    multiple = TRUE
                   ),
      
      
         selectInput("year_adjust",
                     "Select Year",
                     choices = 1968:2018, 
                     selected = 2018, 
                     multiple = FALSE,
                     selectize = TRUE, 
                     width = NULL, 
                     size = NULL
                     )
        
                     
        
      ),
      # Show a plot of the generated distribution
      mainPanel(
         plotlyOutput("quake_plot")
      )
   ))


# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  
   
   output$quake_plot <- renderPlotly({
     
     # get base-map with UI input
     base_map <- map_data("state", regions = tolower(input$state_adjust))
     
     # get bounding box
     w_e <- range(base_map$long)
     s_n <- range(base_map$lat)
     
     # scrape USGS data
     strt_time <- as.Date(paste(input$year_adjust, "01/01", sep = "/"))
     end_time <- as.Date(paste(input$year_adjust, "12/31", sep = "/"))
     data_url <-   get_quake_data(starttime = strt_time, 
                                  endtime = min(today(), end_time),
                                  minlatitude = s_n[[1]], maxlatitude = s_n[[2]],
                                  minlongitude = w_e[[1]], maxlongitude = w_e[[2]],
                                  minmagnitude = 2.5, maxmagnitude = 10)
     quake_data <- read_csv(data_url)

     quake_data <- test_pnt_in_ploy(base_map, quake_data)

     quake_data <- quake_data %>%
                   arrange(mag)
     
     
      # create plot
      p <- ggplot() +
        geom_polygon(data=base_map,
                     aes(x=long, y=lat, group=group),
                     color="black", fill = "grey90", size = 1.5) +
      
        geom_point(data=quake_data,
                   aes(x=longitude, y=latitude, color=mag, 
                       text=paste0("M ", mag, " - ", place,
                                  "\nTime: ", time, 
                                  "\nLocation: ", round(latitude, 3), " N, ",
                                                  round(longitude, 3)*-1, " W",
                                  "\nDepth: ", depth, " km"
                                  )),
                   alpha=1, size=4, shape=17) +
      
        scale_color_continuous(name="Earthquake \nMagnitude",
                               high = "yellow", low = "blue",
                               limits = c(2.5, 5.5),
                               breaks = seq(from=2.5, to=5.5, by=1),
                               guide = guide_colorbar(barwidth = 1,
                                                      barheight = 10,
                                                      title.position = "left",
                                                      label.vjust = 0.5)) +
      
      ggtitle(paste(input$state_adjust, "-", input$year_adjust)) +
        # labs(caption = paste("Total Number of Earthquakes =",
        #                      quake_data$cnt)) 
      coord_map() +
        
      theme_void() +
      theme(plot.title = element_text(hjust = 0.5, size = 26),
                  plot.caption = element_text(hjust = 0, size=14),
                  legend.position = c(-0.25,-0.25),
                  legend.text = element_text(size=12),
                  legend.title = element_text(size=12))
        
      ggplotly(p, tooltip="text")
      
        })
})

# Run the application 
shinyApp(ui = ui, server = server)

