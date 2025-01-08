--View  top 10 Data
SELECT TOP 10 *
FROM Loan_Sanction..loan_sanction;

--What are the column name and its data type
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'loan_sanction';

--Check the number of rows
SELECT COUNT(*) AS no_of_rows
FROM Loan_Sanction..loan_sanction;

--Loan Status by Credit History
SELECT convert(int,credit_history) AS Credit_History, SUM(convert(int,loan_status)) AS Loan_Status
FROM Loan_Sanction..loan_sanction
group by Credit_History;
--From the Query we can say that People with Credit History has higher Probability to get the loan approved.

--Loan Status by Marital status
SELECT CONVERT(int, married) AS Married, SUM(CONVERT(int, loan_status)) AS Loan_Status
FROM Loan_Sanction..loan_sanction
group by Married;
--From the Query we can say that People who are married has slightly higher chance to get the loan approved.

--What is the average loan amount sanctioned
SELECT avg(loanAmount) AVG_Loan_Amount
FROM Loan_Sanction..loan_sanction;


--Frequency of Loan Amounts.
SELECT loanamount, COUNT(*) AS frequency 
FROM loan_sanction..loan_sanction 
GROUP BY loanamount 
ORDER BY frequency DESC;

--What are the top 10 highest loan amount sanctioned
SELECT TOP 10 * 
FROM loan_sanction..loan_sanction 
ORDER BY LoanAmount DESC;


--Total of Loan that have been approved and its percentage
WITH loan_status_distribution AS (
    SELECT Loan_Status, COUNT(*) AS count 
    FROM loan_sanction 
    GROUP BY Loan_Status
)
SELECT Loan_Status, count, 
       count * 100.0 / (SELECT SUM(count) FROM loan_status_distribution) AS percentage
FROM loan_status_distribution;





