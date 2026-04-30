-- 1. Total Claims and Total Cost
SELECT 
    COUNT(*) AS total_claims,
    SUM(claim_amount) AS total_cost
FROM claims;


-- 2. Top 10 High-Cost Diagnoses
SELECT 
    diagnosis_code,
    COUNT(*) AS claim_count,
    SUM(claim_amount) AS total_cost
FROM claims
GROUP BY diagnosis_code
ORDER BY total_cost DESC
LIMIT 10;


-- 3. Readmission Analysis (within 30 days)
SELECT 
    patient_id,
    COUNT(*) AS admissions,
    MIN(admission_date) AS first_admission,
    MAX(admission_date) AS last_admission
FROM claims
GROUP BY patient_id
HAVING COUNT(*) > 1;


-- 4. Average Cost per Patient
SELECT 
    patient_id,
    AVG(claim_amount) AS avg_cost
FROM claims
GROUP BY patient_id
ORDER BY avg_cost DESC;


-- 5. Monthly Trend of Claims
SELECT 
    DATE_TRUNC('month', admission_date) AS month,
    COUNT(*) AS total_claims,
    SUM(claim_amount) AS total_cost
FROM claims
GROUP BY month
ORDER BY month;


-- 6. Top Providers by Cost
SELECT 
    provider_id,
    SUM(claim_amount) AS total_cost
FROM claims
GROUP BY provider_id
ORDER BY total_cost DESC
LIMIT 10;
