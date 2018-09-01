(Almost) Daily Plots
================
Conner McBride

About
-----

This repo is a simple container for my practice plots. I work with *ggplot*, *matplotlib*, and *Tableau* primarily to build attractive visualizations. The goal is to build a plot a day and add it to this container. As the title notes, I don't to adding a plot quite everyday...

The Plots
---------

**Plot 15 August 30, 2018** It's fallen out of vogue because it's difficult to interpret accurately, but the pie plot can still work well to show the proportional differences of a variable with two or three levels. A study of pie charts from *Graphing Data with R*.

<img src="README-unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

**Plot 14 - August 29, 2018** Study of bar plot orientation and spacing from *Graphing Data with R*.

<img src="README-unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

**Plot 13 - August 28, 2018** Bar Plot exercise from *Graphing Data with R*.

<img src="README-unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

Spine Plot

<img src="README-unnamed-chunk-4-1.png" style="display: block; margin: auto;" />

**Plot 12 - August 26, 2018** Cumulative distribution plot from *Graphing Data with R*.

<img src="README-unnamed-chunk-5-1.png" style="display: block; margin: auto;" />

**Plot 11 - August 23, 2018** Practice of density plot and cumulative distribution plot from *Graphing Data with R*.

<img src="README-unnamed-chunk-6-1.png" style="display: block; margin: auto;" />

<img src="README-unnamed-chunk-7-1.png" style="display: block; margin: auto;" />

**Plot 10 - August 22, 2018** Study of histograms from *Graphing Data with R*.

<img src="README-unnamed-chunk-8-1.png" style="display: block; margin: auto;" />

![](README-unnamed-chunk-9-1.png)

![](README-unnamed-chunk-10-1.png)

<img src="README-unnamed-chunk-11-1.png" style="display: block; margin: auto;" />

<img src="README-unnamed-chunk-12-1.png" style="display: block; margin: auto;" />

**Plot 9 - August 17, 2018** Practicing with *Graphing Data with R*, a mainstay of single variable EDA, the boxplot.

<img src="README-unnamed-chunk-13-1.png" style="display: block; margin: auto;" /><img src="README-unnamed-chunk-13-2.png" style="display: block; margin: auto;" /><img src="README-unnamed-chunk-13-3.png" style="display: block; margin: auto;" />

**Plot 8 - August 16, 2018** Still working with *Graphing Data with R*. Next chart is a dot plot that adds another dimension over the simple strip plot.

<img src="README-unnamed-chunk-14-1.png" style="display: block; margin: auto;" />

**Plot 7 - August 15, 2018** Picked up Hilfiger's *Graphing Data with R*. To start the simple strip plot used for getting a quick look at the distribution and density of a variable.

<img src="README-unnamed-chunk-15-1.png" style="display: block; margin: auto;" />

**Plot 7 - June 6, 2018** Surveying the repertoire of basic Tableau charts. Practicing plots and here is the highlight chart with and without text.

!["Highlight Table with Text"](highlight_table_text.png)

!["Highlight Table with Text Removed"](highlight_table_no_text.png)

**Plot 6 - May 18, 2018** A simple visualization using the [`elliplot` package](https://github.com/cran/elliplot) by Shinichiro Tomizono.The `ellipseplot` function that produces a correlation chart and visualizes the effect of factors on the relationship between the two principal variables. This plot is to test the capabilities of the function and is not optimized in terms of formatting.

<img src="README-unnamed-chunk-16-1.png" style="display: block; margin: auto;" />

**Plot 5 - May 6, 2018** This visualization was a duplication exercise of a [plot in the NYTimes](https://www.nytimes.com/2018/05/04/business/economy/jobs-report.html). It was created using ggplot2.

<img src="README-unnamed-chunk-17-1.png" style="display: block; margin: auto;" />

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

    #> Warning: package 'bindrcpp' was built under R version 3.5.1

<img src="README-unnamed-chunk-23-1.png" style="display: block; margin: auto;" />
