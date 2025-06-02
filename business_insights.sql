-- Query: Total value of all open (non-closed) opportunities
-- Helps the business understand how much revenue is currently at stake.
SELECT 
  SUM(value) AS total_pipeline_value
FROM `confident-trail-168616.crm_portfolio.opportunities`
WHERE stage NOT IN ('Closed Won', 'Closed Lost');

-- Query: Number of opportunities grouped by their sales stage
-- Useful for pipeline visualization and sales funnel analysis.
SELECT 
  stage,
  COUNT(*) AS opportunity_count
FROM `confident-trail-168616.crm_portfolio.opportunities`
GROUP BY stage
ORDER BY opportunity_count DESC;

-- Query: Total number of opportunities and value per customer
-- Helps prioritize key accounts based on potential revenue.
SELECT 
  c.customer_name,
  COUNT(o.opportunity_id) AS opportunity_count,
  SUM(o.value) AS total_value
FROM `confident-trail-168616.crm_portfolio.opportunities` AS o
JOIN `confident-trail-168616.crm_portfolio.customers` AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_value DESC;

-- Query: Calculate lead conversion rate (leads that became opportunities)
-- Helps assess marketing effectiveness in converting leads into sales opportunities.
SELECT
  (SELECT COUNT(*) FROM `confident-trail-168616.crm_portfolio.opportunities` WHERE lead_id IS NOT NULL) 
    * 1.0 / 
  (SELECT COUNT(*) FROM `confident-trail-168616.crm_portfolio.leads`) 
    AS lead_conversion_rate;
