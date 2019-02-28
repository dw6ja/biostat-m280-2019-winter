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
head(la_payroll, n=10)

#process data for Question 1 part 1
q1p1_wide <- la_payroll %>% 
  select(Year, Total.Payments, Base.Pay, Overtime.Pay, 
         Other.Pay..Payroll.Explorer.)  %>% 
  group_by(Year) %>%
  summarise(
    Total_Payments = sum(Total.Payments, na.rm = TRUE), 
    Base_Pay = sum(Base.Pay, na.rm = TRUE), 
    Overtime_Pay = sum(Overtime.Pay, na.rm = TRUE), 
    Other_Pay = sum(Other.Pay..Payroll.Explorer., na.rm = TRUE)
  )
q1p1 <- gather(q1p1_wide, Base_Pay:Other_Pay, key = 'class', value = 'payments')
q1p1
write_rds(q1p1, "./hw3/hw3Shiny/q1p1.rds")
ggplot(data = q1p1) +
  geom_bar(mapping = aes(x = Year, y = payments, fill = class), 
           stat = "identity")

#process data for Quetiosn 1 part 2
q1p2 <- la_payroll %>%
  select(Year, Department.Title, Job.Class.Title, 
         Total.Payments, Base.Pay, Overtime.Pay, 
         Other.Pay..Payroll.Explorer.) %>%
  mutate(Department = Department.Title, Job = Job.Class.Title, 
         Total_Payments = Total.Payments, 
         Base_Payments = Base.Pay, Overtime_Payments = Overtime.Pay, 
         Other_Payments = Other.Pay..Payroll.Explorer.) %>%
  select(Year, Department, Job, 
         Total_Payments, Base_Payments, Overtime_Payments, 
         Other_Payments)

arrange(q1p2, Year, desc(Total_Payments))  
write_rds(q1p2, "./hw3/hw3Shiny/q1p2.rds")
















  