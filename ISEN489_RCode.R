setwd("/Users/robertcary7/489Proj/Bids/CPS")

CPS_Bids = read.csv("CPS-Bids.csv")
setwd("/Users/robertcary7/489Proj/Bids/NRG")

NRG_Bids = read.csv("NRG-Bids.csv")

setwd("/Users/robertcary7/489Proj/Bids/Calpine")

Calpine_Bids = read.csv("Calpine-Bids.csv")

names(CPS_Bids)

install.packages('dplyr')
library(dplyr)

CPS_Bids_Hourly = CPS_Bids %>%   #**
  group_by(`Delivery.Date`) %>%
  summarise(Settle_Price = mean(`Settlement.Point.Price`))
head(CPS_Bids_Hourly)
CPS_Bids_Hourly    # **creates a listing of average CPS price by date to simplify data



NRG_Bids_Hourly = NRG_Bids %>%  #**
  group_by(`Delivery.Date`) %>%
  summarise(Settle_Price = mean(`Settlement.Point.Price`))
head(NRG_Bids_Hourly)
NRG_Bids_Hourly  # **creates a listing of average NRG price by date to simplify data


Calpine_Bids_Hourly = Calpine_Bids %>%    # **
  group_by(`Delivery.Date`) %>%
  summarise(Settle_Price = mean(`Settlement.Point.Price`))
head(Calpine_Bids_Hourly)   # **creates a listing of average Calpine price by date to simplify data




###############################################################################
#Offers Stuff
setwd("/Users/robertcary7/489Proj/Offers")



CPS_Offers = read.csv("CPS/CPS-Offers.csv")  #accesses data
NRG_Offers = read.csv("NRG/NRG-Offers.csv")
Calpine_Offers = read.csv("Calpine/Calpine-Offers.csv")

names(CPS_Offers)


CPS_Offers_Hourly = CPS_Offers %>%
  group_by(`Delivery.Date`) %>%
  summarise(Settle_Price = mean(`Settlement.Point.Price`,na.rm = TRUE))
head(CPS_Offers_Hourly)   #summarizes CPS data 



NRG_Offers_Hourly = NRG_Offers %>%  #***
  group_by(`Delivery.Date`) %>%
  summarise(Settle_Price = mean(`Settlement.Point.Price`,na.rm = TRUE))
head(NRG_Offers_Hourly)   #summarizes NRG data



Calpine_Offers_Hourly = Calpine_Offers %>%
  group_by(`Delivery.Date`) %>%
  summarise(Settle_Price = mean(`Settlement.Point.Price`, na.rm = TRUE))
head(Calpine_Offers_Hourly)  #summarizes Calpine data


setwd("/Users/robertcary7/489Proj/DailyP")   #Following writes summarized data to excel sheets
write.csv(Calpine_Offers_Hourly,"Calpine_Offers_Hourly.csv")
write.csv(CPS_Offers_Hourly,"CPS_Offers_Hourly.csv")
write.csv(NRG_Offers_Hourly,"NRG_Offers_Hourly.csv")
write.csv(Calpine_Bids_Hourly,"Calpine_Bids_Hourly.csv")
write.csv(CPS_Bids_Hourly,"CPS_Bids_Hourly.csv")
write.csv(NRG_Bids_Hourly,"NRG_Bids_Hourly.csv")

write.csv(CPS_RD,'CPS_RD.csv')
write.csv(Calpine_RD, 'Calpine_RD.csv')  #***
write.csv(NRG_RD,'NRG_RD.csv')

write.csv(Calpine_Offers_Hourly, 'Dates.csv')

setwd("/Users/robertcary7/489Proj/DailyP")
Semi_Elas = read.csv('Semi_Elas') # use the file manually created by hand
#potentially could use SQL joint operations

names(Semi_Elas)

Semi_Elas_Monthly = Semi_Elas %>%
  group_by(Date) %>%
  summarise(CPS_Avg_Elas = mean(CPS), Calpine_Avg_Elas = mean(Calpine), NRG_Avg_Elas = mean(NRG))

Semi_Elas_Monthly
write.csv(Semi_Elas_Monthly,"Semi_Elas_Monthly.csv")

setwd("/Users/robertcary7/489Proj/Offers")

CPS_Elas = read.csv("CPS_Elas.csv")
CPS_Elas_Monthly = CPS_Elas %>%
  group_by('Date') %>%
  summarise(CPS_Elas = mean(as.numeric('CPS_Elas')))
CPS_Elas_Monthly

Calpine_Elas = read.csv("Calpine_RD.csv")
Calpine_Elas_Monthly = Calpine_Elas %>%
  group_by(Date) %>%
  summarise(Elas = mean('Calpine_Elas'))
Calpine_Elas_Monthly

NRG_Elas = read.csv("NRG_Elas.csv")
NRG_Elas_Monthly = NRG_Elas %>%
  group_by(Date) %>%
  summarise(Elas = mean('NRG_Elas'))
NRG_Elas_Monthly

write.csv(NRG_Elas_Monthly)
