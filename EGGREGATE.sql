-- AGGREGATE METHOD KULLANIMI--
/*
- Aggregate Methodları (SUM,COUNT,MIN,MAX,AVG)
-Subquery iççinde de kullanılr
-ancak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX : sum() şeklinde olmalı sum() arasında boşluk olmamalı
*/

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

select * from calisanlar2

-- some message

--calisanlar2 tablosundaki maaşların toplamını listeleyiniz
select sum(maas) from calisanlar2

--calisanlar2 tablosundaki maas ortalamalarını listeleyiniz
select avg(maas) from calisanlar2
select round(avg(maas)) from calisanlar2
select round(avg(maas),2) from calisanlar2

--calisanlar tablosundan en düşük maaşı listeleyiniz 
select min(maas) from calisanlar2

--calisanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz
select count(maas) from calisanlar2

select * from markalar

-- her markanın ismini çalışan sayısını ve o markaya ait çalışanların toplam maaşını listeleyiniz

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

select marka_id,calisan_sayisi, (select sum(maas)from calisanlar2 where marka_isim=isyeri)
AS toplam_maas from markalar

--ALIAS (AS) toplada geçici isim vermek istersek kolulsdan sonra AS sutun_isim olarak kullanılır

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini 
-- listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,(SELECT max(maas) from calisanlar2 where marka_isim=isyeri) AS max_maas,
                                 (SELECT min(maas) from calisanlar2 where marka_isim=isyeri) AS min_maas
from markalar;

--her markanın id sini ,ismini ve toplam kaç şehitde bulunduğunu listeleyen bir sorgu yazınız.

select marka_id,marka_isim,(select count(sehir)from calisanlar2 where marka_isim=isyeri)
AS sehir_sayisi from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.

select max(maas) AS enyukdek_ikinci_maas from calisanlar2
where maas < (select max(maas) from calisanlar2)

--Interview Question: En düşük ikinci maas değerini çağırın.

select min(maas) AS en_dusuk_ikinci_maas from calisanlar2
where maas >(select min(maas) from calisanlar2)

--Interview Question: En yüksek 3. maas değerini çağırın.

select max(maas) AS enyukdek_ucuncu_maas from calisanlar2
where maas <(select max (maas)from calisanlar2 where maas< (select max(maas) from calisanlar2))

-- en düsük ücüncü maaş değerini bulunuz.(ödev)
select min(maas) AS endusuk_ucuncu_maas from calisanlar2
where maas >(select min (maas)from calisanlar2 where maas> (select min(maas) from calisanlar2))




