install.packages("tidyverse")
install.packages("rves")
install.packages("nycflights13")
library("rvest")
library("tidyverse")

url <- "https://www.20min.ch/"
read_html(url) %>%
  html_elements(css= "a")  %>%
  html_attr("href")     

getwd()


#Relational Data
#Data wrangling cheatsheet: using dplyr and tidyr

View(flights)
View(planes)
total <- merge(flights,planes,by ="tailnum")
join_left <- left_join(flights, planes, by ="tailnum")
join_right <- right_join(flights, planes, by= "tailnum")
View(join_right)
unique(join_left$tailnum)
#There are planes(tailnum) in the flights dataset, that are not in the planes dataset.

ggplot(join_left, aes(x = seats, y = dep_delay, col=seats)) + geom_jitter(size=0.8) + geom_smooth() 

#Data bases in R
install.packages("dbplyr")

#Scraping
#Scraping comes in three variations: Table, Text or hidden in dynamic web page.
library("rvest")
library("tidyverse")

#Delaying the scraping
Sys.sleep(2) #Anzahl Sekunden, während dessen R den prompt unterbricht. Beispiel nachfolgend:
for(i in 1:10){
  cat(i)
  } + Sys.sleep(0.5)

#rvest::read_html()
url_opendata <- rvest::read_html("https://opendata.swiss")

#Exercise 1
css_selector <- ".metainfo__item--date , .metainfo__item--author , .teaser__lead--longformstandard , .teaser__title-name"

read_html("https://www.nzz.ch/") #Parsing (Version 1)
parsed_nzz <- read_html("https://www.nzz.ch/") #Parsing (Version 2)

#Parsing in full
css_selector <-".metainfo__item--date , .metainfo__item--author , 
.teaser__lead--longformstandard , .teaser__title-name"
read_html("https://www.nzz.ch/") %>% html_elements(css = css_selector) %>% html_text()

#Parsing ohne pipe 
page <- read_html("https://www.nzz.ch/")

#Disclosing your identity
install.packages("polite")
install.packages("downloader")
#See also 'Disclosing your identity is polite" in the presentation


##Vorgehen
#1 Get links:
links <- read_html("https://www.nzz.ch/") %>% 
  html_elements(css="a") %>% 
  html_attr(name="href")

#Links sind relativ, deshalb muss die Website zu den Links hinzugefühgt werden

links <- links[10:225] #nur nützliche Links benutzen
str_c("https://www.nzz.ch", links)

#2 Scrape each page (link)


#1 Selector for Watson

watson_selector <- ".lg\:text-6xl"

#2 Get links for Watson

links_watson <- read_html("https://www.watson.ch/") %>% 
  html_elements(css="a") %>% 
  html_attr(name="href")

str_c("https://www.watson.ch", links_watson)

# 2 Scrape each page/article (link)

# 2.1 Create an empty container to place the results

articles_watson <- vector(mode="list", length = length(links_watson))

# 2.2 Looping over the iterator 'i'

for(i in 1:length(links_watson)){
  cat("iteration", i, "\n")
  article [[i]]<- read_html(links[[i]]) %>% 
  html_element(css="p") %>% 
  html_text()
  Sys.sleep(runif(n=1, min = 0.2, max = 0.4))
  }
