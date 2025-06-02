/*
  Portfolio Project: CRM System in BigQuery
  Author: Nicole P. Collins
  Description:
    This project demonstrates a mock Customer Relationship Management (CRM) system using SQL in Google BigQuery. 
    It includes a normalized schema with Customers, Leads, Contacts, and Opportunities, as well as analytical 
    queries to support business decision-making.

  Objective:
    Showcase relational modeling, SQL querying, and analytical thinking with practical CRM data.
*/

-- 📊 Query 1: Total pipeline value for open opportunities
-- Purpose: Helps stakeholders understand how much potential revenue is currently active.
SELECT 
  SUM(value) AS total_pipeline_value
FROM `confident-trail-168616.crm_portfolio.opportunities`
WHERE stage NOT IN ('Closed Won', 'Closed Lost');

-- 📈 Query 2: Opportunities by stage
-- Purpose: Visualizes the sales funnel by showing how many deals are at each stage.
SELECT 
  stage,
  COUNT(*) AS opportunity_count
FROM `confident-trail-168616.crm_portfolio.opportunities`
GROUP BY stage
ORDER BY opportunity_count DESC;

-- 🏆 Query 3: Top customers by potential revenue
-- Purpose: Identifies key customers contributing the most to sales pipeline.
SELECT 
  c.customer_name,
  COUNT(o.opportunity_id) AS opportunity_count,
  SUM(o.value) AS total_value
FROM `confident-trail-168616.crm_portfolio.opportunities` AS o
JOIN `confident-trail-168616.crm_portfolio.customers` AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_value DESC;
