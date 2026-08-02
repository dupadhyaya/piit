#Anova
#https://statsandr.com/blog/anova-in-r/

#used to compare the means of three or more groups to determine if there are statistically significant differences among them

## Load the dataset
data(PlantGrowth)

# Check the data structure
head(PlantGrowth)

# Ensure the grouping variable is a factor
PlantGrowth$group <- as.factor(PlantGrowth$group)
summary(PlantGrowth)

# Perform the one-way ANOVA
anova_result <- aov(weight ~ group, data = PlantGrowth)

# Display the summary of the results
summary(anova_result)

#The summary() output provides the F-statistic and the p-value (Pr(>F)). A p-value less than the significance level (commonly 0.05) indicates that at least one group mean is significantly different from the others. Post-hoc test:
#If the ANOVA is significant (p < 0.05), a post-hoc test, such as Tukey's Honest Significant Differences (HSD) test, is used to determine exactly which pairs of groups are different. 
## Perform Tukey's HSD post-hoc test
TukeyHSD(anova_result)
