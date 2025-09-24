SELECT * FROM customer_data;

select Gender, count(Gender) as Total_count, count(Gender) * 100.0 / (select count(*) from customer_data) as Percentage from customer_data group by Gender;

select Contract, count(Contract) as Total_count, count(Contract) * 100.0 / (select count(*) from customer_data) as Percentage from customer_data group by Contract;

select Customer_Status, count(Customer_Status) as Total_count, sum(Total_Revenue) as Total_rev, sum(Total_Revenue) / (select sum(Total_Revenue) from customer_data)*100 as Rev_Percentage from customer_data group by Customer_Status;

select State, count(State) as Total_count, count(Gender) * 100.0 / (select count(*) from customer_data) as Percentage from customer_data group by State order by Percentage desc;

select distinct  internet_Type from customer_data;

SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,

    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,

    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,

    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,

    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,

    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,

    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,

    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,

    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,

    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,

    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,

    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,

    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,

    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,

    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,

    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,

    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,

    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,

    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,

    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,

    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,

    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,

    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,

    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,

    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,

    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,

    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,

    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,

    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,

    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,

    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,

    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count

FROM customer_data;

CREATE TABLE db_churn.prod_Churn AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    IFNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    IFNULL(Multiple_Lines, 'No') AS Multiple_Lines,
    Internet_Service,
    IFNULL(Internet_Type, 'None') AS Internet_Type,
    IFNULL(Online_Security, 'No') AS Online_Security,
    IFNULL(Online_Backup, 'No') AS Online_Backup,
    IFNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
    IFNULL(Premium_Support, 'No') AS Premium_Support,
    IFNULL(Streaming_TV, 'No') AS Streaming_TV,
    IFNULL(Streaming_Movies, 'No') AS Streaming_Movies,
    IFNULL(Streaming_Music, 'No') AS Streaming_Music,
    IFNULL(Unlimited_Data, 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    IFNULL(Churn_Category, 'Others') AS Churn_Category,
    IFNULL(Churn_Reason, 'Others') AS Churn_Reason
FROM db_churn.customer_data;

CREATE VIEW vw_ChurnData AS
SELECT *FROM prod_Churn
WHERE Customer_Status IN ('Churned', 'Stayed');


CREATE VIEW vw_JoinData AS
SELECT *FROM prod_Churn
WHERE Customer_Status ='Joined'

GRANT ALL PRIVILEGES ON db_churn.* TO 'root'@'localhost';
FLUSH PRIVILEGES;