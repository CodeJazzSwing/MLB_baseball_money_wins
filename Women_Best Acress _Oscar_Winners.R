oscars <- read.table("YOUR_FILE_PATH", header = TRUE, sep = ",")
library(ggplot2)
library(plotly)

# Create the plot
p <- ggplot(oscars, aes(x= Year, y=Age)) + 
  geom_point(aes(text = paste("Name: ", Name, "<br>Year: ", Year, "<br>Age: ", Age)), color="blue", size=3) + 
  geom_smooth (method="lm", color = "red") + 
  geom_segment(aes(x=Year, xend=Year, y=0, yend=Age)) + 
  coord_cartesian(ylim=c(21, 80)) + 
  scale_y_continuous(breaks=seq(12, 80)) + 
  scale_x_continuous(breaks=seq(1928, 2016, 5)) + 
  labs(title = "Age of Best Actress Oscars Winners From the Years 1928 to 2016; Source: https://people.sc.fsu.edu/~jburkardt/data/csv/csv.html")

# Convert the ggplot object to a plotly object
p <- ggplotly(p, tooltip = "text")

# Print the plot
print(p)
