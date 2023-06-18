-- Murat Alpöz 20120205008 
-- create islemleri
create table şube(
şube_id int NOT NULL,
şube_adı varchar(20) NOT NULL,
PRIMARY KEY (şube_id)
);

create table branş(
branş_id int NOT NULL,
branş_adı varchar(20) NOT NULL,
PRIMARY KEY (branş_id)
);

create table öğrenci(
öğrenci_id int NOT NULL,
isim varchar(20) NOT NULL,
soyisim varchar(20) NOT NULL,
öğrenci_no int NOT NULL,
şube_id int NOT NULL,
FOREIGN KEY (şube_id) REFERENCES şube(şube_id),
PRIMARY KEY (öğrenci_id)
);

create table öğretmen(
öğretmen_id int NOT NULL,
isim varchar(20) NOT NULL,
soyisim varchar(20) NOT NULL,
şube_id int NOT NULL,
FOREIGN KEY (şube_id) REFERENCES şube(şube_id),
branş_id int NOT NULL,
FOREIGN KEY (branş_id) REFERENCES şube(şube_id),
PRIMARY KEY (öğretmen_id)
);


create table ders(
ders_id int NOT NULL,
ders_adı varchar(20) NOT NULL,
katsayi int NOT NULL,
PRIMARY KEY (ders_id)
);


create table kulüp(
kulüp_id int NOT NULL,
kulüp_adı varchar(20) NOT NULL,
PRIMARY KEY (kulüp_id)
);

create table öğrenci_kulüp(
öğrenci_id int NOT NULL,
FOREIGN KEY (öğrenci_id) REFERENCES öğrenci(öğrenci_id),
kulüp_id int NOT NULL,
FOREIGN KEY (kulüp_id) REFERENCES kulüp(kulüp_id)
);

create table puan(
öğrenci_id int NOT NULL,
FOREIGN KEY (öğrenci_id) REFERENCES öğrenci(öğrenci_id),
ders_id int NOT NULL,
FOREIGN KEY (ders_id) REFERENCES ders(ders_id),
puan int NOT NULL
);

create table şube_öğretmen(
öğretmen_id int NOT NULL,
FOREIGN KEY (öğretmen_id) REFERENCES öğretmen(öğretmen_id),
şube_id int NOT NULL,
FOREIGN KEY (şube_id) REFERENCES şube(şube_id),
ders_id int NOT NULL,
FOREIGN KEY (ders_id) REFERENCES ders(ders_id)
);

-- index islemleri
CREATE INDEX index_öğrenci
ON öğrenci (öğrenci_id, isim, soyisim, öğrenci_no, şube_id);

CREATE INDEX index_öğretmen
ON öğretmen (öğretmen_id, isim, soyisim, branş_id, şube_id);

CREATE INDEX index_şube
ON şube (şube_id, şube_adı);

CREATE INDEX index_ders
ON ders (ders_id, ders_adı, katsayi);

CREATE INDEX index_branş
ON branş (branş_id, branş_adı);

CREATE INDEX index_kulüp
ON kulüp (kulüp_id, kulüp_adı);

CREATE INDEX index_öğrenci_kulüp
ON öğrenci_kulüp (öğrenci_id, kulüğ_id);

CREATE INDEX index_puan
ON puan (öğrenci_id, ders_id, puan);

CREATE INDEX index_şube_öğretmen
ON şube_öğretmen (öğretmen_id, şube_id, ders_id);

-- insert into sorgusu

INSERT INTO şube
VALUES (1,'9/A');
INSERT INTO şube
VALUES (2,'9/B');
INSERT INTO şube
VALUES (3,'9/C');
INSERT INTO şube
VALUES (4,'9/D');
INSERT INTO şube
VALUES (5,'9/E');


INSERT INTO branş
VALUES (1,'Kimya');
INSERT INTO branş
VALUES (2,'Matematik');
INSERT INTO branş
VALUES (3,'Biyoloji');
INSERT INTO branş
VALUES (4,'Edebiyat');
INSERT INTO branş
VALUES (5,'Felsefe');

INSERT INTO öğrenci
VALUES (1,'Bülent','Ersoy',10,1);
INSERT INTO öğrenci
VALUES (2,'Müslüm','Gürses',11,2);
INSERT INTO öğrenci
VALUES (3,'Cem','Karaca',12,3);
INSERT INTO öğrenci
VALUES (4,'İbrahim','Tatlıses',13,4);
INSERT INTO öğrenci
VALUES (5,'Barış','Manço',14,1);


INSERT INTO öğretmen
VALUES (1,'Marie','Curie',1,1);  
INSERT INTO öğretmen
VALUES (2,'Cahit','Arf',2,5);
INSERT INTO öğretmen
VALUES (3,'Aziz','Sancar',3,4);
INSERT INTO öğretmen
VALUES (4,'Demet','Akalın',4,3);
INSERT INTO öğretmen
VALUES (5,'İlber','Ortaylı',5,2);


INSERT INTO ders
VALUES (1,'Kimya',5);
INSERT INTO ders
VALUES (2,'Matematik',10);
INSERT INTO ders
VALUES (3,'Biyoloji',10);
INSERT INTO ders
VALUES (4,'Edebiyat',10);
INSERT INTO ders
VALUES (5,'Felsefe',5);

INSERT INTO kulüp
VALUES (1,'Resim');
INSERT INTO kulüp
VALUES (2,'Müzik');
INSERT INTO kulüp
VALUES (3,'Kızılay');
INSERT INTO kulüp
VALUES (4,'Spor');
INSERT INTO kulüp
VALUES (5,'Çevre');

INSERT INTO öğrenci_kulüp
VALUES (1,3);
INSERT INTO öğrenci_kulüp
VALUES (2,4);
INSERT INTO öğrenci_kulüp
VALUES (3,1);
INSERT INTO öğrenci_kulüp
VALUES (4,2);
INSERT INTO öğrenci_kulüp
VALUES (5,5);


INSERT INTO puan
VALUES (1,1,80);
INSERT INTO puan
VALUES (1,2,90);
INSERT INTO puan
VALUES (1,3,40);
INSERT INTO puan
VALUES (1,4,60);
INSERT INTO puan
VALUES (1,5,75);

INSERT INTO puan
VALUES (2,1,80);
INSERT INTO puan
VALUES (2,2,85);
INSERT INTO puan
VALUES (2,3,90);
INSERT INTO puan
VALUES (2,4,100);
INSERT INTO puan
VALUES (2,5,95);

INSERT INTO puan
VALUES (3,1,50);
INSERT INTO puan
VALUES (3,2,47);
INSERT INTO puan
VALUES (3,3,80);
INSERT INTO puan
VALUES (3,4,40);
INSERT INTO puan
VALUES (3,5,90);

INSERT INTO puan
VALUES (4,1,80);
INSERT INTO puan
VALUES (4,2,50);
INSERT INTO puan
VALUES (4,3,25);
INSERT INTO puan
VALUES (4,4,97);
INSERT INTO puan
VALUES (4,5,100);

INSERT INTO puan
VALUES (5,1,40);
INSERT INTO puan
VALUES (5,2,50);
INSERT INTO puan
VALUES (5,3,45);
INSERT INTO puan
VALUES (5,4,100);
INSERT INTO puan
VALUES (5,5,75);


INSERT INTO şube_öğretmen
VALUES (1,1,1);
INSERT INTO şube_öğretmen
VALUES (1,2,1);
INSERT INTO şube_öğretmen
VALUES (1,3,1);
INSERT INTO şube_öğretmen
VALUES (1,4,1);
INSERT INTO şube_öğretmen
VALUES (1,5,1);

INSERT INTO şube_öğretmen
VALUES (5,1,2);
INSERT INTO şube_öğretmen
VALUES (5,2,2);
INSERT INTO şube_öğretmen
VALUES (5,3,2);
INSERT INTO şube_öğretmen
VALUES (5,4,2);
INSERT INTO şube_öğretmen
VALUES (5,5,2);

INSERT INTO şube_öğretmen
VALUES (4,1,3);
INSERT INTO şube_öğretmen
VALUES (4,2,3);
INSERT INTO şube_öğretmen
VALUES (4,3,3);
INSERT INTO şube_öğretmen
VALUES (4,4,3);
INSERT INTO şube_öğretmen
VALUES (4,5,3);

INSERT INTO şube_öğretmen
VALUES (2,1,5);
INSERT INTO şube_öğretmen
VALUES (2,2,5);
INSERT INTO şube_öğretmen
VALUES (2,3,5);
INSERT INTO şube_öğretmen
VALUES (2,4,5);
INSERT INTO şube_öğretmen
VALUES (2,5,5);

INSERT INTO şube_öğretmen
VALUES (3,1,5);
INSERT INTO şube_öğretmen
VALUES (3,2,5);
INSERT INTO şube_öğretmen
VALUES (3,3,5);
INSERT INTO şube_öğretmen
VALUES (3,4,4);
INSERT INTO şube_öğretmen
VALUES (3,5,4);

-- filtreleme
SELECT ders_adı as seçmeli_dersler
from ders
where katsayi=5;

-- join ile filtreleme
SELECT isim as biyolojiden_geçti
from puan
INNER JOIN öğrenci ON puan.öğrenci_id=öğrenci.öğrenci_id 
where ders_id=3 and puan>=50;

-- senaryo 1: biyoloji dersinin genel not ortalaması     
SELECT avg(puan) as biyoloji ortalama
FROM puan
where ders_id=3;

-- senaryo 2: derslerden alınan en düşük notlar 
select ders_adı as ders ,min(puan) as min_puan
from puan 
INNER JOIN ders ON puan.ders_id = ders.ders_id
group by ders_adı;

-- senaryo 3: derslerden alınan en yüksek notlar
select ders_adı as ders ,max(puan) as max_puan
from puan 
INNER JOIN ders ON puan.ders_id = ders.ders_id
group by ders_adı;

-- senaryo 4:   derslere göre 50 barajını geçemeyen öğrenci sayısı 
select ders_adı as ders, count(öğrenci_id) as geçen_sayısı
from puan
INNER JOIN ders ON puan.ders_id = ders.ders_id
where puan<50
group by ders_adı;


-- UPDATE 
UPDATE puan
SET puan=80
WHERE öğrenci_id=3 and ders_id=1;

-- DELETE 
DELETE FROM şube_öğretmen where öğretmen_id=5;