-- En pahalý ürünü listeleyin (Ürün ismi, fiyat ve stok sayýsýný da gösterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE fiyat = (SELECT MAX(fiyat) FROM tbl_urunler)


-- En ucuz ürünü listeleyin (Ürün ismi, fiyat ve stok sayýsýný da gösterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE fiyat = (SELECT MIN(fiyat) FROM tbl_urunler)


-- Ortalama fiyattan daha pahalý ürünleri listeleyin ve fiyatlarýna göre azalan sýrayla sýralayýn.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE fiyat > (SELECT AVG(fiyat) FROM tbl_urunler)
ORDER BY fiyat DESC;


-- Stok sayýsý 10’dan fazla olan ürünleri listeleyin ve ürün adýný alfabetik sýrasýna göre sýralayýn.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok > 10
ORDER BY urun_adi ASC;


-- Stok sayýsý 10’dan az olan ürünleri listeleyin ve fiyatlarýna göre artan sýrayla sýralayýn.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok < 10
ORDER BY fiyat ASC;


-- Stokta hiç kalmamýþ ürünleri listeleyin.
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok = 0;


-- En çok stokta olan ürünü listeleyin (Ürün adý, fiyat ve stok sayýsýný da gösterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok = (SELECT MAX(stok) FROM tbl_urunler);


-- En az stokta olan ürünü listeleyin (Ürün adý, fiyat ve stok sayýsýný da gösterelim).
SELECT urun_adi, fiyat, stok
FROM tbl_urunler
WHERE stok = (SELECT MIN(stok) FROM tbl_urunler);


-- Bir kategorideki en pahalý ürünü listeleyin ve o kategoriye ait fiyatý gösterelim.
SELECT TOP 1 urun_adi, fiyat, kategori_id
FROM tbl_urunler u
WHERE fiyat = (SELECT MAX(fiyat) FROM tbl_urunler WHERE kategori_id = u.kategori_id)
ORDER BY fiyat DESC;


-- Bir kategorideki en ucuz ürünü listeleyin ve o kategoriye ait fiyatý gösterelim.
SELECT TOP 1 urun_adi, fiyat, kategori_id
FROM tbl_urunler u
WHERE fiyat = (SELECT MIN(fiyat) FROM tbl_urunler WHERE kategori_id = u.kategori_id)
ORDER BY fiyat ASC;

-- Bir kategorideki ürünlerin ortalama fiyatýný ve toplam ürün sayýsýný bulun.
SELECT kategori_id, AVG(fiyat) AS ortalama_fiyat, COUNT(*) AS toplam_urun_sayisi
FROM tbl_urunler
GROUP BY kategori_id
ORDER BY ortalama_fiyat DESC;


-- Ayný kategoriden olan ürünlerin fiyatlarýnýn ortalamasýný ve toplam stok sayýsýný bulun.
SELECT kategori_id, AVG(fiyat) AS ortalama_fiyat, SUM(stok) AS toplam_stok
FROM tbl_urunler
GROUP BY kategori_id
ORDER BY ortalama_fiyat DESC;
