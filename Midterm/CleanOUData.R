####################################
# Read in data
####################################

## This is where your file lives -- it will be different from mine
myPath <- '/Users/jamessiderius/OUData.csv'
myData <- read.csv(myPath)

####################################################
# Deal with missing data and fix incorrect data types
####################################################

# Subpart (i)
myData[myData$BloodPressureUpper == "NULL",'BloodPressureUpper'] <- NA  

# Subpart (ii)
summary(myData$BloodPressureUpper)
myData$BloodPressureUpper <- as.numeric(as.character(myData$BloodPressureUpper))

# Subpart (iii): Replace 0 with NA in BloodPressureLower and convert to numeric

# Subpart (iv): Replace "#VALUE!" with NA in BloodPressureDiff and convert to numeric

# Subpart (v): Replace "NULL" with NA in Pulse and convert to numeric

# Subpart (vi): Replace "NULL" with NA in PulseOximetry and convert to numeric

# Subpart (vii): Replace "NULL" with NA in Respirations and convert to numeric

# Subpart (viii): Replace "NULL" with NA in Temperature and convert to numeric

# Subpart (ix): Convert DRG01 and Flipped to factors in R

# Subpart (x): Remove any rows that are missing data from vitals

# Subpart (xi): Output a cleaned data set to a csv file OUDataClean.csv


