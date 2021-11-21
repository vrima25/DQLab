use dqlab;

-- Overall Performance by Year --
select year(order_date) as years, round(sum(sales)) as sales,
count(order_id) as number_of_order
from dqlab_sales_store
where order_status = 'Order Finished'
group by years
order by years;

-- Overall Performance by Product Sub Category --
select year(order_date) as years, product_sub_category,
sum(sales) as sales
from dqlab_sales_store
where year(order_date) between 2011 and 2012
and order_status like 'Order_Finished'
group by years, product_sub_category
order by years, sales DESC;

-- Promotion Effectiveness and Efficiency by Years --
select year(order_date) as years, sum(sales) as sales,
sum(discount_value) as promotion_value,
round((sum(discount_value) / sum(sales)*100),2) as burn_rate_percentage
from dqlab_sales_store
where year(order_date) between 2009 and 2012
and order_status like 'Order Finished'
group by years
order by years;

-- Promotion Effectiveness and Efficiency by Product Sub Category --
select year(order_date) as years, product_sub_category,
product_category, sum(sales) as sales,
sum(discount_value) as promotion_value,
round((sum(discount_value)/sum(sales)*100), 2) as burn_rate_percentage
from dqlab_sales_store
where year(order_date) = 2012
and order_status like 'Order Finished'
group by years, product_sub_category, product_category
order by sales desc;

-- Customers Transactions per Year --
select year(order_date) as years, count(DISTINCT customer) as number_of_customer
from dqlab_sales_store
where order_status = 'Order Finished'
group by years;


