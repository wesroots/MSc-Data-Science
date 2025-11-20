# ---------------------------------------------------------
# 0. Load packages
# ---------------------------------------------------------
library(dplyr)

# ---------------------------------------------------------
# 1. Load dataset
# ---------------------------------------------------------
group5 <- read.csv("Group5.csv", header = TRUE)

# ---------------------------------------------------------
# 2. Create training and test sets
# ---------------------------------------------------------
trainset <- group5[group5$tnts == 0, ]
testset  <- group5[group5$tnts == 1, ]

# ---------------------------------------------------------
# 3. Select numeric variables only for PCA
# ---------------------------------------------------------
num_vars <- trainset %>%
  select(where(is.numeric))

# ---------------------------------------------------------
# 4. Identify and remove zero-variance columns
# ---------------------------------------------------------
zero_var_cols <- sapply(num_vars, function(x) length(unique(x)) == 1)

# Print them so you can see which columns were removed
zero_var_cols

# Keep only columns with variation
num_vars_pca <- num_vars[, !zero_var_cols]

# ---------------------------------------------------------
# 5. Run PCA (scaled)
# ---------------------------------------------------------
pca_res <- prcomp(num_vars_pca, scale. = TRUE)

# ---------------------------------------------------------
# 6. PCA outputs
# ---------------------------------------------------------

# 6a. Variance explained
summary(pca_res)

# 6b. Scree plot
plot(pca_res, type = "l", main = "Scree Plot")

# 6c. Loadings (variable contributions)
pca_loadings <- pca_res$rotation
pca_loadings

# 6d. Optional biplot
biplot(pca_res, scale = 0)

top_loadings <- function(pc_num, n = 2) {
  abs_vals <- abs(pca_loadings[, pc_num])
  sorted <- sort(abs_vals, decreasing = TRUE)
  top_vars <- names(sorted)[1:n]
  return(top_vars)
}

top_loadings(1, 2)
top_loadings(2, 2)
top_loadings(3, 2)
