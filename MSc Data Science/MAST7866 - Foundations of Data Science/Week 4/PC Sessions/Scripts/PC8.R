# --- Task 1: Moodle video ---

# --- Task 2: Understanding p-values Moodle Video ---

# --- Task 3: Conducting Hypothesis Test for Population Mean ---
# Example 1
data_salaries <- c(35, 23, 34, 56, 29, 25, 28, 45, 29, 34, 32, 31, 30, 35, 45, 27, 29, 40, 39, 32, 29, 23, 24, 29, 29, 30, 28, 31, 25, 26, 28, 25, 26, 24, 21)
t.test(data_salaries, mu=29, conf.level=0.95) # mu = hypothesis -> h_0 accepted

# --- Challenge 1 ---
t.test(data_salaries, mu=45, conf.level=0.95, alternative="less") # h_0 rejected

# --- Task 4: Conducting a Hypothesis Test for Population Proportion ---
# Checking whether true proportion of individuals equals a claimed value
# Example 2: previous: 52% of people agree, new: 567 out of 1000
# H_0 -> proportion hasn't significantly changed
prop.test(x=567, n=1000, p=0.52)
# p-value = 0.003 < 0.01 significance -> reject H_0 -> proportion has significantly changed

# --- Challenge 2 ---
# Survey: Previous: 0.42, new 1: 0.55, new 2: 0.55
# H_0 = no change, significance = 0.01
prop.test(x=0.55*40, n=40, p=0.42) # p = 0.1322 -> fail to reject H_0
prop.test(x=0.55*400, n=400, p=0.42) # p = 1.816e-07 -> reject H_0

# --- Task 5: Understanding Link Between Confidence Intervals and Hypothesis Testing - Moodle Video ---

# --- Challenge 3 ---
# Challenge 2: 
# Smaller sample size: does not provide enough confidence that there is a
# significant change at significance level 0.01
# Larger sample size: provides enough confidence that there is a significant change
# at significance level 0.01


