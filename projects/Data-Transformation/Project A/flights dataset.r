# 5 Questions ask about flights dataset
## Load the library
library(nycflights13)

View(flights)
glimpse(flights)

## 5 Question
### 1.) Which airlines had the top 5 most on-time flights?
ontime_flights <- flights %>%
  filter(dep_delay <= 0) %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(5)

print(ontime_flights)

### 2.) What are the top 5 most-flown destinations?
top_destinations <- flights %>%
  count(dest) %>%
  arrange(-n) %>%
  head(5)

print(top_destinations)

### 3.) Which airlines had the top 5 most delayed flights (dep_delay > 60)?
delayed_flights_by_airline <- flights %>%
  filter(dep_delay > 60) %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(5)

print(delayed_flights_by_airline)

### 4.) What are the top 5 airlines with the longest average departure delay?
average_delay_by_airline <- flights %>%
  group_by(carrier) %>%
  summarize(average_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(-average_dep_delay) %>%
  head(5)

print(average_delay_by_airline)

### 5.) Which airlines operated the top 5 most flights on July 1st?
flights_on_july1 <- flights %>%
  filter(month == 7, day == 1) %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(5)
