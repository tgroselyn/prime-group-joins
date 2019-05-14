--BASE MODE

--1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id;

--2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders" 
JOIN "line_items" ON "line_items".order_id = "orders".id;

--3. Which warehouses have cheetos?
SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description LIKE 'cheetos';

--4. Which warehouses have diet pepsi?
SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description LIKE 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".id, "customers".first_name, "customers".last_name, count("orders".id) FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id
FULL JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".id;

--6. How many customers do we have?
SELECT count("customers".id) FROM "customers";

--7. How many products do we carry?
SELECT count("products".id) FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT "products".description, sum("warehouse_product".on_hand) AS "quantity" FROM "products"
JOIN "warehouse_product" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description;

--STRETCH MODE

--9. How much was the total cost for each order?

--10. How much has each customer spent in total?

--11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).