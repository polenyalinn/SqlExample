-- En pahal� �r�n� listeleyin (�r�n ismi, fiyat ve stok say�s�n� da g�sterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE fiyat = (SELECT MAX(fiyat) FROM tbl_urunler)


-- En ucuz �r�n� listeleyin (�r�n ismi, fiyat ve stok say�s�n� da g�sterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE fiyat = (SELECT MIN(fiyat) FROM tbl_urunler)


-- Ortalama fiyattan daha pahal� �r�nleri listeleyin ve fiyatlar�na g�re azalan s�rayla s�ralay�n.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE fiyat > (SELECT AVG(fiyat) FROM tbl_urunler)
ORDER BY fiyat DESC;


-- Stok say�s� 10�dan fazla olan �r�nleri listeleyin ve �r�n ad�n� alfabetik s�ras�na g�re s�ralay�n.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok > 10
ORDER BY urun_adi ASC;


-- Stok say�s� 10�dan az olan �r�nleri listeleyin ve fiyatlar�na g�re artan s�rayla s�ralay�n.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok < 10
ORDER BY fiyat ASC;


-- Stokta hi� kalmam�� �r�nleri listeleyin.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok = 0;


-- En �ok stokta olan �r�n� listeleyin (�r�n ad�, fiyat ve stok say�s�n� da g�sterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok = (SELECT MAX(stok) FROM tbl_urunler);


-- En az stokta olan �r�n� listeleyin (�r�n ad�, fiyat ve stok say�s�n� da g�sterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok = (SELECT MIN(stok) FROM tbl_urunler);


-- Bir kategorideki en pahal� �r�n� listeleyin ve o kategoriye ait fiyat� g�sterelim.
SELECT TOP 1 urun_adi, fiyat, kategori_id
FROM tbl_urunler u
WHERE fiyat = (SELECT MAX(fiyat) FROM tbl_urunler WHERE kategori_id = u.kategori_id)
ORDER BY fiyat DESC;


-- Bir kategorideki en ucuz �r�n� listeleyin ve o kategoriye ait fiyat� g�sterelim.
SELECT TOP 1 urun_adi, fiyat, kategori_id
FROM tbl_urunler u
WHERE fiyat = (SELECT MIN(fiyat) FROM tbl_urunler WHERE kategori_id = u.kategori_id)
ORDER BY fiyat ASC;

-- Bir kategorideki �r�nlerin ortalama fiyat�n� ve toplam �r�n say�s�n� bulun.
SELECT kategori_id, AVG(fiyat) AS ortalama_fiyat, COUNT(*) AS toplam_urun_sayisi
FROM tbl_urunler
GROUP BY kategori_id
ORDER BY ortalama_fiyat DESC;


-- Ayn� kategoriden olan �r�nlerin fiyatlar�n�n ortalamas�n� ve toplam stok say�s�n� bulun.
SELECT kategori_id, AVG(fiyat) AS ortalama_fiyat, SUM(stok) AS toplam_stok
FROM tbl_urunler
GROUP BY kategori_id
ORDER BY ortalama_fiyat DESC;
