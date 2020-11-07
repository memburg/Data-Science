# Sum of variables
office_time = 8
studying = 1
transport = 1.5
day_time = office_time + studying + transport
day_time

# Getting grades
quarter_1 = 0.3
quarter_2 = 0.3
quarter_3 = 0.4

grade_1 = 4.0
grade_2 = 4.6
grade_3 = 3.0

grade_q_1 = grade_1 * quarter_1
grade_q_1

grade_q_2 = grade_2 * quarter_2
grade_q_2

grade_q_3 = grade_3 * quarter_3
grade_q_3

final_grade = grade_q_1 + grade_q_2 + grade_q_3
final_grade

# Set root path
setwd("/home/ramby/Desktop/R Fundamentals/")
mtcars = read.csv("mtcars.csv", header=TRUE)
orangeec = read.csv("orangeec.csv", header=TRUE)
mtcars$vs = as.logical(mtcars$vs)
mtcars$am = as.logical(mtcars$am)
summary(mtcars)
mtcars
wt = (mtcars$wt * 1000) / 2
wt
mtcars.new = transform(mtcars, wt = wt * 1000 / 2.204623)
mtcars.new

summary(mtcars.new)

# Orange economy
str(orangeec)
summary(orangeec)
