--1

K�t�phane (Library) Tablosu:
k�t�phaneID (PK): K�t�phane kimlik numaras�
ad�: K�t�phane ad�
adres: K�t�phane adresi

Kategori (Category) Tablosu:
kategoriID (PK): Kategori kimlik numaras�
ad�: Kategori ad�

Yazar (Author) Tablosu:
yazarID (PK): Yazar kimlik numaras�
ad�: Yazar�n ad�
soyad�: Yazar�n soyad�
Yay�nevi (Publisher) Tablosu:

yay�neviID (PK): Yay�nevi kimlik numaras�
ad�: Yay�nevi ad�
adres: Yay�nevi adresi
Kitap (Book) Tablosu:

kitapID (PK): Kitap kimlik numaras�
ad�: Kitap ad�
yay�nY�l�: Kitab�n yay�n y�l�
kategoriID (FK): Kategori kimlik numaras�
yazarID (FK): Yazar kimlik numaras�
yay�neviID (FK): Yay�nevi kimlik numaras�

�ye (Member) Tablosu:
�yeID (PK): �ye kimlik numaras�
ad�: �yenin ad�
soyad�: �yenin soyad�
adres: �yenin adresi
telefon: �yenin telefon numaras�

�d�n� (Loan) Tablosu:
�d�n�ID (PK): �d�n� kimlik numaras�
kitapID (FK): Kitap kimlik numaras�
�yeID (FK): �ye kimlik numaras�
al�nanTarih: Kitab�n al�nd��� tarih
d�n��Tarih: Kitab�n geri d�n�� tarihi

Ceza (Fine) Tablosu:
cezaID (PK): Ceza kimlik numaras�
�d�n�ID (FK): �d�n� kimlik numaras�
miktar: Ceza miktar�
�denmeDurumu: Ceza �denme durumu
�al��an (Employee) Tablosu:

�al��anID (PK): �al��an kimlik numaras�
ad�: �al��an�n ad�
soyad�: �al��an�n soyad�
pozisyon: �al��an�n pozisyonu
maa�: �al��an�n maa��

Raf (Shelf) Tablosu:
rafID (PK): Raf kimlik numaras�
ad�: Raf ad�

Yer (Location) Tablosu:
yerID (PK): Yer kimlik numaras�
ad�: Yer ad�
rafID (FK): Raf kimlik numaras�

�zel G�n (SpecialDay) Tablosu:
g�nID (PK): G�n kimlik numaras�
tarih: �zel g�n tarihi
a��klama: �zel g�n a��klamas�

------------------------------------------------------------------------

--2

-- K�t�phane Tablosu
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

-- Yay�nevi Tablosu
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

-- �ye Tablosu
CREATE TABLE uye (
  uyeID NUMBER PRIMARY KEY,
  adi VARCHAR2(100),
  soyadi VARCHAR2(100),
  adres VARCHAR2(200),
  telefon VARCHAR2(20)
);

-- �d�n� Tablosu
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

-- �al��an Tablosu
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

-- �zel G�n Tablosu
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
    -- K�t�phane verileri
    INSERT INTO kutuphane (kutuphaneID, adi, adres) VALUES (1, 'K�t�phane A', 'Adres A');
    INSERT INTO kutuphane (kutuphaneID, adi, adres) VALUES (2, 'K�t�phane B', 'Adres B');

    -- Kategori verileri
    INSERT INTO kategori (kategoriID, adi) VALUES (1, 'Roman');
    INSERT INTO kategori (kategoriID, adi) VALUES (2, 'Bilim Kurgu');

    -- Yazar verileri
    INSERT INTO yazar (yazarID, adi, soyadi) VALUES (1, 'Yazar A', 'Soyad� A');
    INSERT INTO yazar (yazarID, adi, soyadi) VALUES (2, 'Yazar B', 'Soyad� B');

    -- Yay�nevi verileri
    INSERT INTO yayinevi (yayineviID, adi, adres) VALUES (1, 'Yay�nevi A', 'Adres A');
    INSERT INTO yayinevi (yayineviID, adi, adres) VALUES (2, 'Yay�nevi B', 'Adres B');

    -- Kitap verileri
    INSERT INTO kitap (kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID) VALUES (1, 'Kitap A', 2020, 1, 1, 1);
    INSERT INTO kitap (kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID) VALUES (2, 'Kitap B', 2021, 2, 2, 2);

    -- �ye verileri
    INSERT INTO uye (uyeID, adi, soyadi, adres, telefon) VALUES (1, '�ye A', 'Soyad� A', 'Adres A', 'Telefon A');
    INSERT INTO uye (uyeID, adi, soyadi, adres, telefon) VALUES (2, '�ye B', 'Soyad� B', 'Adres B', 'Telefon B');

    -- �d�n� verileri
    INSERT INTO odunc (oduncID, kitapID, uyeID, alinanTarih, donusTarih) VALUES (1, 1, 1, SYSDATE, SYSDATE+14);
    INSERT INTO odunc (oduncID, kitapID, uyeID, alinanTarih, donusTarih) VALUES (2, 2, 2, SYSDATE, SYSDATE+14);

    -- Ceza verileri
    INSERT INTO ceza (cezaID, oduncID, miktar, odenmeDurumu) VALUES (1, 1, 10, '�denmedi');
    INSERT INTO ceza (cezaID, oduncID, miktar, odenmeDurumu) VALUES (2, 2, 5, '�dendi');

    -- �al��an verileri
    INSERT INTO calisan (calisanID, adi, soyadi, pozisyon, maas) VALUES (1, '�al��an A', 'Soyad� A', 'Pozisyon A', 5000);
    INSERT INTO calisan (calisanID, adi, soyadi, pozisyon, maas) VALUES (2, '�al��an B', 'Soyad� B', 'Pozisyon B', 6000);

    -- Raf verileri
    INSERT INTO raf (rafID, adi) VALUES (1, 'Raf A');
    INSERT INTO raf (rafID, adi) VALUES (2, 'Raf B');

    -- Yer verileri
    INSERT INTO yer (yerID, adi, rafID) VALUES (1, 'Yer A', 1);
    INSERT INTO yer (yerID, adi, rafID) VALUES (2, 'Yer B', 2);

    -- �zel G�n verileri
    INSERT INTO ozelgun (gunID, tarih, aciklama) VALUES (1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), '�zel G�n A');
    INSERT INTO ozelgun (gunID, tarih, aciklama) VALUES (2, TO_DATE('2023-06-02', 'YYYY-MM-DD'), '�zel G�n B');
    
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
    -- K�t�phane veri g�ncellemesi
    UPDATE kutuphane SET adres = 'Yeni Adres' WHERE kutuphaneID = 1;

    -- Kategori veri g�ncellemesi
    UPDATE kategori SET adi = 'Kurgu' WHERE kategoriID = 1;

    -- Yazar veri g�ncellemesi
    UPDATE yazar SET soyadi = 'Yeni Soyad' WHERE yazarID = 1;

    -- Yay�nevi veri g�ncellemesi
    UPDATE yayinevi SET adres = 'Yeni Adres' WHERE yayineviID = 1;

    -- Kitap veri g�ncellemesi
    UPDATE kitap SET yayinYili = 2022 WHERE kitapID = 1;

    -- �ye veri g�ncellemesi
    UPDATE uye SET telefon = 'Yeni Telefon' WHERE uyeID = 1;

    -- �d�n� veri g�ncellemesi
    UPDATE odunc SET donusTarih = SYSDATE+7 WHERE oduncID = 1;

    -- Ceza veri g�ncellemesi
    UPDATE ceza SET odenmeDurumu = '�dendi' WHERE cezaID = 1;

    -- �al��an veri g�ncellemesi
    UPDATE calisan SET maas = 5500 WHERE calisanID = 1;

    -- Raf veri g�ncellemesi
    UPDATE raf SET adi = 'Yeni Raf' WHERE rafID = 1;

    -- Yer veri g�ncellemesi
    UPDATE yer SET adi = 'Yeni Yer' WHERE yerID = 1;

    -- �zel G�n veri g�ncellemesi
    UPDATE ozelgun SET aciklama = 'Yeni �zel G�n' WHERE gunID = 1;
    
    COMMIT;
  END veriGuncelleme;
END kutuphane_pkg;
/

-----------------------------------------------------------------------------------------

--6

CREATE OR REPLACE PACKAGE BODY kutuphane_pkg IS
  PROCEDURE veriSilme IS
  BEGIN
    -- �zel G�n Tablosu
    DELETE FROM ozelgun WHERE gunID = 1;

    -- Ceza Tablosu
    DELETE FROM ceza WHERE oduncID = 1;

    -- �d�n� Tablosu
    DELETE FROM odunc WHERE oduncID = 1;

    -- Kitap Tablosu
    DELETE FROM kitap WHERE kitapID = 1;

    -- �ye Tablosu
    DELETE FROM uye WHERE uyeID = 1;

    -- �al��an Tablosu
    DELETE FROM calisan WHERE calisanID = 1;

    -- Yer Tablosu
    DELETE FROM yer WHERE yerID = 1;

    -- Yazar Tablosu
    DELETE FROM yazar WHERE yazarID = 1;

    -- Kategori Tablosu
    DELETE FROM kategori WHERE kategoriID = 1;

    -- Yay�nevi Tablosu
    DELETE FROM yayinevi WHERE yayineviID = 1;

    -- K�t�phane Tablosu
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
  -- Kategori, yazar ve yay�nevi kay�tlar�n� se�in veya atanmas�n� sa�lay�n
  SELECT kategoriID INTO v_kategoriID FROM kategori WHERE adi = 'Fantastik';
  SELECT yazarID INTO v_yazarID FROM yazar WHERE adi = 'Yazar A' AND soyadi = 'Soyad� C';
  SELECT yayineviID INTO v_yayineviID FROM yayinevi WHERE adi = 'Yay�nevi C';
  
  :NEW.adi := 'Yeni Kitap Ad�';
  :NEW.yayinYili := 2022;
  :NEW.kategoriID := v_kategoriID;
  :NEW.yazarID := v_yazarID;
  :NEW.yayineviID := v_yayineviID;
END;
/


INSERT INTO kitap (kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID)
VALUES (5, 'Mavi G�zl� Dev', 2005, 1, 1, 1);

-----------------------------------------------------------------------------------------------

--8

DECLARE
  v_kitapID NUMBER := 1; -- Raporu istenen kitab�n ID'si
  v_yayinYili NUMBER := 2000; -- Raporu istenen yay�n y�l�
  v_kategoriAdi VARCHAR2(100) := 'Roman'; -- Raporu istenen kategori ad�
  v_yazarAdi VARCHAR2(100) := 'Yazar A'; -- Raporu istenen yazar ad�
  v_rapor_cursor SYS_REFCURSOR;
  v_kitapID_param VARCHAR2(100);
  v_yayinYili_param VARCHAR2(100);
  v_kategoriAdi_param VARCHAR2(100);
  v_yazarAdi_param VARCHAR2(100);
BEGIN
  -- Kitap ID'si parametresine g�re kitap bilgilerini raporla
  v_kitapID_param := CASE WHEN v_kitapID IS NULL THEN 'IS NOT NULL' ELSE '= ' || TO_CHAR(v_kitapID) END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap WHERE kitapID ' || v_kitapID_param;
  -- Raporu g�ster veya ba�ka i�lemler yap
  
  -- Yay�n y�l� parametresine g�re kitap bilgilerini raporla
  v_yayinYili_param := CASE WHEN v_yayinYili IS NULL THEN 'IS NOT NULL' ELSE '= ' || TO_CHAR(v_yayinYili) END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap WHERE yayinYili ' || v_yayinYili_param;
  -- Raporu g�ster veya ba�ka i�lemler yap
  
  -- Kategori ad� parametresine g�re kitap bilgilerini raporla
  v_kategoriAdi_param := CASE WHEN v_kategoriAdi IS NULL THEN 'IS NOT NULL' ELSE '= ''' || v_kategoriAdi || '''' END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap k JOIN kategori kt ON k.kategoriID = kt.kategoriID WHERE kt.adi ' || v_kategoriAdi_param;
  -- Raporu g�ster veya ba�ka i�lemler yap
  
  -- Yazar ad� parametresine g�re kitap bilgilerini raporla
  v_yazarAdi_param := CASE WHEN v_yazarAdi IS NULL THEN 'IS NOT NULL' ELSE '= ''' || v_yazarAdi || '''' END;
  OPEN v_rapor_cursor FOR
    'SELECT * FROM kitap k JOIN yazar y ON k.yazarID = y.yazarID WHERE y.adi ' || v_yazarAdi_param;
  -- Raporu g�ster veya ba�ka i�lemler yap
  
  -- Di�er rapor sorgular�n� yazabilirsiniz
  
  CLOSE v_rapor_cursor;
END;
/


-----------------------------------------------------------------------------------------------

--9


-----------------------------------------------------------------------------------------------

--10

-- PL/SQL paketi olu�turma
CREATE OR REPLACE PACKAGE kutuphane_pkg IS
  PROCEDURE sil_tekrarlayan_kayitlar;
END kutuphane_pkg;
/

-- PL/SQL paket bedeni
CREATE OR REPLACE PACKAGE BODY kutuphane_pkg IS
  PROCEDURE sil_tekrarlayan_kayitlar IS
  BEGIN
    -- Kategori tablosunda tekrar eden kay�tlar� silme
    DELETE FROM kategori
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM kategori
      GROUP BY kategoriID, adi
    );

    -- Yazar tablosunda tekrar eden kay�tlar� silme
    DELETE FROM yazar
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM yazar
      GROUP BY yazarID, adi, soyadi
    );

    -- Yayinevi tablosunda tekrar eden kay�tlar� silme
    DELETE FROM yayinevi
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM yayinevi
      GROUP BY yayineviID, adi, adres
    );

    -- Kitap tablosunda tekrar eden kay�tlar� silme
    DELETE FROM kitap
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM kitap
      GROUP BY kitapID, adi, yayinYili, kategoriID, yazarID, yayineviID
    );

    -- Uye tablosunda tekrar eden kay�tlar� silme
    DELETE FROM uye
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM uye
      GROUP BY uyeID, adi, soyadi, adres, telefon
    );

    -- Odunc tablosunda tekrar eden kay�tlar� silme
    DELETE FROM odunc
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM odunc
      GROUP BY oduncID, kitapID, uyeID, alinanTarih, donusTarih
    );

    -- Ceza tablosunda tekrar eden kay�tlar� silme
    DELETE FROM ceza
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM ceza
      GROUP BY cezaID, oduncID, miktar, odenmeDurumu
    );

    -- Calisan tablosunda tekrar eden kay�tlar� silme
    DELETE FROM calisan
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM calisan
      GROUP BY calisanID, adi, soyadi, pozisyon, maas
    );

    -- Raf tablosunda tekrar eden kay�tlar� silme
    DELETE FROM raf
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM raf
      GROUP BY rafID, adi
    );

    -- Yer tablosunda tekrar eden kay�tlar� silme
    DELETE FROM yer
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM yer
      GROUP BY yerID, adi, rafID
    );

    -- Ozelgun tablosunda tekrar eden kay�tlar� silme
    DELETE FROM ozelgun
    WHERE ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM ozelgun
      GROUP BY gunID, tarih, aciklama
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tekrar eden kay�tlar ba�ar�yla silindi.');
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Hata olu�tu: ' || SQLERRM);
  END sil_tekrarlayan_kayitlar;
END kutuphane_pkg;
/

SET SERVEROUTPUT ON

BEGIN
  kutuphane_pkg.sil_tekrarlayan_kayitlar;
END;


