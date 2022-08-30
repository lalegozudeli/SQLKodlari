CREATE TABLE calisanlar
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar;
select * from markalar;

-- SORU1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu
-- markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isim, maas, isyeri from calisanlar 
where isyeri 
in(select marka_isim from markalar where calisan_sayisi>15000);         
------>Bir üst satır bağlantı noktasıdır ve birlestirip bağlamak için in kullanılır
-----select isim, maas, isyeri from calisanlar kısmı calisanlar kısmından alındı
-----where isyeri ile de şartı ekledik
-----select marka_isim, calisan_sayisi from markalar where calisan_sayisi>15000; ile soruya cevap alma kısmı yazıldı
-----> IN kullanacaksanız parantez içine aldığınız sorgu birden fazla değer döndürmelidir


select * from calisanlar; -----calisanlar tablosu için birleşme yeri isyeri
select * from markalar;--- markalar tablosu için birleşme yeri marke_isim kısmıdır


-- SORU2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve
--şehirlerini listeleyiniz.
select isim, maas, sehir from calisanlar
where isyeri in(select marka_isim from markalar where marka_id > '101');
