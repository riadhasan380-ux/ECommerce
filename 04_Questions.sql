SQL SERVER REAL-TIME PROJECT – E-COMMERCE SALES & OPERATIONS
===============================================================

Dataset scale:
Customers ~30,000 | Products 500 | Stores 50 | Employees 250
Orders 120,000 | OrderDetails ~300,000+ | Inventory ~750,000

IMPORTANT:
- Questions intentionally do NOT include solutions.
- Students should write their own SQL in SSMS.
- Use only the supplied database unless the question asks for a new object.

SECTION A – BEGINNER (1–30)
1. List all active customers.
2. Display the first 100 products ordered by UnitPrice descending.
3. Find customers from Maharashtra.
4. Find products with UnitPrice > 50,000.
5. Find orders placed in 2025.
6. Count total customers.
7. Count total products by category.
8. Find minimum, maximum and average product price.
9. List all distinct payment methods.
10. Find orders with status = Completed.
11. Count orders by OrderStatus.
12. Count customers by state.
13. Find products with UnitPrice between 1,000 and 10,000.
14. Find customers whose name starts with A.
15. Find products containing the word 'Product'.
16. Show the 20 most expensive products.
17. Find orders that are Paid but not Completed.
18. Count shipments by carrier.
19. Find all returned orders.
20. Find average SupplierRating.
21. Show product name, category and supplier.
22. Show order ID, customer name and order date.
23. Show order details with product names.
24. Calculate line-level gross amount = Quantity * UnitPrice.
25. Calculate discounted line amount.
26. Find customers who have placed at least one order.
27. Find stores by region.
28. Find employees in the Sales department.
29. Find products below their ReorderLevel using inventory data.
30. Find the total quantity sold by product.

SECTION B – INTERMEDIATE (31–65)
31. Calculate total revenue by month.
32. Calculate total revenue by year.
33. Find top 10 customers by revenue.
34. Find top 10 products by revenue.
35. Find revenue by category.
36. Find revenue by store.
37. Find average order value by month.
38. Find the number of new customers registered each month.
39. Find customers with more than 5 orders.
40. Find customers who have never placed an order.
41. Find products that have never been sold.
42. Find the second-highest product price in each category.
43. Find the top 3 products in each category by revenue.
44. Find the top 5 stores in each region.
45. Calculate monthly order count and revenue together.
46. Find cancelled-order percentage by month.
47. Find payment failure percentage by payment method.
48. Find average discount by category.
49. Find total refund amount by return reason.
50. Find return rate by product.
51. Find average delivery time by carrier.
52. Find shipments delivered after 7 days.
53. Find customers whose latest order is in 2025.
54. Find each customer's first and last order date.
55. Calculate customer lifetime revenue.
56. Find products whose revenue is above the average product revenue.
57. Find stores whose revenue is above the average store revenue.
58. Find monthly revenue growth percentage.
59. Find month-over-month order growth.
60. Find the best-selling product in every month.
61. Find the best customer in every store.
62. Find the category with the highest average order value.
63. Find employees generating the highest sales.
64. Find the most common return reason by category.
65. Find low-stock products by store.

SECTION C – ADVANCED SQL (66–105)
66. Rank products within each category by revenue.
67. Rank customers within each state by revenue.
68. Calculate running monthly revenue.
69. Calculate running revenue by store.
70. Calculate 3-month moving average revenue.
71. Calculate month-over-month revenue growth using LAG.
72. Calculate year-over-year revenue growth.
73. Find each customer's first purchase product.
74. Find customers who purchased from at least 5 different categories.
75. Find customers who purchased in every quarter of 2025.
76. Find customers with consecutive monthly purchases.
77. Find the longest gap between two customer orders.
78. Find the top 10% customers by revenue.
79. Segment customers into Bronze/Silver/Gold/Platinum using revenue.
80. Calculate customer retention: customers active in consecutive months.
81. Find products whose sales increased for 3 consecutive months.
82. Find products whose sales decreased for 3 consecutive months.
83. Find the top 3 products per category per month.
84. Find the most recent inventory record for every store-product pair.
85. Find products with negative/invalid inventory movements.
86. Identify duplicate payment transaction references.
87. Identify orders where payment amount differs from calculated order amount.
88. Identify orders with payment marked Paid but missing payment record.
89. Identify completed orders without shipment.
90. Identify shipments delivered before shipment date.
91. Calculate return rate using returned quantity / sold quantity.
92. Find stores with revenue growth above 20% YoY.
93. Find products contributing to 80% of total revenue.
94. Calculate Pareto customers contributing to 80% revenue.
95. Find the median order value.
96. Find the 90th percentile order value.
97. Find the category with the fastest revenue growth.
98. Find customers whose spending is above their state's average.
99. Find products whose price is above category average but sales are below category average.
100. Find each store's best and worst performing month.
101. Find the first order after customer registration.
102. Calculate days from registration to first purchase.
103. Find customers who returned products more than twice.
104. Find suppliers whose products have the highest return rate.
105. Create a monthly sales summary using a CTE and window functions.

SECTION D – REAL-TIME BUSINESS SCENARIOS (106–145)
106. Management wants a monthly sales dashboard. Return month, orders, revenue, profit and average order value.
107. Finance reports that some payment records may not match order totals. Find suspicious orders.
108. Operations wants a list of delayed deliveries where delivery time exceeds the company SLA of 7 days.
109. Inventory wants products that need immediate replenishment at each store.
110. Marketing wants the top 5% customers for a loyalty campaign.
111. Marketing wants customers who purchased Electronics but never purchased Accessories.
112. Management wants the top-performing store in every region.
113. Finance wants refund exposure by month and return reason.
114. Procurement wants suppliers whose products have high sales but poor ratings.
115. Product management wants products launched more than 12 months ago with declining sales.
116. Customer service wants customers with more than 3 returns in the last 12 months.
117. Logistics wants carrier-wise delivery SLA performance.
118. Management wants cancelled-order trends and the stores with the highest cancellation rate.
119. Finance wants monthly gross margin = revenue - estimated product cost.
120. Find products with high revenue but low margin.
121. Find stores with high sales but poor customer retention.
122. Identify customers who became inactive after being high-value customers.
123. Find customers who have not purchased for 180+ days.
124. Find products that frequently appear in returned orders.
125. Find suspicious repeated orders from the same customer within 5 minutes.
126. Identify possible duplicate payments using amount, customer and date proximity.
127. Find orders where a customer changed city/state between consecutive orders.
128. Find the busiest order day of the week.
129. Find peak order hours.
130. Find seasonal category performance by month.
131. Find the best product for each customer.
132. Find customers whose current-year spending is lower than previous-year spending.
133. Find stores whose current-year revenue is lower than previous-year revenue.
134. Find products with zero sales in the latest 90 days but active status.
135. Find products with high inventory and low sales (dead stock).
136. Find inventory stock-out risk using recent sales velocity.
137. Find customers likely to churn using last purchase date and order frequency.
138. Create a customer RFM analysis using Recency, Frequency and Monetary value.
139. Create a product ABC classification based on cumulative revenue.
140. Create store performance grades using revenue, margin, cancellation and delivery KPIs.
141. Build an executive monthly KPI query with Revenue, Orders, AOV, Margin, Returns and Cancellation Rate.
142. Build a daily sales anomaly report using average and standard deviation.
143. Identify the top 10 customers affected by delayed deliveries.
144. Identify categories where return rate is increasing for 3 consecutive months.
145. Recommend products for a customer based on categories they bought previously but products they never bought.

SECTION E – SQL OBJECTS & PERFORMANCE (146–170)
146. Create a view for monthly sales performance.
147. Create a view for customer lifetime value.
148. Create a stored procedure to return sales between two dates.
149. Create a stored procedure for customer order history.
150. Create a stored procedure for low-stock products.
151. Create a stored procedure for top N products by category.
152. Create a scalar/table-valued function for customer lifetime revenue.
153. Create a function to classify customers by revenue.
154. Create a trigger to audit product price changes.
155. Create an audit table and trigger for order status changes.
156. Demonstrate a transaction for order creation and payment creation.
157. Add TRY/CATCH error handling to a transaction.
158. Create indexes for the most frequently filtered/joined columns.
159. Compare query performance before and after indexing.
160. Use Actual Execution Plan to identify an expensive query.
161. Rewrite a correlated subquery using a window function.
162. Rewrite a cursor-based solution using set-based SQL.
163. Compare CTE, temp table and derived table approaches.
164. Find implicit conversion problems in predicates.
165. Identify missing-index recommendations carefully and validate them.
166. Create a reporting table for monthly aggregated sales.
167. Build a stored procedure that refreshes the reporting table.
168. Create a SQL Agent job design for daily sales refresh (design exercise).
169. Implement transaction isolation demonstrations.
170. Prepare a final optimization report explaining 3 slow queries and improvements.

FINAL CAPSTONE
171. Build an end-to-end management report query that provides:
    - Revenue
    - Gross profit
    - Orders
    - AOV
    - New customers
    - Returning customers
    - Cancellation rate
    - Return rate
    - Delivery SLA %
    - Top product
    - Top category
    - Top store
    - Top customer

172. Build a customer 360 query containing:
    customer profile, first order, latest order, total orders,
    total revenue, average order value, returns, favorite category,
    favorite product, days since last purchase and RFM segment.

173. Build an inventory intelligence query containing:
    current stock, average daily sales, days of inventory,
    reorder flag, dead-stock flag and stock-out risk.

174. Build an executive exception report containing only:
    suspicious payments, delayed shipments, high-return products,
    dead stock, inactive VIP customers and high cancellation stores.

175. FINAL PROJECT:
    Design a complete SQL solution for an e-commerce management team.
    Explain the business problem, database design, queries, KPIs,
    indexes, stored procedures, views and performance improvements.
