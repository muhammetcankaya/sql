--declare @x int
--set @x=1

--while @x<5250000
--begin
--set @x=@x+1
--insert into indexleme values
--('Ki�i'+ cast(@x AS varchar) )
--end

--select*from indexleme where say�='ki�i4000000'
--indexleme yapt�k
--USE [indexleme]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [dbo].[indexleme] ([say�])
--total fragmentation �uanda 99,89 % yani indexleme yap�m�zda bozukluk yook
-- �imdi 1 milyon tane daha veri ekleyelim
--�uanda indexleme yap�m�z tamamen bozuldu


--View  yap�s�
--create view isim as select sorgu yap�s� 
--�eklinde kullan�l�r
--Create view �rnekview as select*from Hasta

--select * from Hasta
----Bu yap� bize normal bildi�imiz hasta tablosunu getirirken 

--select * from �rnekview
----Bu yap� bize sanal tabloyu yani view olarak kaydetti�imiz tabloyu 
----getirdi 

--Create view �rnekview2 as select 
--Hasta_Ad+' '+Hasta_Soyad as 'Hasta AD SOYAD',datediff(year,Hasta_Dgmtrh,getdate()) as 'Hasta YA�'
--,Dok_Ad+' '+Dok_Soyad as 'Doktor AD SOYAD'
--from Hasta inner join Doktor on Hasta.Dok_id=Doktor.Dok_id
--SELECT*FROM �rnekview2
---- Bu yap� tam bir �rnek varya
---- Sonunda istedi�im �eyi yapacak komut 
---- Ne yapt�k hasta ad soyad birle�tirdik hasta ya� birle�tirdik doktor ad birle�tirdik
---- Doktor ve hasta ayr� tablolardayd� bunlar� ili�kiselendirip tek tabloda yazd�k ve 
---- Bu tabloyu kay�t ettik
---- asl�nda bu yap�y� kullanarak sql de bunu tekrar tekrar �a��rmak 
---- ihtiyac�m�zdan kurtulduk

---- Bunlar� silmek i�in drop view �rnekview komutunu kullan�r�z
-- D�YEL�MK� biz kurgulad���m�z view yap�s�nda arama sorgu yapmak istiyoruz oda ��yle 

--select [Hasta AD SOYAD] from �rnekview2 
---- e�er yap�y� b�yle parentezli kullanmaz isem bana i�lem yapmaz
--select * from �rnekview2 where [Hasta YA�] <= 54 and [Hasta YA�]>=51 
----Yine kulland�k yap�y� ama parantezleri unutmuyoruz ve 
---- column �a��r�rken viewdeki takma adlar� kullanmam�z gerekmektedir 

--View yap�s�yla bir tabloyu de�i�tirebilriiz alter komutuyla yada bunun yerine bence silip yenisinide olu�turabiliriz
--�ok bir fark yok ama yinede g�steerelim
-- �nceki �rnek 2 yap�s� yukarda zaten create yerine alter yaz�cam
--alter view �rnekview2 as select 
--Hasta_Ad+' '+Hasta_Soyad as 'Hasta AD SOYAD',datediff(year,Hasta_Dgmtrh,getdate()) as 'Hasta YA�'
--,�l as 'Hasta �ehir'
--,Dok_Ad+' '+Dok_Soyad as 'Doktor AD SOYAD',Bolum as 'Doktor B�l�m'
--from Hasta 
--inner join Doktor on Hasta.Dok_id=Doktor.Dok_id
--inner join il on Hasta.�l_id=il.il_id
--inner join Bolum on Doktor.Bolum_id=Bolum.Bolum_id
--SELECT*FROM �rnekview2


