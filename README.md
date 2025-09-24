# Customer_churn_analysis
“Customer churn analysis using MySQL for data cleaning and Power BI for interactive dashboarding.”


---

## 🛠️ Tech Stack
- **MySQL** – data cleaning, transformation, and view creation  
- **Power BI** – data modeling, DAX measures, interactive visuals  
- **SQL** – to prepare and filter churn data  

---

## 🔑 Key Steps
1. **Data Cleaning in MySQL**
   - Removed duplicates and handled missing values.
   - Created a view (`vw_ChurnData`) to isolate churned customers.
2. **Direct Connection to Power BI**
   - Established a live connection to the MySQL database for real-time updates.
3. **Dashboard Development**
   - Built KPIs, slicers, and visualizations to uncover churn patterns.

---

## 📈 Dashboard Insights
- **Total Customers:** 6,418 | **New Joiners:** 411 | **Total Churn:** 1,732 | **Churn Rate:** 27%  
- **High-Risk Segments:** Month-to-Month contracts & Fiber Optic users.
- **Top State by Churn:** Jammu (57.2% churn rate).
- **Demographics:** Males and customers above 50 show higher churn.

*(Add a screenshot below)*  
![Dashboard Preview](images/dashboard_summary.png)

---

## 🚀 How to Reproduce
1. Import the dataset into MySQL (🔹provide dataset source if public).
2. Run the SQL scripts in the **SQL/** folder to clean and prepare the data.
3. Open **Churn_Analysis.pbix** in Power BI.
4. Update the MySQL connection string with your credentials.
5. Refresh the dashboard to load live data.

---

## 📚 Learnings
- Building an **ETL pipeline** with MySQL for structured analytics.
- Applying **DAX** for calculated measures in Power BI.
- Creating **interactive visualizations** for business decision support.

---

## 💡 Feedback
I’m continuously learning!  
If you have suggestions or ideas for improvements, feel free to open an issue or share your feedback.

---

### 👤 Author
[Harshit Sharma](https://www.linkedin.com/in/harshit-sharma-71a153256/)  
