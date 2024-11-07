CREATE TABLE tbl_kullanicilar (
    kullanici_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    kullanici_adi NVARCHAR(50) NOT NULL,
    e_posta NVARCHAR(50) UNIQUE NOT NULL,
    sifre NVARCHAR(50) NOT NULL,
    telefon NVARCHAR(15),
    adres_id INT
);

CREATE TABLE tbl_urunler (
    urun_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    urun_adi NVARCHAR(100) NOT NULL,
    fiyat DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL,
    kategori_id INT NOT NULL
);
CREATE TABLE tbl_siparisler (
    siparis_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    kullanici_id INT NOT NULL,
    siparis_tarihi DATETIME NOT NULL,
    toplam_fiyat DECIMAL(10, 2) NOT NULL
);
CREATE TABLE tbl_siparis_detaylari (
    siparis_detay_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    siparis_id INT NOT NULL,
    urun_id INT NOT NULL,
    miktar INT NOT NULL,
    fiyat DECIMAL(10, 2) NOT NULL
);
CREATE TABLE tbl_kategoriler (
    kategori_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    kategori_adi NVARCHAR(50) NOT NULL
);
CREATE TABLE tbl_adresler (
    adres_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    sokak NVARCHAR(100),
    sehir NVARCHAR(50),
    posta_kodu NVARCHAR(10),
    ulke NVARCHAR(50)
);
-- Kullanýcýlarýn adreslerini tutar
ALTER TABLE tbl_kullanicilar 
ADD CONSTRAINT fk_kullanici_adres FOREIGN KEY (adres_id) REFERENCES tbl_adresler(adres_id) 
ON DELETE SET NULL ON UPDATE CASCADE;

-- Ürünlerin kategorilerini belirtir
ALTER TABLE tbl_urunler 
ADD CONSTRAINT fk_urun_kategori FOREIGN KEY (kategori_id) REFERENCES tbl_kategoriler(kategori_id) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Sipariþlerin hangi kullanýcýya ait olduðunu belirtir
ALTER TABLE tbl_siparisler 
ADD CONSTRAINT fk_siparis_kullanici FOREIGN KEY (kullanici_id) REFERENCES tbl_kullanicilar(kullanici_id) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Sipariþ detaylarýnýn hangi sipariþe ait olduðunu belirtir
ALTER TABLE tbl_siparis_detaylari 
ADD CONSTRAINT fk_siparis_detay_siparis FOREIGN KEY (siparis_id) REFERENCES tbl_siparisler(siparis_id) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Sipariþ detaylarýnýn hangi ürüne ait olduðunu belirtir
ALTER TABLE tbl_siparis_detaylari 
ADD CONSTRAINT fk_siparis_detay_urun FOREIGN KEY (urun_id) REFERENCES tbl_urunler(urun_id) 
ON DELETE CASCADE ON UPDATE CASCADE;

-- Kategoriler ekleme
INSERT INTO tbl_kategoriler (kategori_adi) VALUES ('Elektronik');
INSERT INTO tbl_kategoriler (kategori_adi) VALUES ('Kitap');
INSERT INTO tbl_kategoriler (kategori_adi) VALUES ('Giyim');

-- Adresler ekleme
INSERT INTO tbl_adresler (sokak, sehir, posta_kodu, ulke) VALUES ('Atatürk Cad.', 'Ankara', '06000', 'Türkiye');
INSERT INTO tbl_adresler (sokak, sehir, posta_kodu, ulke) VALUES ('Cumhuriyet Mah.', 'Ýstanbul', '34000', 'Türkiye');

-- Kullanýcýlar ekleme
INSERT INTO tbl_kullanicilar (kullanici_adi, e_posta, sifre, telefon, adres_id) 
VALUES ('Ali Veli', 'ali@mail.com', 'sifre123', '05321234567', 1);

INSERT INTO tbl_kullanicilar (kullanici_adi, e_posta, sifre, telefon, adres_id) 
VALUES ('Ayþe Yýlmaz', 'ayse@mail.com', 'sifre456', '05337654321', 2);

-- Ürünler ekleme
INSERT INTO tbl_urunler (urun_adi, fiyat, stok, kategori_id) VALUES ('Laptop', 15000, 10, 1);
INSERT INTO tbl_urunler (urun_adi, fiyat, stok, kategori_id) VALUES ('Roman Kitap', 50, 200, 2);
INSERT INTO tbl_urunler (urun_adi, fiyat, stok, kategori_id) VALUES ('Tiþört', 100, 100, 3);

-- Sipariþler ve detaylarý ekleme
INSERT INTO tbl_siparisler (kullanici_id, siparis_tarihi, toplam_fiyat) VALUES (1, '2024-11-01', 15050);
INSERT INTO tbl_siparis_detaylari (siparis_id, urun_id, miktar, fiyat) VALUES (1, 1, 1, 15000);
INSERT INTO tbl_siparis_detaylari (siparis_id, urun_id, miktar, fiyat) VALUES (1, 2, 1, 50);
