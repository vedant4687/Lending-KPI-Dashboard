use lending;
CREATE VIEW loans_enriched AS
SELECT
    LoanID, Age, Income, LoanAmount, CreditScore, MonthsEmployed,
    NumCreditLines, InterestRate, LoanTerm, DTIRatio, Education,
    EmploymentType, MaritalStatus, HasMortgage, HasDependents,
    LoanPurpose, HasCoSigner, `Default`,
    CASE 
        WHEN CreditScore < 580 THEN 'Poor (< 580)'
        WHEN CreditScore < 670 THEN 'Fair (580-669)'
        WHEN CreditScore < 740 THEN 'Good (670-739)'
        WHEN CreditScore < 800 THEN 'Very Good (740-799)'
        ELSE 'Exceptional (800+)'
    END AS CreditScoreRange,
    CASE 
        WHEN DTIRatio < 0.2 THEN 'Low (< 20%)'
        WHEN DTIRatio < 0.35 THEN 'Medium (20-35%)'
        WHEN DTIRatio < 0.43 THEN 'High (35-43%)'
        ELSE 'Very High (> 43%)'
    END AS DTIRange
FROM loans;

SELECT * FROM loans_enriched LIMIT 10;


DROP VIEW loans_enriched;

CREATE VIEW loans_enriched AS
SELECT
    LoanID, Age, Income, LoanAmount, CreditScore, MonthsEmployed,
    NumCreditLines, InterestRate, LoanTerm, DTIRatio, Education,
    EmploymentType, MaritalStatus, HasMortgage, HasDependents,
    LoanPurpose, HasCoSigner, `Default`,
    CASE 
        WHEN CreditScore < 580 THEN 'Poor (< 580)'
        WHEN CreditScore < 670 THEN 'Fair (580-669)'
        WHEN CreditScore < 740 THEN 'Good (670-739)'
        WHEN CreditScore < 800 THEN 'Very Good (740-799)'
        ELSE 'Exceptional (800+)'
    END AS CreditScoreRange,
    CASE 
        WHEN DTIRatio < 0.2 THEN 'Low (< 20%)'
        WHEN DTIRatio < 0.35 THEN 'Medium (20-35%)'
        WHEN DTIRatio < 0.43 THEN 'High (35-43%)'
        ELSE 'Very High (> 43%)'
    END AS DTIRange,
    CASE 
        WHEN LoanAmount / Income < 0.5 THEN 'Low (< 0.5x)'
        WHEN LoanAmount / Income < 1.0 THEN 'Medium (0.5-1x)'
        WHEN LoanAmount / Income < 2.0 THEN 'High (1-2x)'
        ELSE 'Very High (> 2x)'
    END AS LoanToIncomeRange
FROM loans;