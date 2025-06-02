-- Query 1: Select all customer records
-- This gives a complete list of all customers currently in the CRM.
SELECT * 
FROM `confident-trail-168616.crm_portfolio.customers`;

-- Query 2: Join contacts with customers to show who each contact belongs to
-- Useful for understanding the relationship between customer accounts and individual contacts.
SELECT 
  c.contact_id,
  c.first_name,
  c.last_name,
  c.email,
  cu.customer_name
FROM `confident-trail-168616.crm_portfolio.contacts` AS c
JOIN `confident-trail-168616.crm_portfolio.customers` AS cu
  ON c.customer_id = cu.customer_id;

-- Query 3: Retrieve all leads and their metadata
-- Helps monitor how leads are progressing through the funnel (e.g., new, contacted, converted).
SELECT 
  lead_id,
  lead_name,
  source,
  status,
  created_at
FROM `confident-trail-168616.crm_portfolio.leads`;

-- Query 4: Display all opportunities and link them to their associated customer or lead
-- Some opportunities may be tied to existing customers; others are linked to leads.
-- This query uses LEFT JOINs to show both scenarios.
SELECT 
  o.opportunity_id,
  o.opportunity_name,
  cu.customer_name,
  l.lead_name,
  o.value,
  o.stage,
  o.close_date
FROM `confident-trail-168616.crm_portfolio.opportunities` AS o
LEFT JOIN `confident-trail-168616.crm_portfolio.customers` AS cu
  ON o.customer_id = cu.customer_id
LEFT JOIN `confident-trail-168616.crm_portfolio.leads` AS l
  ON o.lead_id = l.lead_id;


