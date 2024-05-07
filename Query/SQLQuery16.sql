--declare @x int
--set @x=1

--while @x<5250000
--begin
--set @x=@x+1
--insert into indexleme values
--('Kiþi'+ cast(@x AS varchar) )
--end

--select*from indexleme where sayý='kiþi4000000'
--indexleme yaptýk
--USE [indexleme]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [dbo].[indexleme] ([sayý])
--total fragmentation þuanda 99,89 % yani indexleme yapýmýzda bozukluk yook
-- þimdi 1 milyon tane daha veri ekleyelim
--Þuanda indexleme yapýmýz tamamen bozuldu


--View  yapýsý
--create view isim as select sorgu yapýsý 
--þeklinde kullanýlýr
--Create view örnekview as select*from Hasta

--select * from Hasta
----Bu yapý bize normal bildiðimiz hasta tablosunu getirirken 

--select * from örnekview
----Bu yapý bize sanal tabloyu yani view olarak kaydettiðimiz tabloyu 
----getirdi 

--Create view örnekview2 as select 
--Hasta_Ad+' '+Hasta_Soyad as 'Hasta AD SOYAD',datediff(year,Hasta_Dgmtrh,getdate()) as 'Hasta YAÞ'
--,Dok_Ad+' '+Dok_Soyad as 'Doktor AD SOYAD'
--from Hasta inner join Doktor on Hasta.Dok_id=Doktor.Dok_id
--SELECT*FROM örnekview2
---- Bu yapý tam bir örnek varya
---- Sonunda istediðim þeyi yapacak komut 
---- Ne yaptýk hasta ad soyad birleþtirdik hasta yaþ birleþtirdik doktor ad birleþtirdik
---- Doktor ve hasta ayrý tablolardaydý bunlarý iliþkiselendirip tek tabloda yazdýk ve 
---- Bu tabloyu kayýt ettik
---- aslýnda bu yapýyý kullanarak sql de bunu tekrar tekrar çaðýrmak 
---- ihtiyacýmýzdan kurtulduk

---- Bunlarý silmek için drop view örnekview komutunu kullanýrýz
-- DÝYELÝMKÝ biz kurguladýðýmýz view yapýsýnda arama sorgu yapmak istiyoruz oda þöyle 

--select [Hasta AD SOYAD] from örnekview2 
---- eðer yapýyý böyle parentezli kullanmaz isem bana iþlem yapmaz
--select * from örnekview2 where [Hasta YAÞ] <= 54 and [Hasta YAÞ]>=51 
----Yine kullandýk yapýyý ama parantezleri unutmuyoruz ve 
---- column çaðýrýrken viewdeki takma adlarý kullanmamýz gerekmektedir 

--View yapýsýyla bir tabloyu deðiþtirebilriiz alter komutuyla yada bunun yerine bence silip yenisinide oluþturabiliriz
--çok bir fark yok ama yinede gösteerelim
-- önceki örnek 2 yapýsý yukarda zaten create yerine alter yazýcam
--alter view örnekview2 as select 
--Hasta_Ad+' '+Hasta_Soyad as 'Hasta AD SOYAD',datediff(year,Hasta_Dgmtrh,getdate()) as 'Hasta YAÞ'
--,Ýl as 'Hasta Þehir'
--,Dok_Ad+' '+Dok_Soyad as 'Doktor AD SOYAD',Bolum as 'Doktor Bölüm'
--from Hasta 
--inner join Doktor on Hasta.Dok_id=Doktor.Dok_id
--inner join il on Hasta.Ýl_id=il.il_id
--inner join Bolum on Doktor.Bolum_id=Bolum.Bolum_id
--SELECT*FROM örnekview2


