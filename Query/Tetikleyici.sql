--Triggers 
--Bir tablo üzerinde yapýlan bir iþlemin baþka tablodaki 
--verileri tetiklemesi trigger yapýsýdýr 
--örnek verirsek çok daha verimli ve anlamlý olacaktýr

--create table urun(
--urun_id int identity(1,1) primary key ,
--urun varchar(15)
--)

--insert into urun values 
--('Buzdolabý'),('Ütü'),('Televizyon'),('Bilgisayar')

--create table stok(
--stod_id int identity(1,1) primary key,
--urun_id int ,
--stok_sayýsý int
--)

--insert into stok values(1,500),(2,300),(3,250),(4,150)

--create table satýs(
--satýs_id int identity (1,1) primary key,
--müsteri_ad_soyad varchar(30),
--satýn_alýnan_urun int,
--adet int

--)
--Burada uygulama yapacaðýmýz tablo yapýsýný kurduk 
--Biz baþka bir tabloda insert alter veya drop 
--yapýlarýndan birini uyguladýðýmýzda baþka bir tabloyu veya yine 
--ayný tabloyu etkilemesini istiyorsak 

--after veya for trigger
--yapýsýný kurmamýz gerekiyor
--Bu tabloda bizim ürünler var stoklarý var ve satýþlarý var
--e satýþ yapýlýrsa urun stokunda azalma olmasý gerkeir 
--burda bir triger kurabiliriz dimi bunun gibi ypaýlarý 
--yani satýþ yapýldýüý anda stokda azalma olmasý gerekitiðini
--trigger yapýsýyla elimizle deðilde otomatik gerçekleþmesini 
--saðlayacaðýz

-- ýnstead of trigger 
-- Bunu anlamadýk 

---create trigger isim on tabloisim trigger_tipi(yapýlacak iþlem) as kod yapýsý
--yapý böyle kuruluyor

-- Ben satýs tablosuna bir þey satýldýðýnda stokdan düþmesini
--istiyorumm

--ÝNSERT YAPISI ÖRNEÐÝ
--create trigger stok_azalt --trigger adý
--on satýs -- tetiklenmesini saðlayan tablo
--after insert -- tetikleyici komut
--as 
--begin
--declare @satýn_alýnan_urun int
--declare @adet int
--select @satýn_alýnan_urun=satýn_alýnan_urun,
--@adet=adet from inserted--deðiþkenleri oluþturdum 
---- Bu deðiþkenler ile satýn alýnnan ürünü ve adetini tutucam 
----Þimdi update yapýsýyla stok tablomda deðiþiklik yapýcam tek-tikleyecem yani
--update stok set stok_sayýsý=stok_sayýsý-@adet
----Burada stok sayýsýný güncelledik
--where urun_id=@satýn_alýnan_urun
----Burada güncellememiz gereken stok sayýnýn hangi ürün olduðunu 
----söyledik
--end
----Þimdi yapý kuruldu
--select *from stok
--select*from satýs
--insert into  satýs values('mehmet',1,150)
----Burada bu mehmeti eklediðimiz anda 
----Stokdaki 1 id li ürün 150 azaldý


--Yapýnýn çok iyi anlaþýlacaðýný düþünüyorummm

--DELETE YAPISI ÖRNEÐÝ

--SELECT*FROM satýs
--select*from stok
--ÞÝMDÝ ÝSE 
--DÝYELÝM ki ahmet aldýðý 150 adetten vazgeçti veya 
--mehmet bu vazgeçme sonucunda o aldýðý adetleri nasýl geri düþebiliriz
--tabiki de trigger yapýsýyla

--create trigger stok_ekle 
--on satýs
--after delete
--as
--begin
--declare @satýn_alýnan_urun int
--declare @adet int
--select @satýn_alýnan_urun=satýn_alýnan_urun,
--@adet=adet from  deleted --(bak bu daleted yapýsý 
---- arkada sildiklerimizi tutan bir sanal tablo aslýnda )

--update stok set stok_sayýsý=stok_sayýsý+@adet
--where urun_id=@satýn_alýnan_urun
--end

--SELECT*FROM satýs
--select*from stok

--delete from satýs where satýs_id=1
--delete from satýs where satýs_id=2
--delete from satýs where satýs_id=3
--delete from satýs where satýs_id=4
--delete from satýs where satýs_id=5

--Bütün satýrlarý sildim ve stoklar eski 
--haline döndü


--Update trigger yapýsý(update güncelleme)
--þimdi biz satýþ tablomuzda satýs adedini
--deðiþtirdiðimiz de stokdaki adette deðiþiklik olsun
--istiyoruz
--hali hazýrda ahmet can 5 adet 1 . üründen almmýþ
--onu 25 yaptýðýmýzda satýþ adedinin nasýl
--deðiþtiðini göreceðiz
--bunun sistemini kurgulayalým
--select*from satýs
--select*from stok
--create trigger guncelleme
--on satýs 
--after update -- update yapýsý olduðunu söyledik
--as
--begin
--declare @satýn_alýnan_ürün int
--declare @adet int
--declare @yeni int
--select @satýn_alýnan_ürün=satýn_alýnan_urun,
--@adet=adet from deleted --önce silme iþlemi yapacaðý için silinen veriyi deðiþkenlerde tuttu
--select @satýn_alýnan_ürün=satýn_alýnan_urun,
--@yeni=adet from inserted-- sonra ekleyeceði için eklenen veriyi deðiþkenlerde tuttu 

--update stok 
--set stok_sayýsý=stok_sayýsý+(@adet-@yeni)--burada eskisiyle yenisinin farkýný alýp stok sayýsýna eþitledik 
--where urun_id=@satýn_alýnan_ürün
--end

--update satýs set adet=15
--where satýs_id=6
----Burada 5 iken 15 yaptýk bakalým ne olacak
---- yapý çalýþýyor

--ÝNSTEAD OF TRÝGGER
--Þimdi aslýnda bu yapý kullanýcý bir iþlem yaptýðýnda onun yerine baþka biþey yapsýn program demektir
--Diyelimki kullanýcý bir veri silmek istiyor satýþ tablosundan 
--Buna izin vermek istemiyorsak ne yapacak bunu trigger yapýsýyla kuracaz silmeye kalktýðýnda hayýr silemezsin diyebileceðiz
--e tabý bunun yerine silme iþlemi yaptýðýnda sildiði veriyi baþka bir tabloya aktarabilceðimiz bir yapýda kurulabilir 
--aslýnda bunu kursak güzel bir örnek olacak ama þuan deðil þuan sadece silme iþlemi yaptýðýnda buna engel olalým
--create trigger engelleme 
--on satýs
--instead of delete --silmek yerine þunu yap 
--as 
--begin 
--raiserror('Bu tablo üzerinde silme yetkiniz yoktur',16,1)
--end
--select *from satýs
--delete from satýs where satýs_id=6
----bu komutu girdiðimde veriyi silemeyeceðimizi bize söyledi
