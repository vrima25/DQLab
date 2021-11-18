use dqlab;

-- Fungsi Skalar Matematika - ABS() --
select StudentID, FirstName, LastName, Semester1, Semester2,
ABS(MarkGrowth) as MarkGrowth from students;

-- Fungsi Skalar Matematika - CEILING() --
select StudentID, Firstname, LastName, CEILING(Semester1) as Semester1, CEILING(Semester2) as Semester2, MarkGrowth
from students;

-- Fungsi Skalar Matematika - FLOOR() --
select StudentID, FirstName, LastName, FLOOR(Semester1) as Semester1,
FLOOR(Semester2) as Semester2, MarkGrowth from students;

-- Fungsi Skalar Matematika - ROUND() --
select StudentID, FirstName, LastName,
ROUND(Semester1,1) as Semester1, ROUND(Semester2,0) as Semester2, MarkGrowth
from students;

-- Fungsi Skalar Matematika - SQRT( ) --
select StudentID, FirstName, LastName,
SQRT(Semester1) as Semester1, Semester2, MarkGrowth
from students;

-- Tugas Praktek --
select StudentID, FirstName, LastName,
MOD(Semester1, 2) as Semester1, Semester2, EXP(MarkGrowth)
from students;

-- Fungsi Text - CONCAT( ) --
select StudentID, CONCAT(FirstName, LastName) as Name,
Semester1, Semester2, MarkGrowth
from students;

-- Fungsi Text - SUBSTRING_INDEX( ) --
select StudentID, SUBSTRING_INDEX(Email, '@', 1) as Name
from students;

-- Fungsi Text - SUBSTR( ) --
select StudentID, SUBSTR(FirstName, 2, 3) as Initial
from students;

-- Fungsi Text - LENGTH( ) --
select StudentID, FirstName, LENGTH(FirstName) as Total_Char
from students;

-- Fungsi Text - REPLACE( ) --
select StudentID, Email, REPLACE(Email, 'yahoo', 'gmail') as New_Email
from students;

-- Tugas Praktek --
select StudentID, UPPER(FirstName) as FirstName, LOWER(LastName) as LastName
from students;

-- Fungsi Aggregate - SUM() --
select sum(Semester1) as Total_1, sum(Semester2) as Total_2
from students;

-- Fungsi Aggregate - COUNT() --
select count(FirstName) as Total_Student
from students;

-- Fungsi Aggregate - AVG( ) --
select avg(Semester1) as AVG_1, avg(Semester2) as AVG_2
from students;

-- Tugas Praktek --
select MIN(Semester1) as Min1, MAX(Semester1) as Max1,
MIN(Semester2) as Min2, MAX(Semester2) as Max2
from students;

-- Group by Single Column --
select province,
count(DISTINCT order_id) as total_order,
sum(item_price) as total_price
from sales_retail_2019
group by province;

-- Group by Multiple Column --
select province, brand, count(distinct order_id) as total_order,
sum(item_price) as total_price
from sales_retail_2019
group by province, brand;

-- Fungsi Aggregate dengan Grouping --
select province, count(distinct order_id) as total_unique_order, sum(item_price) as revenue from sales_retail_2019
group by province;

-- Tugas Praktek --
SELECT month(order_date) AS order_month, sum(item_price) AS total_price, 
CASE  
    WHEN sum(item_price) >= 30000000000 THEN 'Target Achieved'
    WHEN sum(item_price) <= 25000000000 THEN 'Less Performed'
    ELSE 'Follow Up'
END as remark
FROM sales_retail_2019
GROUP BY month(order_date);

-- MINI PROJECT --
-- Proyek Pekerjaan - Analisis Penjualan Part 1 --
-- 1. Total jumlah seluruh penjualan (total/revenue).
SELECT sum(total) as total 
FROM tr_penjualan;
-- 2. Total quantity seluruh produk yang terjual.
SELECT sum(qty) as qty 
FROM tr_penjualan;
-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, sum(qty) as qty, sum(total) as total 
FROM tr_penjualan
GROUP BY kode_produk;

-- Proyek Pekerjaan - Analisis Penjualan Part 2 --
-- 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, avg(total) as avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;
/* 5. Selain itu,  jangan lupa untuk menambahkan kolom baru 
dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 
3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K. */
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'  
    ELSE 'Medium'  
END as kategori
FROM tr_penjualan;