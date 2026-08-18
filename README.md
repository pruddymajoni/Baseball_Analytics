# Baseball_Analytics
 Investigate Salary of Baseball Players by Position and Team/Location

# Data description
The data set contains three columns, i.e. Team/Location(categorical), Position(Categorical) and Salary(Numerical).

# Data Insights
From the Baseball Salaries Data set, we can deduce how Position affects the mean Salary of a Baseball Player. We can also use an interaction variable of Position and Team to conclude whether the two make a difference in comparion to just using Position. 

# 1. ANOVA  : Position vs Salary
Ho : Position has no effect on Salary. 
Ha : Position significantly affects Salary. 

| Source     | Df  | Sum Sq      | Mean Sq     | F value | Pr(>F)        |
|------------|-----|-------------|-------------|---------|---------------|
| Position   | 7   | 1.752e+15   | 2.503e+14   | 6.74    | 8.46e-08 ***  |
| Residuals  | 869 | 3.228e+16   | 3.714e+13   |         |               |             
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Result : Reject the Ho hypothesis and conclude that at the 95% confidence level, there is enough evidence to conclude that Position significantly affects the Salary a player receives. 

# 2. ANOVA : Position + Team vs Salary

Ho : Position * Team has no effect on Salary. 
Ha : Position * Team significantly affects Salary. 

| Source        | Df  | Sum Sq    | Mean Sq   | F value | Pr(>F)       |
|---------------|-----|-----------|-----------|---------|--------------|
| Position      | 7   | 1.752e+15 | 2.503e+14 | 7.184   | 2.66e-08 *** |
| Team          | 29  | 1.801e+15 | 6.210e+13 | 1.782   | 0.00746 **   |
| Position:Team | 178 | 7.407e+15 | 4.161e+13 | 1.194   | 0.06272 .    |
| Residuals     | 662 | 2.307e+16 | 3.485e+13 |         |              |
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Result : Reject the Ho hypothesis and conclude that at the 95% confidence level, there is enough evidence to conclude that Position*Team significantly affects the Salary a player receives. 

![image_alt](https://github.com/pruddymajoni/Baseball_Analytics/blob/05894c6a6e439151e25cf8db14885f2c227f7924/Baseball/Hist.png)



