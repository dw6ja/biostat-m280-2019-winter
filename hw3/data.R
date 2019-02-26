############################
# Diyang Wu                #
# Biostats M280            #
# Homework 3 (Data Process)#
############################

#read original data
library("tidyverse")
la_payroll <- read.csv("/home/m280data/la_payroll/City_Employee_Payroll.csv")
head(la_payroll)
names(la_payroll)

#process data for Question 1 part 1
q1p1 <- la_payroll %>% 
  select(Year, Total.Payments, Base.Pay, Overtime.Pay, 
         Other.Pay..Payroll.Explorer.)  %>% 
  group_by(Year) %>%
  summarise(
    Total_Payments = sum(Total.Payments, na.rm = TRUE), 
    Base_Pay = sum(Base.Pay, na.rm = TRUE), 
    Overtime_Pay = sum(Overtime.Pay, na.rm = TRUE), 
    Other_Pay = sum(Other.Pay..Payroll.Explorer., na.rm = TRUE)
  )
q1p1