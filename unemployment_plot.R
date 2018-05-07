### Daily Plot for May 6, 2018 ###

# Plot of historical unemployment data in the US from 1948 through April 2018

# get packages
library(ggplot2)
library(lubridate)

# get data
t3 <- read.csv("unemployment_data.csv")

# create plot
ggplot() + 
        
        # time series line of unemployment rate
        geom_line(data=t3,
                  aes(x=dt, y=value), 
                  show.legend = F) + 
        
        # point with label for rate April 2018
        geom_point(data=data.frame(x=c(as.Date("2018-04-01")), y = c(3.9)), 
                   aes(x=x, y=y)) +
        geom_text(data=data.frame(x=c(as.Date("2018-04-01")), y = c(3.9)),
                  aes(x=x, y=y, label = paste0(y, "%")),
                  nudge_x = 20, nudge_y = -0.25,
                  size = 4, color="blue") +
        
        # bands for periods of recession
        geom_rect(data=r, aes(xmin=start, xmax=end, ymin=2, ymax=11), 
                  color=NA, fill="grey50", alpha=0.2) +
        
        # labels and titles
        labs(title="US Unemployment Rate", 
             subtitle="Recessions marked by gray bands", 
             y="Unemployment Rate (%)") + 
        
        # reference line for comparing historic precedence of April 2018 rate
        geom_hline(yintercept = 3.9, 
                   size = 1, 
                   color="blue", 
                   alpha=0.5,
                   linetype = 2) +
        
        # axis formatting
        scale_x_date(breaks = seq(as.Date("1945-01-01"),
                                  as.Date("2020-01-01"),
                                  "5 years"),
                     labels = year(seq(as.Date("1945-01-01"),
                                       as.Date("2020-01-01"),
                                       "5 years"))) +
        scale_y_continuous(limits = c(2, 11),
                           breaks = seq(2, 11, by = 2),
                           labels = as.double(seq(2, 11, by = 2))) +
        
        # plot panel formatting
        theme_minimal() + theme(plot.title = element_text(hjust = 0.5, size = 18), 
                           plot.subtitle = element_text(hjust = 0.5, size = 8),
                           axis.line = element_line(),
                           axis.text.x = element_text(size = 10,
                                                      hjust = 1,
                                                      angle = 70),
                           axis.text.y = element_text(size = 10),
                           axis.title.x = element_blank())

