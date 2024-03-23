#Load libraries
library(rvest)
library(tidyverse)

#scraping watson 

read_html("https://www.watson.ch/")

css.selector <- "h2"

read_html("https://www.watson.ch/") %>%
  html_elements(css=css.selector) %>%
  html_text()

#getting the links
read_html("https://www.watson.ch/") %>%
  html_elements(css="a") %>% #Wieso ist css="a"
  html_text()

#getting the attributes
links <- read_html("https://www.watson.ch/") %>%
  html_elements(css="a") %>%
  html_attr(name="href") #Wieso ist html_attr(name="href")

links <- str_c("https://www.watson.ch/", links)

#scraping each page 

#1. creating an empty container to place the results
articles <- vector(mode="list", length=length(links))

#3. loop over the iterator i with random time intervals

for(i in 1:length(links)){
  cat("iteration", i, "\n")
  articles[[i]] <- read_html(links[i]) %>%
    html_elements(css="css.selector") %>% #Muesste das nicht ein andere Selektor sein, der für die einzelnen Links gilt? Mit dem css.selector wurde definiert, dass alle Link auf Watson genommen werden. Hier muss nun definiert werden, nach was in den einzelnen Links gesucht wird. Nicht?
    html_text()
  Sys.sleep(runif(n=1, min=0.2,max=0.4))
}
View(articles)
