--(Index-2 Clustered ve Non Clustered Index)
-- Index-2 Clustered primary key ya��s�yla iyile�ir
--use hasstane
--set statistics io on

--select*from Hasta where hasta_ad='Sezer' and Hasta_soyad='Kalaman'
--Table 'Hasta'. Scan count 1, logical reads 100, physical reads 0, read-ahead reads 0, lob logical 
--reads 0, lob physical reads 0, lob read-ahead reads 0.
--locigal read=66
-- 66 sayfa okudu
-- 1 sayfa =8kb 66*8 528 

--Yani bu yap� k�sacas� bilgisayara az y�k bindirerek nas�l 
--daha �ok i� yapar�m 
-- Bunlardan biri primary key olu�turmak yani Index-2 Clustered
--di�eri Index-2 NonClustered 

--select*from Hasta where �l_id=34

--Endeks-2 K�melenmi� ve K�melenmemi� Endeks

--Bu k�sma kadar �ok anla��lmad� ama �imdi daha iyi anlayaca��z index yap�s�n� 
--diyelimki hi� index yap�s� falan hi� kurmad�k ve diyelimki kurduk diye iki senaryo yapaca��z 
--�imdi 5 milyon sat�rl�k bir veri olu�turaca��m orada arama yapaca��z 

--create database indexleme
--use indexleme
----(Index-2 Clustered ve Non Clustered Index)
----create table indexleme (ID int identity (1,1),say� varchar(8000))

--declare @say� int
--set @say�=1


--while @say�<=5000000

--begin 

--insert into indexleme values('Ki�i'+cast(@say� as varchar))
--set @say�=@say�+1
--end

--select *from indexleme
--select *from indexleme where ID=2315641
----�imdi hi� indexleme yapmadan bu �d ye sahip veriyi 6 saniyede getirdi 
----Haydi indexleme yapal�m
--create clustered index isim
--on indexleme(ID)
---- �uanda inde�leme i�lemimiz yap�ld�
--select *from indexleme where ID=2315641
---- Bu i�lemi 0 saniyede yapt� 2.5 milyona yak�n veri var 5 milyon oldu�unu d���n birde
























----Index-4 Included Columns (performans� dahada artt�racak)
----�imdi bir veri setinde priimary key yap�s� varsa e�er burada tarama yava�lar 
----Bunun i�in nunclustered index yap�s� kullanabiliriz yada �ncluded columns yap�s� kullan�labilir 
----Bu k�s�mda �ncluded columns yap�n� g�rcez
----Ayr�ca bize kullanmam�z gereken index yap�s�n� bize sql s�yler 
---- ctrl + l yaparsak
--select*from Musteri where sehir='ankara'-- �ehiri ankara olanlar� bize getir dedik 
----8643 L�K B�R �� YAPTI
----ctrl +l yapt���m�zda 
----CREATE NONCLOSTERED �NDEX AND INCULDED COLUMNS
--/*
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [dbo].[Musteri] ([Sehir])
--INCLUDE ([ID],[Ad],[Soyad],[Cinsiyet],[Dogum_trh],[ilce],[Tel])
--GO
--*/
----VE B�ZE S�YLED��� �EY BUNU YAPMAMIZ
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX �S�M
--ON [dbo].[Musteri] ([Sehir])
--INCLUDE ([ID],[Ad],[Soyad],[Cinsiyet],[Dogum_trh],[ilce],[Tel])
--GO
--select*from Musteri where sehir='ankara'
----944 YAPTI�I �� BUNA D��T� ARADA B�Y�K FARK VAR





----Index-5 Unique Index Nedir?
---- TEKRARLI �NDEXLERDE KULLANILMASI FAYDALIDIR
----�imdi bakal�m
--select *from Musteri where sehir='ankara'
----maliyet=8643 burada maliyet page say�s� fazlaysa �ok �al���r gibi
----9079 Bu �d yi primary key yapm�� halimiz
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX �S�M
--ON [dbo].[Musteri] ([Sehir])
--INCLUDE ([Ad],[Soyad],[Cinsiyet],[Dogum_trh],[ilce],[Tel])
--GO
----831 buda nonclustered ve �nclude yap�lar�yla olan maliyet
----Baya fark var
--�imdi unique dedi�imiz �ey verinin tekrars�z olmas� 
--nonunique de verinin tekrarl� olmas� 
--mesala burada ankara tekrarl� oldu�u i�in bizim kurdu�umuz 
--index yap�s� unique de�il nonunique
--unique �rnek yapal�m
--bunun i�in i�lem yapmaya gerek yok sql bunu anl�yor
--select*from Musteri where tel='04422345433'
----Maliyet y�ksel oldu�u i�in burdada non-clustered yap� kullanaca��z 8541
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [dbo].[Musteri] ([Tel])

--GO
---- bunu yaparak maliyet d��t�  6
--unique yap�s�n� tekrars�z veride kullanaca��z yani



--son ornek
--select * from indexleme where say�='ki�i2245644'
----maliyet 
----9098
----USE [indexleme]
----GO
----CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
----ON [dbo].[indexleme] ([say�])

----GO
---- indexlemeyi yapt�k
----maliyet=3
----Ve buradaki her de�er tekil oldu�u i�in unique kurabiliriz