(Almost) Daily Plots
================
Conner McBride

About
-----

This repo is a simple container for my practice plots. I work with *ggplot*, *matplotlib*, and *Tableau* primarily to build attractive visualizations. The goal is to build a plot a day and add it to this container. As the title notes, I don't to adding a plot quite everyday...

The Plots
---------

**Plot 4 - May 5, 2018**

This visualization looks at some key performance stats for some of the biggest and most well-known teams in professional hockey.

Data: www.sports-reference.com. Use agreement: <https://www.sports-reference.com/termsofuse.html>

It's also an exploration of slope charts and their implementation in Tableau as well as adding images to the hover tool window. The full dashboard can be experienced [here](https://public.tableau.com/profile/conner.mcbride#!/vizhome/NHLHockeyStatsSlopeChart/Dashboard1?publish=yes).And a snapshot:

![](NHL_viz.png)

**Plot 3 - April 24, 2018**

This plot, a slope chart, was inspired by the walk-through in Ben Jones' *Communicating Data with Tableau*. The dataset is one of the sample sets that comes with Tableau, World Indicators. The dataset worked well for practicing the slope chart but the slope chart isn't necessarily the best choice for some of the indicators that can be selected. Still it was great practice, and I've added an useful plot type to my repertoire. The full dashboard can be experienced [here](https://public.tableau.com/profile/conner.mcbride#!/vizhome/slopechart_exploration/Dashboard1?publish=yes). And a snapshot of the dashboard plotting changes in GDP between 2000 and 2012 on selected countries:

![](slopechart_exploration.png)

**Plot 2 - April 9, 2018**

This plot from a walk-through by Ben Jones in his book *Communicating Data with Tableau*. The full interactive dashboard can be experience [here](https://public.tableau.com/profile/conner.mcbride#!/vizhome/presidents_timeline/Dashboard1?publish=yes). A snapshot of the dashboard:

![](presidents_timeline.png)

**Plot 1 - April 2, 2018**

Not just a plot, this example is a dynamic app that allows the user to select state and year values to plot the geographic distribution of earthquakes by the selected variables. The app uses a live API to query the USGS for historical earthquake data. The API algorithm required some maintaince work and help was provided by [other developers at StackOverflow](https://stackoverflow.com/questions/49545608/r-what-causes-error-when-using-usgs-api?noredirect=1#comment86099289_49545608). The reactive function uses max/min latitude and longitude of the selected state to narrow the query and speed plotting. It then tests each observation point with a "inpolygon" test, before plotting. The app can be experienced [here](https://connermcb.shinyapps.io/quakes_shiny_app/). A snapshot of the app and a sample plot:

![](earthquakes.PNG)

**Plot 0 - March 27, 2018**

This plot is my rendition of a [beautiful line graph](https://www.nytimes.com/interactive/2018/03/23/climate/arctic-ice-maximum.html) published on March 3, 2018 in the New York Times that accompanied an article by KENDRA PIERRE-LOUIS, NADJA POPOVICH and ADAM PEARCE on decreases in arctic sea ice. My plot is an exercise in trying to produce similar results.

The plot was built with ggplot2 in RStudio.The dataset is documented and available from the [National Snow & Ice Data Center](https://nsidc.org/data/search/#keywords=sea+ice/sortKeys=score,,desc/facetFilters=%257B%257D/pageNumber=1/itemsPerPage=25) with compressed csv files for download at a [linked FTP server](ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/).

<img src="README-unnamed-chunk-6-1.png" style="display: block; margin: auto;" />
