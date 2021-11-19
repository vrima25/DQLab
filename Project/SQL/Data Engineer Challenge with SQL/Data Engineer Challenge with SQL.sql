use dqlab;

-- Produk DQLab Mart --
select no_urut, kode_produk,nama_produk,harga
from ms_produk
where harga > 50000 and harga < 150000;

-- Thumb drive di DQLab Mart --
select no_urut, kode_produk, nama_produk, harga
from ms_produk
where nama_produk like '%Flashdisk%';

-- Pelanggan Bergelar --
select no_urut, kode_pelanggan, nama_pelanggan, alamat
from ms_pelanggan
where nama_pelanggan like '%S.H%' or nama_pelanggan like 'Ir.%'
or nama_pelanggan like '%Drs.%';

-- Mengurutkan Nama Pelanggan --
select nama_pelanggan
from ms_pelanggan
order by nama_pelanggan;

-- Mengurutkan Nama Pelanggan Tanpa Gelar --
select nama_pelanggan
from ms_pelanggan
order by
case when left(nama_pelanggan,3)='Ir.'
then substring(nama_pelanggan,5,100)
else nama_pelanggan END asc;

-- Nama Pelanggan yang Paling Panjang --
select nama_pelanggan
from ms_pelanggan
where length(nama_pelanggan) in (select max(length(nama_pelanggan))
from ms_pelanggan)
order by length(nama_pelanggan) desc;

-- Nama Pelanggan yang Paling Panjang dengan Gelar --
select nama_pelanggan
from ms_pelanggan
where length(nama_pelanggan) IN (select max(length(nama_pelanggan))
								 from ms_pelanggan)
or length(nama_pelanggan) in (select min(length(nama_pelanggan))
							     from ms_pelanggan)
order by length(nama_pelanggan) desc;

-- Kuantitas Produk yang Banyak Terjual --
select ms_produk.kode_produk, ms_produk.nama_produk, sum(tr_penjualan_detail.qty) as total_qty
from ms_produk join tr_penjualan_detail
on ms_produk.kode_produk=tr_penjualan_detail.kode_produk
group by ms_produk.kode_produk, ms_produk.nama_produk
having total_qty = 7;

-- Pelanggan Paling Tinggi Nilai Belanjanya --
select ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_pelanggan, sum(tr_penjualan_detail.harga_satuan*qty) as total_harga
from ms_pelanggan
JOIN tr_penjualan
on ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
JOIN tr_penjualan_detail
on tr_penjualan_detail.kode_transaksi = tr_penjualan.kode_transaksi
group by ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_pelanggan
order by total_harga desc
limit 1;

-- Pelanggan yang Belum Pernah Berbelanja --
select kode_pelanggan, nama_pelanggan, alamat
from ms_pelanggan
where kode_pelanggan not in (select kode_pelanggan from tr_penjualan);

-- Transaksi Belanja dengan Daftar Belanja lebih dari 1 --
select tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, ms_pelanggan.nama_pelanggan, tr_penjualan.tanggal_transaksi, count(tr_penjualan_detail.kode_produk) as jumlah_detail
from tr_penjualan
join ms_pelanggan
on tr_penjualan.kode_pelanggan = ms_pelanggan.kode_pelanggan
join tr_penjualan_detail
on tr_penjualan.kode_transaksi = tr_penjualan_detail.kode_transaksi
group by tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, ms_pelanggan.nama_pelanggan, tr_penjualan.tanggal_transaksi
having count(tr_penjualan_detail.kode_produk)>1;



