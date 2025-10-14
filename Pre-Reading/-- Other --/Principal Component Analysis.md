> Tags
> #other
## Intro
- Reduces the number of dimensions in large data sets to principle components that retain most of the original information
## Example
Consider a risk management scenario
- Understanding which loans have similarities to each other for the purposes of understanding which type of loans are safer and which are more risky

|               | Loan 1  | Loan 2  | Loan 3  | Loan 4  | Loan 5  | Loan 6  |
| ------------- | ------- | ------- | ------- | ------- | ------- | ------- |
| Loan amount   | 200,000 | 210,000 | 195,000 | 300,000 | 290,000 | 310,000 |
| Credit score  | 700     | 710     | 690     | 780     | 720     | 735     |
| Annual income | 75,000  | 78,000  | 72,000  | 120,000 | 115,000 | 125,000 |
| Years in job  | 1       | 3       | 5       | 10      | 8       | 9       |
- Credit score is likely more important than years in job
- If we get rid non-/less important dimensions, two benefits:
	1. Faster training and inference in ML - less data to process
	2. Data visualisation becomes easier

## Dimensions
- 1D - e.g., loan amount -> shown on number line
- 2D - e.g., loan amount, credit score -> 2D cluster graph
- 3D - e.g., loan amount, credit score, annual income -> 3D cluster with z axis
### ...using PCA:
PCA can take 4D+ and plot them on a cartesian graph
- $x$ axis: PC1
- $y$ axis: PC2
- PCA helps reduce curse of dimensionality
![[Pasted image 20250825114443.png]]
## Overfitting
Overfitting = when an ML model learns the training data too well (including noise and random fluctuations)
- Result:
	- Model performs great on training data
	- Model performs poorly on new/unseen data
- In short: the model memorises instead of generalising
### How PCA helps reduce overfitting
- PCA reduces number of input features by combining into fewer "***==principal components==***" that capture the most importance variance in the data
- By removing the less important features (often noise), PCA:
	- Simplifies model
	- Reduces change of model memorising irrelevant details
	- Forces model to focus on the main patterns -> better generalisation
## Fundamental steps behind PC1 and PC2
|               | Loan 1  | Loan 2  | Loan 3  | Loan 4  | Loan 5  | Loan 6  |
| ------------- | ------- | ------- | ------- | ------- | ------- | ------- |
| Loan amount   | 200,000 | 210,000 | 195,000 | 300,000 | 290,000 | 310,000 |
| Credit score  | 700     | 710     | 690     | 780     | 720     | 735     |
| Annual income | 75,000  | 78,000  | 72,000  | 120,000 | 115,000 | 125,000 |
| Years in job  | 1       | 3       | 5       | 10      | 8       | 9       |
### 1. The data
4 features (rows):
- Loan amount
- Credit score
- Annual income
- Years in job
and 6 loans
### 2. Standardisation
- Features have different scales (loan amounts: 100,000s, years in job: single digits, etc.)
- PCA first standardises each feature so they're comparable
### 3. Correlation patterns
- PCA looks for correlated features
- In this dataset:
	- Loan amount and annual income are probably strongly correlated
	- Credit score and years in job might also show some relationship
### 4. PC1
- PC1 = the linear combination of features that captures the most variance in the dataset
- "If I had to pick one combined measure that explains the biggest differences between loans, what would it be?"
	- In this dataset, that combined measure (PC1) would most likely depend on loan amount + annual income, because those are the features where loans differ the most
### 5. PC2
- PCA looks for the next biggest difference in the data
- The next strongest differences are:
	- Credit score
	- Years in job
- These don't move in the same way as a loan amount/income, so they become the focus of PC2
### 6. Output of PCA
- Each loan gets a new coordinate (`(PC1 score, PC2 score)`)
- Instead of 4D, it can now be plotted in 2D using PC1 vs PC2
- Loans that are similar cluster together, outliers stick out
## Variables dropped to PC3, PC4, ..., PCn
- Noisy or patternless variables (don't contribute much) end up in later PCs
- Don't explain much variance in data -> dropped due to noise and confusing ML models
## Variance ratio
Each PC captures part of the total variation in data. The explained variance ratio tells you what % of the information is kept. E.g.:
- PC1 = 60%
- PC2 = 25%
- Together = 85% of total information
In practice, people usually keep enough PCs to cover ~90-95% of variance
## Use cases (useful/not useful)
### Useful when:
- Lots of features
- Features are correlated (e.g., loan amount & income move together)
- Need to visualise high-dimensional in 2D/3D
### Less useful:
- If features aren't correlated -> PCA won't reduce dimensions much
- PCs are harder to interpret than original features (they are mixtures of variables)
	- Example: PC1 = 0.6 Income + 0.3 Credit Score + 0.1 Years in job
		- Less intuitive than "income" on its own
### Examples:
- Reducing hundreds of stock returns into a few broad risk factors
- Filtering out noise in time series
- Summarising many credit risk variables into a smaller set of key indicators