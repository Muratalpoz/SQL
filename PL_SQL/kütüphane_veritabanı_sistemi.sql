--1

Kütüphane (Library) Tablosu:
kütüphaneID (PK): Kütüphane kimlik numarasý
adý: Kütüphane adý
adres: Kütüphane adresi

Kategori (Category) Tablosu:
kategoriID (PK): Kategori kimlik numarasý
adý: Kategori adý

Yazar (Author) Tablosu:
yazarID (PK): Yazar kimlik numarasý
adý: Yazarýn adý
soyadý: Yazarýn soyadý
Yayýnevi (Publisher) Tablosu:

yayýneviID (PK): Yayýnevi kimlik numarasý
adý: Yayýnevi adý
adres: Yayýnevi adresi
Kitap (Book) Tablosu:

kitapID (PK): Kitap kimlik numarasý
adý: Kitap adý
yayýnYýlý: Kitabýn yayýn yýlý
kategoriID (FK): Kategori kimlik numarasý
yazarID (FK): Yazar kimlik numarasý
yayýneviID (FK): Yayýnevi kimlik numarasý

Üye (Member) Tablosu:
üyeID (PK): Üye kimlik numarasý
adý: Üyenin adý
soyadý: Üyenin soyadý
adres: Üyenin adresi
telefon: Üyenin telefon numarasý

Ödünç (Loan) Tablosu:
ödünçID (PK): Ödünç kimlik numarasý
kitapID (FK): Kitap kimlik numarasý
üyeID (FK): Üye kimlik numarasý
alýnanTarih: Kitabýn alýndýðý tarih
dönüþTarih: Kitabýn geri dönüþ tarihi

Ceza (Fine) Tablosu:
cezaID (PK): Ceza kimlik numarasý
ödünçID (FK): Ödünç kimlik numarasý
miktar: Ceza miktarý
ödenmeDurumu: Ceza ödenme durumu
Çalýþan (Employee) Tablosu:

çalýþanID (PK): Çalýþan kimlik numarasý
adý: Çalýþanýn adý
soyadý: Çalýþanýn soyadý
pozisyon: Çalýþanýn pozisyonu
maaþ: Çalýþanýn maaþý

Raf (Shelf) Tablosu:
rafID (PK): Raf kimlik numarasý
adý: Raf adý

Yer (Location) Tablosu:
yerID (PK): Yer kimlik numarasý
adý: Yer adý
rafID (FK): Raf kimlik numarasý

Özel Gün (SpecialDay) Tablosu:
günID (PK): Gün kimlik numarasý
tarih: Özel gün tarihi
açýklama: Özel gün açýklamasý

------------------------------------------------------------------------

--2

-- Kütüphane Tablosu
CREATE TABLE kutuphane (
  kutuphaneID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  adres VARCHAR2(200)
);

-- Kategori Tablosu
CREATE TABLE kategori (
  kategoriID NUMBER PRIMARY KEY,
  adi VARCHAR2(100)
);

-- Yazar Tablosu
CREATE TABLE yazar (
  yazarID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  soyadi VARCHAR2(100)
);

-- Yayýnevi Tablosu
CREATE TABLE yayinevi (
  yayineviID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  adres VARCHAR2(200)
);

-- Kitap Tablosu
CREATE TABLE kitap (
  kitapID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  yayinYili NUMBER,
  kategoriID NUMBER,
  yazarID NUMBER,
  yayineviID NUMBER,
  FOREIGN KEY (kategoriID) REFERENCES kategori(kategoriID),
  FOREIGN KEY (yazarID) REFERENCES yazar(yazarID),
  FOREIGN KEY (yayineviID) REFERENCES yayinevi(yayineviID)
);

-- Üye Tablosu
CREATE TABLE uye (
  uyeID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  soyadi VARCHAR2(100),
  adres VARCHAR2(200),
  telefon VARCHAR2(20)
);

-- Ödünç Tablosu
CREATE TABLE odunc (
  oduncID NUMBER PRIMARY KEY,
  kitapID NUMBER,
  uyeID NUMBER,
  alinanTarih DATE,
  donusTarih DATE,
  FOREIGN KEY (kitapID) REFERENCES kitap(kitapID),
  FOREIGN KEY (uyeID) REFERENCES uye(uyeID)
);

-- Ceza Tablosu
CREATE TABLE ceza (
  cezaID NUMBER PRIMARY KEY,
  oduncID NUMBER,
  miktar NUMBER,
  odenmeDurumu VARCHAR2(20),
  FOREIGN KEY (oduncID) REFERENCES odunc(oduncID)
);

-- Çalýþan Tablosu
CREATE TABLE calisan (
  calisanID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  soyadi VARCHAR2(100),
  pozisyon VARCHAR2(100),
  maas NUMBER
);

-- Raf Tablosu
CREATE TABLE raf (
  rafID NUMBER PRIMARY KEY,
  adi VARCHAR2(100)
);

-- Yer Tablosu
CREATE TABLE yer (
  yerID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  rafID NUMBER,
  FOREIGN KEY (rafID) REFERENCES raf(rafID)
);

-- Özel Gün Tablosu
CREATE TABLE ozelgun (
  gunID NUMBER PRIMARY KEY,
  tarih DATE,
  aciklama VARCHAR2(200)
);

-------------------------------------------------------------------------
--4

CREATE OR REPLACE PACKAGE kutuphane_pkg IS
  PROCEDURE veriGirisi;
END kutuphane_pkg;
/

CREATE OR REPLACE PACKAGE BODY kutuphane_pkg IS
  PROCEDURE veriGirisi IS
  BEGIN
    -- Kütüphane verileri
    INSERT INTO kutuphane (kutuphaneID, adi, adres) VALUES (1, 'Kütüphane A', 'Adres A');
    INSERT INTO kutuphane (kutuphaneID, adi, adres) VALUES (2, 'Kütüphane B', 'Adres B');

    -- Kategori verileri
    INSERT INTO kategori (kategoriID, adi) VALUES (1, 'Roman');
    INSERT INTO kategori (kategoriID, adi) VALUES (2, 'Bilim Kurgu');

    -- Yazar verileri
    INSERT INTO yazar (yazarID, adi, soyadi) VALUES (1, 'Yazar A', 'Soyadý A');
    INSERT INTO yazar (yazarID, adi, soyadi) VALUES (2, 'Yazar B', 'Soyadý B');

    -- Yayýnevi verileri
    INSERT INTO yayinevi (yayineviID, adi, adres) VALUES (1, 'Yayýnevi A', 'Adres A');
    INSERT INTO yayinevi (yayineviID, adi, adres) VALUES (2, 'Yayýnevi B', 'Adres B');

    -- Kitap verileri
    INSERT INTO kitap (kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID) VALUES (1, 'Kitap A', 2020, 1, 1, 1);
    INSERT INTO kitap (kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID) VALUES (2, 'Kitap B', 2021, 2, 2, 2);

    -- Üye verileri
    INSERT INTO uye (uyeID, adi, soyadi, adres, telefon) VALUES (1, 'Üye A', 'Soyadý A', 'Adres A', 'Telefon A');
    INSERT INTO uye (uyeID, adi, soyadi, adres, telefon) VALUES (2, 'Üye B', 'Soyadý B', 'Adres B', 'Telefon B');

    -- Ödünç verileri
    INSERT INTO odunc (oduncID, kitapID, uyeID, alinanTarih, donusTarih) VALUES (1, 1, 1, SYSDATE, SYSDATE+14);
    INSERT INTO odunc (oduncID, kitapID, uyeID, alinanTarih, donusTarih) VALUES (2, 2, 2, SYSDATE, SYSDATE+14);

    -- Ceza verileri
    INSERT INTO ceza (cezaID, oduncID, miktar, odenmeDurumu) VALUES (1, 1, 10, 'Ödenmedi');
    INSERT INTO ceza (cezaID, oduncID, miktar, odenmeDurumu) VALUES (2, 2, 5, 'Ödendi');

    -- Çalýþan verileri
    INSERT INTO calisan (calisanID, adi, soyadi, pozisyon, maas) VALUES (1, 'Çalýþan A', 'Soyadý A', 'Pozisyon A', 5000);
    INSERT INTO calisan (calisanID, adi, soyadi, pozisyon, maas) VALUES (2, 'Çalýþan B', 'Soyadý B', 'Pozisyon B', 6000);

    -- Raf verileri
    INSERT INTO raf (rafID, adi) VALUES (1, 'Raf A');
    INSERT INTO raf (rafID, adi) VALUES (2, 'Raf B');

    -- Yer verileri
    INSERT INTO yer (yerID, adi, rafID) VALUES (1, 'Yer A', 1);
    INSERT INTO yer (yerID, adi, rafID) VALUES (2, 'Yer B', 2);

    -- Özel Gün verileri
    INSERT INTO ozelgun (gunID, tarih, aciklama) VALUES (1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Özel Gün A');
    INSERT INTO ozelgun (gunID, tarih, aciklama) VALUES (2, TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'Özel Gün B');
    
    COMMIT;
  END veriGirisi;
END kutuphane_pkg;
/


-----------------------------------------------------------------------------

--5

CREATE OR REPLACE PACKAGE kutuphane_pkg IS
  PROCEDURE veriGuncelleme;
END kutuphane_pkg;
/

CREATE OR REPLACE PACKAGE BODY kutuphane_pkg IS
  PROCEDURE veriGuncelleme IS
  BEGIN
    -- Kütüphane veri güncellemesi
    UPDATE kutuphane SET adres = 'Yeni Adres' WHERE kutuphaneID = 1;

    -- Kategori veri güncellemesi
    UPDATE kategori SET adi = 'Kurgu' WHERE kategoriID = 1;

    -- Yazar veri güncellemesi
    UPDATE yazar SET soyadi = 'Yeni Soyad' WHERE yazarID = 1;

    -- Yayýnevi veri güncellemesi
    UPDATE yayinevi SET adres = 'Yeni Adres' WHERE yayineviID = 1;

    -- Kitap veri güncellemesi
    UPDATE kitap SET yayinYili = 2022 WHERE kitapID = 1;

    -- Üye veri güncellemesi
    UPDATE uye SET telefon = 'Yeni Telefon' WHERE uyeID = 1;

    -- Ödünç veri güncellemesi
    UPDATE odunc SET donusTarih = SYSDATE+7 WHERE oduncID = 1;

    -- Ceza veri güncellemesi
    UPDATE ceza SET odenmeDurumu = 'Ödendi' WHERE cezaID = 1;

    -- Çalýþan veri güncellemesi
    UPDATE calisan SET maas = 5500 WHERE calisanID = 1;

    -- Raf veri güncellemesi
    UPDATE raf SET adi = 'Yeni Raf' WHERE rafID = 1;

    -- Yer veri güncellemesi
    UPDATE yer SET adi = 'Yeni Yer' WHERE yerID = 1;

    -- Özel Gün veri güncellemesi
    UPDATE ozelgun SET aciklama = 'Yeni Özel Gün' WHERE gunID = 1;
    
    COMMIT;
  END veriGuncelleme;
END kutuphane_pkg;
/

-----------------------------------------------------------------------------------------

--6

CREATE OR REPLACE PACKAGE BODY kutuphane_pkg IS
  PROCEDURE veriSilme IS
  BEGIN
    -- Özel Gün Tablosu
    DELETE FROM ozelgun WHERE gunID = 1;

    -- Ceza Tablosu
    DELETE FROM ceza WHERE oduncID = 1;

    -- Ödünç Tablosu
    DELETE FROM odunc WHERE oduncID = 1;

    -- Kitap Tablosu
    DELETE FROM kitap WHERE kitapID = 1;

    -- Üye Tablosu
    DELETE FROM uye WHERE uyeID = 1;

    -- Çalýþan Tablosu
    DELETE FROM calisan WHERE calisanID = 1;

    -- Yer Tablosu
    DELETE FROM yer WHERE yerID = 1;

    -- Yazar Tablosu
    DELETE FROM yazar WHERE yazarID = 1;

    -- Kategori Tablosu
    DELETE FROM kategori WHERE kategoriID = 1;

    -- Yayýnevi Tablosu
    DELETE FROM yayinevi WHERE yayineviID = 1;

    -- Kütüphane Tablosu
    DELETE FROM kutuphane WHERE kutuphaneID = 1;

    COMMIT;
  END veriSilme;
END kutuphane_pkg;


--------------------------------------------------------------------------------------------

--7

CREATE OR REPLACE TRIGGER kitap_trigger
BEFORE INSERT ON kitap
FOR EACH ROW
DECLARE
  v_kategoriID kategori.kategoriID%TYPE;
  v_yazarID yazar.yazarID%TYPE;
  v_yayineviID yayinevi.yayineviID%TYPE;
BEGIN
  -- Kategori, yazar ve yayýnevi kayýtlarýný seçin veya atanmasýný saðlayýn
  SELECT kategoriID INTO v_kategoriID FROM kategori WHERE adi = 'Fantastik';
  SELECT yazarID INTO v_yazarID FROM yazar WHERE adi = 'Yazar A' AND soyadi = 'Soyadý C';
  SELECT yayineviID INTO v_yayineviID FROM yayinevi WHERE adi = 'Yayýnevi C';
  
  :NEW.adi := 'Yeni Kitap Adý';
  :NEW.yayinYili := 2022;
  :NEW.kategoriID := v_kategoriID;
  :NEW.yazarID := v_yazarID;
  :NEW.yayineviID := v_yayineviID;
END;
/


INSERT INTO kitap (kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID)
VALUES (5, 'Mavi Gözlü Dev', 2005, 1, 1, 1);

-----------------------------------------------------------------------------------------------

--8

DECLARE
  v_kitapID NUMBER := 1; -- Raporu istenen kitabýn ID'si
  v_yayinYili NUMBER := 2000; -- Raporu istenen yayýn yýlý
  v_kategoriAdi VARCHAR2(100) := 'Roman'; -- Raporu istenen kategori adý
  v_yazarAdi VARCHAR2(100) := 'Yazar A'; -- Raporu istenen yazar adý
  v_rapor_cursor SYS_REFCURSOR;
  v_kitapID_param VARCHAR2(100);
  v_yayinYili_param VARCHAR2(100);
  v_kategoriAdi_param VARCHAR2(100);
  v_yazarAdi_param VARCHAR2(100);
BEGIN
  -- Kitap ID'si parametresine göre kitap bilgilerini raporla
  v_kitapID_param := CASE WHEN v_kitapID IS NULL THEN 'IS NOT NULL' ELSE '= ' || TO_CHAR(v_kitapID) END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap WHERE kitapID ' || v_kitapID_param;
  -- Raporu göster veya baþka iþlemler yap
  
  -- Yayýn yýlý parametresine göre kitap bilgilerini raporla
  v_yayinYili_param := CASE WHEN v_yayinYili IS NULL THEN 'IS NOT NULL' ELSE '= ' || TO_CHAR(v_yayinYili) END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap WHERE yayinYili ' || v_yayinYili_param;
  -- Raporu göster veya baþka iþlemler yap
  
  -- Kategori adý parametresine göre kitap bilgilerini raporla
  v_kategoriAdi_param := CASE WHEN v_kategoriAdi IS NULL THEN 'IS NOT NULL' ELSE '= ''' || v_kategoriAdi || '''' END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap k JOIN kategori kt ON k.kategoriID = kt.kategoriID WHERE kt.adi ' || v_kategoriAdi_param;
  -- Raporu göster veya baþka iþlemler yap
  
  -- Yazar adý parametresine göre kitap bilgilerini raporla
  v_yazarAdi_param := CASE WHEN v_yazarAdi IS NULL THEN 'IS NOT NULL' ELSE '= ''' || v_yazarAdi || '''' END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap k JOIN yazar y ON k.yazarID = y.yazarID WHERE y.adi ' || v_yazarAdi_param;
  -- Raporu göster veya baþka iþlemler yap
  
  -- Diðer rapor sorgularýný yazabilirsiniz
  
  CLOSE v_rapor_cursor;
END;
/


-----------------------------------------------------------------------------------------------

--9


-----------------------------------------------------------------------------------------------

--10

-- PL/SQL paketi oluþturma
CREATE OR REPLACE PACKAGE kutuphane_pkg IS
  PROCEDURE sil_tekrarlayan_kayitlar;
END kutuphane_pkg;
/

-- PL/SQL paket bedeni
CREATE OR REPLACE PACKAGE BODY kutuphane_pkg IS
  PROCEDURE sil_tekrarlayan_kayitlar IS
  BEGIN
    -- Kategori tablosunda tekrar eden kayýtlarý silme
    DELETE FROM kategori
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM kategori
      GROUP BY kategoriID, adi
    );

    -- Yazar tablosunda tekrar eden kayýtlarý silme
    DELETE FROM yazar
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM yazar
      GROUP BY yazarID, adi, soyadi
    );

    -- Yayinevi tablosunda tekrar eden kayýtlarý silme
    DELETE FROM yayinevi
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM yayinevi
      GROUP BY yayineviID, adi, adres
    );

    -- Kitap tablosunda tekrar eden kayýtlarý silme
    DELETE FROM kitap
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM kitap
      GROUP BY kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID
    );

    -- Uye tablosunda tekrar eden kayýtlarý silme
    DELETE FROM uye
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM uye
      GROUP BY uyeID, adi, soyadi, adres, telefon
    );

    -- Odunc tablosunda tekrar eden kayýtlarý silme
    DELETE FROM odunc
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM odunc
      GROUP BY oduncID, kitapID, uyeID, alinanTarih, donusTarih
    );

    -- Ceza tablosunda tekrar eden kayýtlarý silme
    DELETE FROM ceza
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM ceza
      GROUP BY cezaID, oduncID, miktar, odenmeDurumu
    );

    -- Calisan tablosunda tekrar eden kayýtlarý silme
    DELETE FROM calisan
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM calisan
      GROUP BY calisanID, adi, soyadi, pozisyon, maas
    );

    -- Raf tablosunda tekrar eden kayýtlarý silme
    DELETE FROM raf
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM raf
      GROUP BY rafID, adi
    );

    -- Yer tablosunda tekrar eden kayýtlarý silme
    DELETE FROM yer
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM yer
      GROUP BY yerID, adi, rafID
    );

    -- Ozelgun tablosunda tekrar eden kayýtlarý silme
    DELETE FROM ozelgun
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM ozelgun
      GROUP BY gunID, tarih, aciklama
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tekrar eden kayýtlar baþarýyla silindi.');
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Hata oluþtu: ' || SQLERRM);
  END sil_tekrarlayan_kayitlar;
END kutuphane_pkg;
/

SET SERVEROUTPUT ON

BEGIN
  kutuphane_pkg.sil_tekrarlayan_kayitlar;
END;


