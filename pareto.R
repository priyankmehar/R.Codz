######################################
### PARETO CHART IN R USING GGPLOT ###
######################################

### Libraries
library(ggplot2)
library(readxl)
library(openxlsx)


### Importing Source file : "ParetoSrc.xlsx"
SourceDF <- read_excel(file.choose(), sheet = "Sheet1")
summary(SourceDF)


### SOrting the data in ascending  order
SourceDF <- SourceDF[order(SourceDF$Freq, decreasing=TRUE), ]

### Converting categorical variable to factor
SourceDF$Var1 <- factor(SourceDF$Var1, levels=SourceDF$Var1)

### Creating Pareto chart using GGPLOT2
ggplot(SourceDF, aes(x=SourceDF$Var1)) +
  geom_bar(aes(y=SourceDF$Freq), fill='lightcoral', stat="identity") +
  geom_point(aes(y=SourceDF$CumSum), color = rgb(0, 1, 0), pch=16, size=2) +
  geom_path(aes(y=SourceDF$CumSum, group=1), colour="slateblue1", lty=3, size=0.9) +
  theme(axis.text.x = element_text(angle=90, vjust=0.6)) +
  labs(title = "Pareto Plot", subtitle = "A Pareto chart, named after Vilfredo Pareto, is a type of chart that contains both bars and a line graph, 
       where individual values are represented in descending order by bars, and the cumulative total is represented by the line.", x = 'Variable', y = 'Frequency')


