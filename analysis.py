import pandas as pd

# Load data
df = pd.read_csv('data/claims.csv')

# 1. Total Claims & Cost
print("Total Claims:", len(df))
print("Total Cost:", df['claim_amount'].sum())

# 2. Top Diagnoses
top_diag = df.groupby('diagnosis_code')['claim_amount'].sum().sort_values(ascending=False)
print("\nTop Diagnoses:\n", top_diag)

# 3. Avg Cost per Patient
avg_cost = df.groupby('patient_id')['claim_amount'].mean()
print("\nAverage Cost per Patient:\n", avg_cost)

# 4. Monthly Trends
df['admission_date'] = pd.to_datetime(df['admission_date'])
monthly = df.groupby(df['admission_date'].dt.to_period('M'))['claim_amount'].sum()
print("\nMonthly Cost Trend:\n", monthly)
