create database bikestore;
use bikestore;

desc orders;

desc customers;
select * from customers;
##total orders  1
select count(order_id) as totalorders from orders;
##total products 
select count(product_id) as totalproducts from products;
##total customers 
select count(customer_id) as totalcustomer from customers;
 
 ##product Analysis
 select * from products;
 ##top 10 most expensive bikes 2
 select * from products order by list_price desc limit 10;
 
 select * from categories;
 ## how many bikes in each category 3
 select p1.category_id, count(product_id) as categorytotal_products from products p1
 group by p1.category_id order by categorytotal_products ;
 
 ## view the product name and category id wwith category name 4
 select p1.product_id,p1.product_name,p1.category_id,c1.category_name from products p1
 left join categories c1 on p1.category_id=c1.category_id;
 
 ##sales analysis 
 
 select * from orders ;
 select * from order_items;
##top 5 most expencive orders with thier discount 5
select ot.order_id, round(sum(list_price))as totalprice,sum(discount) as totaldiscount from order_items ot group by order_id order by totalprice desc limit 5;
##customer detail of highest purchase 6
select c.customer_id,c.first_name,c.last_name,c.email,c.city from customers c join orders o on c.customer_id = o.customer_id where order_id in ('1348','1482','1541','1506','1364');

##top 5 good selling product 7
select ot.product_id, sum(quantity) as total_quantity from order_items ot group by product_id order by total_quantity desc limit 5;

##top selling product : 8
select p.product_id,p.product_name,p.model_year,p.list_price from  products p where product_id in ('6' ,'13','16','23','7');


CREATE VIEW Monthly_orders AS
 SELECT EXTRACT(YEAR FROM Order_Date) AS year,  EXTRACT(MONTH FROM Order_Date) AS months, 
 count(Order_ID) AS Totalorders,RANK() OVER (ORDER BY count(order_id)DESC) AS CategoryRank
 FROM orders
 GROUP BY year, months
 ORDER BY year, months ;
 
SELECT *
FROM Monthly_orders;

select from customers full join orders o on o.customer.id = customer_id ;



 


