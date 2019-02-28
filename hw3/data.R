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
    `Total Payments` = sum(Total.Payments, na.rm = TRUE), 
    `Base Pay` = sum(Base.Pay, na.rm = TRUE), 
    `Overtime Pay` = sum(Overtime.Pay, na.rm = TRUE), 
    `Other Pay` = sum(Other.Pay..Payroll.Explorer., na.rm = TRUE)
  )
q1p1 <- gather(q1p1_wide, `Base Pay`:`Other Pay`, key = 'class', value = 'payments')
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
         `Total Payments` = Total.Payments, 
         `Base Payments` = Base.Pay, `Overtime Payments` = Overtime.Pay, 
         `Other Payments` = Other.Pay..Payroll.Explorer.) %>%
  select(Year, Department, Job, 
         `Total Payments`, `Base Payments`, `Overtime Payments`, 
         `Other Payments`) %>%
  arrange(Year, desc(`Total Payments`))  

write_rds(q1p2, "./hw3/hw3Shiny/q1p2.rds")

#process data for Question 1 part 3 
q1p3_1 <- la_payroll %>%
  select(Year, Department.Title, Job.Class.Title, 
         Total.Payments, Base.Pay, Overtime.Pay, 
         Other.Pay..Payroll.Explorer.) %>%
  group_by(Year, Department.Title) %>%
  summarise(
    `Mean Total Payments` = mean(Total.Payments, na.rm = TRUE), 
    `Mean Base Payments` = mean(Base.Pay, na.rm = TRUE), 
    `Mean Overtime Payments` = mean(Overtime.Pay, na.rm = TRUE), 
    `Mean Other Payments` = mean(Other.Pay..Payroll.Explorer., na.rm = TRUE)
  ) %>%
  arrange(Year, desc(`Mean Total Payments`))
write_rds(q1p3_1, "./hw3/hw3Shiny/q1p3_1.rds")
head(q1p3_1, 10)


q1p3_2 <- la_payroll %>%
  select(Year, Department.Title, Job.Class.Title, 
         Total.Payments, Base.Pay, Overtime.Pay, 
         Other.Pay..Payroll.Explorer.) %>%
  group_by(Year, Department.Title) %>%
  summarise(
    `Median Total Payments` = median(Total.Payments, na.rm = TRUE), 
    `Median Base Payments` = median(Base.Pay, na.rm = TRUE), 
    `Median Overtime Payments` = median(Overtime.Pay, na.rm = TRUE), 
    `Median Other Payments` = median(Other.Pay..Payroll.Explorer., na.rm = TRUE)
  ) %>%
  arrange(Year, desc(`Median Total Payments`))
write_rds(q1p3_2, "./hw3/hw3Shiny/q1p3_2.rds")
head(q1p3_2)

#process data for Question 1 part 4 
q1p4 <- la_payroll %>%
  select(Year, Department.Title, Job.Class.Title, 
         Total.Payments, Base.Pay, Overtime.Pay, 
         Other.Pay..Payroll.Explorer., Average.Benefit.Cost) %>%
  group_by(Year, Department.Title) %>%
  summarise(
    `Total Payments` = sum(Total.Payments, na.rm = TRUE), 
    `Base Pay` = sum(Base.Pay, na.rm = TRUE), 
    `Overtime Pay` = sum(Overtime.Pay, na.rm = TRUE), 
    `Other Pay` = sum(Other.Pay..Payroll.Explorer., na.rm = TRUE),
    `Total Cost` = sum(Average.Benefit.Cost, na.rm = TRUE)
  ) %>%
  arrange(Year, desc(`Total Cost`))
write_rds(q1p4, "./hw3/hw3Shiny/q1p4.rds")

head(q1p4)

#process data for Question 1 part 5 
q1p5 <- la_payroll %>%
  select(Year, Department.Title, Job.Class.Title, 
         Total.Payments, Base.Pay, Overtime.Pay, 
         Other.Pay..Payroll.Explorer., Average.Health.Cost) %>%
  group_by(Year, Department.Title) %>%
  summarise(
    `Total Payments` = sum(Total.Payments, na.rm = TRUE), 
    `Base Pay` = sum(Base.Pay, na.rm = TRUE), 
    `Overtime Pay` = sum(Overtime.Pay, na.rm = TRUE), 
    `Other Pay` = sum(Other.Pay..Payroll.Explorer., na.rm = TRUE),
    `Total Health Cost` = sum(Average.Health.Cost, na.rm = TRUE)
  ) %>%
  arrange(Year, desc(`Total Health Cost`))
write_rds(q1p5, "./hw3/hw3Shiny/q1p5.rds")













  