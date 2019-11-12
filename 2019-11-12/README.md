# 2019-11-12: CRAN Code
This is my first attempt at participating in TidyTuesday. This week's dataset is all about the languages used in CRAN package code. The dataset was created by Philippe Massicotte and explained in his article, ["Analyzing the programming languages used in R packages"](https://www.pmassicotte.com/post/analyzing-the-programming-languages-used-in-r-packages/). The TidyTuesday page for this dataset can be accessed [here](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-11-12).

I decided that for my first venture into ggplot, I would create a bar chart to compare how many lines of code, comments, and blanks there are in the top few languages. I created the chart below, which includes the top 10 languages arranged in order of total number of packages. Each language has 3 bars, **code**, **comments**, and **blanks**, which show the number of each type of line per package. (IE: The total number of lines of code in JavaScript was divided by the number of packages written in JavaScript, and then displayed as the code bar on the chart.)

![Image of bar chart explained above.](/2019-11-12/2019-11-12_CRAN_pic.PNG?raw=true)
