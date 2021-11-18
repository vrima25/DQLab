use dqlab;

-- Tugas Praktek 1 : Menggunakan INNER JOIN --
select * from ms_item_warna
inner join ms_item_kategori
on ms_item_warna.nama_barang = ms_item_kategori.nama_item;

-- tabel tr_penjualan dan tabel ms_produk --
select * from tr_penjualan;
select * from ms_produk;

-- Tugas Praktek 2 : Menggunakan INNER JOIN --
select * from tr_penjualan
inner join ms_produk
on tr_penjualan.kode_produk = ms_produk.kode_produk;

-- Tugas Praktek 3 : Menggunakan INNER JOIN --
select tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, tr_penjualan.kode_produk, ms_produk.nama_produk, ms_produk.harga, tr_penjualan.qty, ms_produk.harga*tr_penjualan.qty as total from tr_penjualan
inner join ms_produk
on tr_penjualan.kode_produk = ms_produk.kode_produk;

-- Tabel yang akan digabungkan --
select * from tabel_A;
select * from tabel_B;

-- Menggunakan UNION --
select * from tabel_A
union
select * from tabel_B;

-- Menggunakan UNION dengan Klausa WHERE --
select * from tabel_A
where kode_pelanggan = 'dqlabcust03'
union
select * from tabel_B
where kode_pelanggan = 'dqlabcust03';

-- Menggunakan UNION dan Menyelaraskan Kolom-kolomnya --
select CustomerName, ContactName, City, PostalCode
from Customers
union
select Suppliername, ContactName, City, PostalCode
from Suppliers;

-- PROJECT INNER JOIN --
select distinct ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_customer, ms_pelanggan.alamat
from ms_pelanggan
inner join tr_penjualan
on ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
where tr_penjualan.nama_produk = 'Kotak Pensil DQLab' or
tr_penjualan.nama_produk = 'Flashdisk DQLab 32GB' or
tr_penjualan.nama_produk = 'Sticky Notes DQLab 500 sheets';

-- PROJECT UNION --
select nama_produk, kode_produk, harga
from ms_produk_1
where harga < 100000
union
select nama_produk, kode_produk, harga
from ms_produk_2
where harga < 50000;