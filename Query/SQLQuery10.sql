--use Hastane
--select Hasta_Ad+' '+Hasta_Soyad as ad_soyad,Kan_Grup from Hasta inner join Kan on hasta.Kan_id=Kan.Kan_id
-- A rh + B rh - isim soy isim cinsiyet
--select Hasta_id,Hasta_Ad+' '+Hasta_Soyad as ad_soyad,Hasta_Cinsiyet,Kan_Grup from 
--Hasta inner join Kan on hasta.Kan_id=Kan.Kan_id
--where Kan_Grup='A Rh +' or Kan_Grup='B Rh -' order by ad_soyad

--ac�badem sigorta,axa sigorta,sgk 60 ya� �zeri erkekler ad soyad ve tc kimlik  hastalar�n

--select Hasta_Cinsiyet,Hasta_ad+' '+Hasta_Soyad as 'Ad Soyad',DATEDIFF(YEAR,Hasta_Dgmtrh,GETDATE()) AS HASTA_YASS
--,Hasta_Tc,Kurum from Hasta inner join Kurum on 
--Hasta.Kurum_id=Kurum.Kurum_id  where (Kurum='Ac�badem Sigorta' or Kurum='Sgk' or Kurum='Axa Sigorta') AND Hasta_Cinsiyet='E' 
--AND DATEDIFF(YEAR,Hasta_Dgmtrh,GETDATE())>60 ORDER BY [Ad Soyad]

--B�l�mlere g�re doktorlar�n ya� ortalamas� gerekli bize
--select *from doktor
--select*from Bolum
--select Bolum,avg(DATEDIFF(YEAR,Dok_Dgmtrh,GETDATE()))as Doktor_yas from Doktor inner join
--Bolum  on Doktor.Bolum_id=Bolum.Bolum_id group by bolum
-- doktor ya�lar�n� b�l�mlere g�re gruplad�k

--�imdiye kadar hep ili�kili olan iki tablo �zerinde �al��m��t�k �imdi ise
--bir tablo iki �� tabloyla ili�kili ise nas�l bu ili�kiyle birlikte sutun getiririz bunu ��renicez
--select*from Hasta

--hasta ad� soyad� tc si yan�na doktoru ad� soyad� cinsiyeti 
--select Hasta_ad+' '+Hasta_soyad as 'Ad soyad',Hasta_Tc,Dok_Ad+' '+Dok_Soyad as dok_ad_soyad,Dok_Cinsiyet 
--from Hasta inner join Doktor on Hasta.Hasta_id=Doktor.Dok_id


--Hasta ad� soyad�,tc,cinsiyet,ya�,mtel,il,il�e,kurum,doktor,bolum

--select Hasta_ad+' '+Hasta_soyad as 'Ad soyad',Hasta_Tc,Hasta_Cinsiyet,datediff(year,Hasta_Dgmtrh,GETDATE()),
--Hasta_Tel,�l,ilce,Kan_Grup,Kurum,Dok_Ad+' '+Dok_soyad AS Doktor_ad_soyad,Bolum
--from Hasta 
--inner join il on Hasta.il_id=il.il_id 
--inner join �lce on Hasta.ilce_id=�lce.ilce_id
--inner join Kan on Hasta.kan_id=Kan.kan_id
--inner join Kurum on Hasta.kurum_id=Kurum.kurum_id
--inner join Doktor on Hasta.Dok_id=Doktor.Dok_id
--inner join Bolum on Doktor.Bolum_id=Bolum.Bolum_id


--B�l�m bazl� hasta toplam�

--select Bolum,COUNT(Hasta_ad) AS HASTA_TOPLAM
--from Hasta 
--inner join Doktor on Hasta.Dok_id=Doktor.Dok_id
--inner join Bolum on Doktor.Bolum_id=Bolum.Bolum_id
--GROUP BY Bolum ORDER BY [HASTA_TOPLAM] DESC
