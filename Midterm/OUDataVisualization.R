####################################
# Read in data
####################################

## This is where your file lives -- it will be different from mine
myPath <- '/Users/jamessiderius/OUDataClean.csv'
myData <- read.csv(myPath)


##################################################
#Check and install required libraries if necessary
##################################################
if (!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
}
if (!require("dplyr")) {
  install.packages("dplyr")
  library("dplyr")
}
if (!require("tidyr")) {
  install.packages("tidyr")
  library("tidyr")
}
if (!require("knitr")) {
  install.packages("knitr") #for nice display of summary tables
  library("knitr")
}

# Subpart (xii)
myData$AgeCat <- cut(myData$Age, seq(19,90,10), include.lowest = TRUE)

# Subpart (xiii)
by_AgeCat <- myData %>% group_by(AgeCat)
ave_by_AgeCat <- by_AgeCat %>%
  summarise(aveLOS_hrs = mean(OU_LOS_hrs, na.rm = TRUE),
            percFlipped = mean(Flipped, na.rm = TRUE),
            n = n())
kable(ave_by_AgeCat)

# Subpart (xiv)
g1a <- ggplot(ave_by_AgeCat, aes(x = AgeCat, y = aveLOS_hrs)) +
  geom_bar(stat = "identity") + ggtitle("Average LOS by Age Category")
g1a

# Subpart (xv): Create a bar chart of % flipped by AgeCat

# Subpart (xvi): Create a bar chart of average LOS by Gender

# Subpart (xvii): Create a bar chart of % flipped by Gender

# Subpart (xviii): Create a bar chart of average LOS by DRG

# Subpart (xix): Create a bar chart of % flipped by DRG

# Subpart (xx)
by_AgeCat_Gender <- myData %>% group_by(AgeCat,Gender)
ave_by_AgeCat_Gender <- by_AgeCat_Gender%>%
  summarise(aveLOS_hrs = mean(OU_LOS_hrs),
            Flipped = mean(Flipped),
            n = n())
kable(ave_by_AgeCat_Gender)

# Subpart (xxi)
by_AgeCat_Gender <- myData %>% group_by(AgeCat,Gender)
ave_by_AgeCat_Gender <- by_AgeCat_Gender%>%
  summarise(percFlipped = mean(Flipped))
kable(spread(ave_by_AgeCat_Gender, Gender, percFlipped))

# Subpart (xxii)
g4b <- ggplot(ave_by_AgeCat_Gender, aes(x = factor(AgeCat), y = percFlipped, fill =
                                          factor(Gender))) +
  geom_bar(position = "stack", stat = "identity") +
  ggtitle("Percentage of Patients Who Flipped by AgeCat and Gender")
g4b

# Subpart (xxiii): Create a bar chart of % flipped by DRG and Gender

# Subpart (xxiv): Create a bar chart of % flipped by DRG and Insurance Type

# Subpart (xxv): Pool all data by primary insurance being either MEDICARE or 
# MEDICARE OTHER, look at average % flipped by DRG 780 or 782

# Subpart (xxvi): Cross-tabulate 

