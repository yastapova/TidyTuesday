cran_code <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-11-12/loc_cran_packages.csv")

library(tidyverse)

by_lang = group_by(cran_code, language)

pkg_summary = summarise(by_lang, 
  pkgs = n(), 
  code = sum(code, na.rm=TRUE),
  blanks = sum(blank, na.rm=TRUE),
  comments = sum(comment, na.rm=TRUE), 
  files = sum(file, na.rm=TRUE))

pkg_summary = pkg_summary[order(-pkg_summary$pkgs),]

pkg_summary$code = pkg_summary$code / pkg_summary$pkgs
pkg_summary$blanks = pkg_summary$blanks / pkg_summary$pkgs
pkg_summary$comments = pkg_summary$comments / pkg_summary$pkgs

library(reshape2)

melted = melt(pkg_summary[1:10,c("language", "code", "comments", "blanks")], id.vars="language")

chart = melted %>%
  ggplot(aes(x = language, y = value, fill=variable)) +
  geom_col(position="dodge") +
  scale_y_continuous(expand = c(0, 0)) +
  xlab(NULL) +
  ylab("Lines per Package") +
  labs(title = "Lines of Code, Comments, and Blanks per Language in CRAN Packages") +
  labs(subtitle = "Top 10 languages arranged by descending number of packages") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5),
        axis.line.x.bottom = element_line(color = "black", size = 0.1),
        axis.line.y.left = element_line(color = "black", size = 0.1),
        panel.grid.major.x = element_blank(),
        panel.background = element_rect(fill = NA),
        panel.ontop = TRUE,
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

print(chart)