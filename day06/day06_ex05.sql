/*
To comply with Data Governance Policies, you need to add comments 
for the table and the table's columns. Let's apply this policy 
to the person_discounts table. Please add English or Russian comments 
explaining what is a business goal of a table and all its attributes.
*/

COMMENT ON TABLE person_discounts IS 'Table containing information about discounts provided to customers by pizzerias.';
COMMENT ON COLUMN person_discounts.id IS 'Primary key identifier';
COMMENT ON COLUMN person_discounts.person_id IS 'Identifier of the customer who is provided the discount.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Identifier of the pizzeria providing the discount.';
COMMENT ON COLUMN person_discounts.discount IS 'The amount of discount provided to the customer (as a percentage of the order value).';