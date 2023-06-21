#list of packages to install

install.packages("tidyverse")
install.packages("CommunityCompassion")
install.packages("data.table")
install.packages("dplyr")

#load the packages

library(tidyverse)
library(CommunityCompassion)
library(data.table)
library(dplyr)

#read data

community_data <- read.csv("data/community_data.csv", header = TRUE)

#data cleaning

community_data = community_data %>%
  na.omit() %>%
  select(-c(X, ID))

#summarize the data by subgroups

community_data_summary <- community_data %>%
  group_by(subgroup) %>%
  summarise(total_count = n(),
              avg_income = mean(income))

#plot the data for visualization

ggplot(data = community_data, 
       aes(x = subgroup, 
           y = income, 
           fill = subgroup)) + 
  geom_bar(stat = "identity", 
           position = "dodge") +
  scale_y_continuous(limits = c(0, max(community_data$income))) +
  labs(x = "Subgroup",
       y = "Income (USD)",
       fill = "Subgroup")

#create function to identify impact of subtype on income

impact_function <- function(Subgroup, Income) {
  if (Subgroup == "A" && Income > 2000) {
    print("Subgroup A has high income")
  } else if (Subgroup == "B" && Income > 2000) {
    print("Subgroup B has high income")
  } else {
    print("Subgroup does not have high income")
  }
}

#apply impact_function to the data

community_data %>%
  mutate(impact = impact_function(Subgroup, Income)) %>%
  head()

#create new column for classification

community_data$class <- ifelse(community_data$income >= 2000, "High", "Low")

#use lm to identify correlation between subgroup and income

model <- lm(income ~ Subgroup, data = community_data)
summary(model)

#predict the income for subgroup

pred_income <- predict(model, newdata = data.frame(Subgroup = "A"))
cat("The predicted income for Subgroup A is:", pred_income)

#create function to detect outliers

outlier_detect_function <- function(x) {
  lower_bound <- mean(x) - 3*sd(x)
  upper_bound <- mean(x) + 3*sd(x)
  outlier_list <- NULL
  for (i in x) {
    if (i < lower_bound || i > upper_bound) {
      outlier_list <- c(outlier_list, i)
    }
  }
  return(outlier_list)
}

#apply outlier_detect_function

outlier_detect_function(community_data$income)

#create a function to create a dataframe of subgroup and income

create_dataframe_function <- function (x, y) {
  df <- data.frame (x, y) 
  df_ordered <- df [order(df$x, df$y),]
  return(df_ordered)
}

#apply create_dataframe_function

create_dataframe_function(community_data$Subgroup, community_data$Income)