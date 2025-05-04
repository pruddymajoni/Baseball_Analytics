#load data and get summary
library(readxl)
anova_exp <- read_excel("anova exp.xlsx")
View(anova_exp)
anova_exp %>%
  group_by(Position) %>%
  summarise(
    count = n(),
    mean = mean(Salary),
    median = median(Salary),
    sd = sd(Salary),
    min = min(Salary),
    max = max(Salary)
  )

#plot boxplot for Salaryagainst Position  
library(ggplot2)
ggplot(anova_exp, aes(x = Position, y = Salary)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Salary Distribution by Position", x = "Position", y = "Salary") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#anova for salary against position
anova_model = aov(Salary ~ Position, data = anova_exp)
summary(anova_model)

#pairwise test to compare the differences in Salary with Position and plot visual
tukeyresult <- TukeyHSD(anova_model, conf.level = 0.95)
tukeyresult
plot(tukeyresult, las = 2)

# Extract the Tukey results as a data frame
# Find the row with the maximum diff
tukey_df <- as.data.frame(tukeyresult$Position)
max_diff_row <- tukey_df[which.max(tukey_df$diff), ]
print(max_diff_row)



# Incorporate Interaction Variable Two-way ANOVA with interaction
anova_model2 <- aov(Salary ~ Position * Team, data = anova_exp)
summary(anova_model2)

# Compute mean salary for each position-team combo
library(ggplot2)
library(dplyr)

grouped_means <- anova_exp %>%
  group_by(Team, Position) %>%
  summarise(mean_salary = mean(Salary, na.rm = TRUE), .groups = 'drop')

# Plot histogram to show the mean salary of each position by the team
ggplot(grouped_means, aes(x = Position, y = mean_salary, fill = Team)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Mean Salary by Position and Team", x = "Position", y = "Mean Salary") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Regression model to predict salary of position by team
model_lm <- lm(Salary ~ Position * Team, data = anova_exp)
summary(model_lm)

#Transform salary to test change
anova_exp$log_salary <- log(anova_exp$Salary)
model_log_lm <- lm(log_salary ~ Position * Team, data = anova_exp)
summary(model_log_lm)



