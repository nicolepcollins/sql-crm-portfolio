CREATE TABLE `confident-trail-168616.crm_portfolio.customers` (
  customer_id STRING NOT NULL,
  customer_name STRING,
  industry STRING,
  region STRING,
  created_at TIMESTAMP,
  PRIMARY KEY (customer_id) NOT ENFORCED
);
CREATE TABLE `confident-trail-168616.crm_portfolio.contacts` (
  contact_id STRING NOT NULL,
  customer_id STRING NOT NULL,
  first_name STRING,
  last_name STRING,
  email STRING,
  phone STRING,
  created_at TIMESTAMP,
  PRIMARY KEY (contact_id) NOT ENFORCED,
  FOREIGN KEY (customer_id) REFERENCES crm_portfolio.customers (customer_id) NOT ENFORCED
);
CREATE TABLE `confident-trail-168616.crm_portfolio.leads` (
  lead_id STRING NOT NULL,
  lead_name STRING,
  contact_email STRING,
  source STRING,         -- How did this lead come in? (e.g., referral, web)
  status STRING,         -- e.g., "new", "contacted", "qualified", "disqualified"
  created_at TIMESTAMP,
  PRIMARY KEY (lead_id) NOT ENFORCED
);
CREATE TABLE `confident-trail-168616.crm_portfolio.opportunities` (
  opportunity_id STRING NOT NULL,
  customer_id STRING,           -- Nullable: opportunity linked to existing customer
  lead_id STRING,               -- Nullable: opportunity linked to a lead
  opportunity_name STRING,
  value NUMERIC,               -- Estimated deal value
  stage STRING,                -- e.g., "Prospecting", "Negotiation", "Closed Won", "Closed Lost"
  close_date DATE,
  created_at TIMESTAMP,
  PRIMARY KEY (opportunity_id) NOT ENFORCED,
  FOREIGN KEY (customer_id) REFERENCES crm_portfolio.customers (customer_id) NOT ENFORCED,
  FOREIGN KEY (lead_id) REFERENCES crm_portfolio.leads (lead_id) NOT ENFORCED
);

