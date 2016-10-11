cust1 <- read.csv('/home/vijayupadhyay/Documents/analytixlab/New/R/Customers.csv')
cust1[1:5,]
cust2 <- read.table('/home/vijayupadhyay/Documents/analytixlab/New/R/Customers.csv',
                    header = TRUE, sep = ",")
cust2[1:5,]

#---------------------------------------2---------------------------------------
View(cust1)
head(cust1)
tail(cust1)
str(cust1)
names(cust1)
nrow(cust1)
ncol(cust1)
summary(cust1)
dup <- duplicated(cust1)
View(dup)

#---------------------------------------3---------------------------------------
percent = (sum(is.na(cust1$Customer.Value))/length(cust1$Customer.Value))*100

#---------------------------------------4---------------------------------------
uniqueSubset <- unique(cust1)
dss <- cust1[duplicated(cust1),]

#---------------------------------------5---------------------------------------
custList <- subset(cust1, Customer.Value > 10000)

#---------------------------------------6---------------------------------------
cust1$CustomerValueSegment[cust1$Customer.Value <= 10000] <- "Low Value Segment"
cust1$CustomerValueSegment[(cust1$Customer.Value > 10000) & (cust1$Customer.Value <= 25000)] <- "Medium Value Segment"
cust1$CustomerValueSegment[cust1$Customer.Value > 25000] <- "High Value Segment"

#---------------------------------------8---------------------------------------
processDate <- function(arg1){
  dateChars <- unlist(strsplit(as.character(arg1), ""))
  day <- paste(dateChars[7], dateChars[8], sep = "")
  month <- paste(dateChars[5], dateChars[6], sep = "")
  year <- paste(dateChars[1], dateChars[2], dateChars[3], dateChars[4], sep = "")
  pDate <- paste(day, month, year, sep = "/")
  return(pDate)
}

dateObject <- function(arg2){
  last <- as.Date(arg2, format = "%d/%m/%Y")
  return(Sys.Date() - last)
}
recentDate <- as.vector(lapply(cust1$recent.date, processDate))
#as.Date(date2, format = "%d/%m/%y")

cust1$SinceLastPurchase <- lapply(recentDate, dateObject)
