library(tidyverse)
library(ggplot2)
library(plotly)

econ <- Economist_Assignment_Data
head(econ)
econ
colnames(econ)

pointslabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                 "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                 "India", "Italy", "China", "South Africa", "Spane",
                 "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                 "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                 "New Zealand", "Singapore",'Norway','Finland', 'France', 'Germany',
                 "Uganda", "Turkey", "Sweden", "Paraguay")

cpihdi <- ggplot(econ, aes(x = CPI, y = HDI, color = Region)) +
  geom_point(pch = 1, size = 2.5, alpha = 0.75) +
  geom_smooth(aes(group = 1), method = 'lm', formula = y ~ log(x), se = TRUE, color = 'blue') +
  geom_text(aes(label = Country), color = "gray20", data = subset(econ, Country %in% pointslabel) 
              , check_overlap = TRUE) +
  scale_x_continuous(name = 'Corruption Perception Index', breaks = 1:12) +
  scale_y_continuous(name = 'Human Development Index') +
  ggtitle(label = 'Corruption & Human Development')

cpihdi <- ggplotly(cpihdi)







