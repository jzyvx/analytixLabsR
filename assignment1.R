#------------------------------problem 1------------------------------
sessionInfo()

#------------------------------problem 2------------------------------
abc <- 3
abc = 3
3 -> abc

#------------------------------problem 3------------------------------
a <- c(1, 2, 3, 4)
b <- c("hello", "R")
c <- c(TRUE, TRUE, FALSE, TRUE)

#------------------------------problem 4------------------------------
ls()
ls.str()

#------------------------------problem 5------------------------------
x <- c(4, 4, 5, 6, 7, 2, 9)
# Part a
len <- length(x)
mean(x)
sum(x)
max(x)
min(x)
var(x)
# Part b
print(x[3])
print(x[seq(from = 1, to = len, by = 2)])
print(x[2:6])

#------------------------------problem 6------------------------------
mat = matrix(c(1:24), nrow = 6, ncol = 4)

#------------------------------problem 7------------------------------
StoreID <- c(111, 208, 113, 408)
Tenure <- c(25, 34, 28, 52)
StoreType <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
dframe <- data.frame(StoreID, Tenure, StoreType, status)

#------------------------------problem 8------------------------------
# part a
print(dframe['StoreID'])
print(dframe['Tenure'])

# part b
print(dframe[c('StoreType', 'status')])

# part c
print(dframe['Tenure'])

#------------------------------problem 9------------------------------not solved


#------------------------------problem 10------------------------------not solved
h <- c(25, 26, 18, 39)
j <- matrix(c(1:10), nrow = 5, ncol = 2)
k <- c("one", "two", "three")
mylist <- list(h, j, k)



#------------------------------problem 11------------------------------
stores <- read.csv("/home/vijayupadhyay/Documents/analytixlab/OLD/R/assignment/stores.csv")
stores_summary <- summary(stores)

#------------------------------problem 12------------------------------
with(stores, summary(stores$OperatingCost))
with(stores['OperatingCost'], summary(stores$OperatingCost))

#------------------------------problem 13------------------------------
class(stores)
names(stores)
length(stores)
dim(stores)
str(stores)
head(stores)
tail(stores)
fix(stores)

#------------------------------problem 14------------------------------
stores['Total_Cost'] <- stores['OperatingCost'] + stores['AcqCostPercust']
stores <- transform(stores, Total_Cost = OperatingCost + AcqCostPercust)

#------------------------------problem 15------------------------------
#storeclass <- function(x){
#  if (x < 120) {
#    perf <- "Low Perform store"
#  }
#  if ((x >= 120) & (x < 240)){
#    perf <- "Average Perform store"
#  } 
#  if (x > 240) {
#    perf <- "High Perform store"
#  }
#  return(perf)
#}
stores$StoreClass[stores$TotalSales <= 120] <- "Low Perform store"
stores$StoreClass[(stores$TotalSales > 120) & (stores$TotalSales <= 240)] <- "Average Perform store"
stores$StoreClass[stores$TotalSales > 240] <- "High Perform store"

#------------------------------problem 16------------------------------
names(stores)[names(stores) == "AcqCostPercust"] <- "AcqCost"

#------------------------------problem 17------------------------------
stores[sapply(stores, is.na)] <- 0
stores[sapply(stores, is.na)] <- NULL

#------------------------------problem 18------------------------------
#Part a
newstores <- stores[order(stores$StoreType), ]

#Part b
newstores <- stores[order(stores$Location, stores$TotalSales), ]

#------------------------------problem 19------------------------------
# Part a
date1 <- "2014-06-22"
date1Format <- as.Date(date1, format = "%Y-%m-%d")
date2 <- "2014-02-13"
date2Format <- as.Date(date2, format = "%Y-%m-%d")
dateVec1 <- c(date1Format, date2Format)

#Part b
date3 <- "01/05/1965"
date3Fromat <- as.Date(date3, format = "%m/%d/%Y")
date4 <- "08/16/1975"
date4Fromat <- as.Date(date4, format = "%m/%d/%Y")

#------------------------------problem 20------------------------------
# Part a
subset1 <- stores[c(5,7,8,9)]

# Part b
subset2 <- stores[-c(5,7,8,9)]

# Part c
subset3 <- stores[1:10, ]

# Part d
subset4 <- subset(stores, ((TotalSales > 100) & (StoreType == 'Apparel')))

# Part e
subset5 <- subset(stores, select = c("StoreCode", "StoreName", "Location", "TotalSales"), subset = (TotalSales > 100 & TotalSales < 300) )

#Part f
subset6 <- subset(stores, select = c(1:10), subset = ((StoreType %in% c("Electronincs")) & (TotalSales > 100)))
