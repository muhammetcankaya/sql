--(Index-2 Clustered ve Non Clustered Index)
-- Index-2 Clustered primary key yaðýsýyla iyileþir
--use hasstane
--set statistics io on

--select*from Hasta where hasta_ad='Sezer' and Hasta_soyad='Kalaman'
--Table 'Hasta'. Scan count 1, logical reads 100, physical reads 0, read-ahead reads 0, lob logical 
--reads 0, lob physical reads 0, lob read-ahead reads 0.
--locigal read=66
-- 66 sayfa okudu
-- 1 sayfa =8kb 66*8 528 

--Yani bu yapý kýsacasý bilgisayara az yük bindirerek nasýl 
--daha çok iþ yaparým 
-- Bunlardan biri primary key oluþturmak yani Index-2 Clustered
--diðeri Index-2 NonClustered 

--select*from Hasta where Ýl_id=34

--Endeks-2 Kümelenmiþ ve Kümelenmemiþ Endeks

--Bu kýsma kadar çok anlaþýlmadý ama þimdi daha iyi anlayacaðýz index yapýsýný 
--diyelimki hiç index yapýsý falan hiç kurmadýk ve diyelimki kurduk diye iki senaryo yapacaðýz 
--Þimdi 5 milyon satýrlýk bir veri oluþturacaðým orada arama yapacaðýz 

--create database indexleme
--use indexleme
----(Index-2 Clustered ve Non Clustered Index)
----create table indexleme (ID int identity (1,1),sayý varchar(8000))

--declare @sayý int
--set @sayý=1


--while @sayý<=5000000

--begin 

--insert into indexleme values('Kiþi'+cast(@sayý as varchar))
--set @sayý=@sayý+1
--end

--select *from indexleme
--select *from indexleme where ID=2315641
----Þimdi hiç indexleme yapmadan bu ýd ye sahip veriyi 6 saniyede getirdi 
----Haydi indexleme yapalým
--create clustered index isim
--on indexleme(ID)
---- Þuanda indeþleme iþlemimiz yapýldý
--select *from indexleme where ID=2315641
---- Bu iþlemi 0 saniyede yaptý 2.5 milyona yakýn veri var 5 milyon olduðunu düþün birde
























----Index-4 Included Columns (performansý dahada arttýracak)
----Þimdi bir veri setinde priimary key yapýsý varsa eðer burada tarama yavaþlar 
----Bunun için nunclustered index yapýsý kullanabiliriz yada ýncluded columns yapýsý kullanýlabilir 
----Bu kýsýmda ýncluded columns yapýný görcez
----Ayrýca bize kullanmamýz gereken index yapýsýný bize sql söyler 
---- ctrl + l yaparsak
--select*from Musteri where sehir='ankara'-- þehiri ankara olanlarý bize getir dedik 
----8643 LÝK BÝR ÝÞ YAPTI
----ctrl +l yaptýðýmýzda 
----CREATE NONCLOSTERED ÝNDEX AND INCULDED COLUMNS
--/*
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [dbo].[Musteri] ([Sehir])
--INCLUDE ([ID],[Ad],[Soyad],[Cinsiyet],[Dogum_trh],[ilce],[Tel])
--GO
--*/
----VE BÝZE SÖYLEDÝÐÝ ÞEY BUNU YAPMAMIZ
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX ÝSÝM
--ON [dbo].[Musteri] ([Sehir])
--INCLUDE ([ID],[Ad],[Soyad],[Cinsiyet],[Dogum_trh],[ilce],[Tel])
--GO
--select*from Musteri where sehir='ankara'
----944 YAPTIÐI ÝÞ BUNA DÜÞTÜ ARADA BÜYÜK FARK VAR





----Index-5 Unique Index Nedir?
---- TEKRARLI ÝNDEXLERDE KULLANILMASI FAYDALIDIR
----Þimdi bakalým
--select *from Musteri where sehir='ankara'
----maliyet=8643 burada maliyet page sayýsý fazlaysa çok çalýþýr gibi
----9079 Bu ýd yi primary key yapmýþ halimiz
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX ÝSÝM
--ON [dbo].[Musteri] ([Sehir])
--INCLUDE ([Ad],[Soyad],[Cinsiyet],[Dogum_trh],[ilce],[Tel])
--GO
----831 buda nonclustered ve ýnclude yapýlarýyla olan maliyet
----Baya fark var
--Þimdi unique dediðimiz þey verinin tekrarsýz olmasý 
--nonunique de verinin tekrarlý olmasý 
--mesala burada ankara tekrarlý olduðu iöin bizim kurduðumuz 
--index yapýsý unique deðil nonunique
--unique örnek yapalým
--bunun için iþlem yapmaya gerek yok sql bunu anlýyor
--select*from Musteri where tel='04422345433'
----Maliyet yüksel olduðu için burdada non-clustered yapý kullanacaðýz 8541
--USE [Ornek]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [dbo].[Musteri] ([Tel])

--GO
---- bunu yaparak maliyet düþtü  6
--unique yapýsýný tekrarsýz veride kullanacaðýz yani



--son ornek
--select * from indexleme where sayý='kiþi2245644'
----maliyet 
----9098
----USE [indexleme]
----GO
----CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
----ON [dbo].[indexleme] ([sayý])

----GO
---- indexlemeyi yaptýk
----maliyet=3
----Ve buradaki her deðer tekil olduðu için unique kurabiliriz