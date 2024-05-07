--Triggers 
--Bir tablo �zerinde yap�lan bir i�lemin ba�ka tablodaki 
--verileri tetiklemesi trigger yap�s�d�r 
--�rnek verirsek �ok daha verimli ve anlaml� olacakt�r

--create table urun(
--urun_id int identity(1,1) primary key ,
--urun varchar(15)
--)

--insert into urun values 
--('Buzdolab�'),('�t�'),('Televizyon'),('Bilgisayar')

--create table stok(
--stod_id int identity(1,1) primary key,
--urun_id int ,
--stok_say�s� int
--)

--insert into stok values(1,500),(2,300),(3,250),(4,150)

--create table sat�s(
--sat�s_id int identity (1,1) primary key,
--m�steri_ad_soyad varchar(30),
--sat�n_al�nan_urun int,
--adet int

--)
--Burada uygulama yapaca��m�z tablo yap�s�n� kurduk 
--Biz ba�ka bir tabloda insert alter veya drop 
--yap�lar�ndan birini uygulad���m�zda ba�ka bir tabloyu veya yine 
--ayn� tabloyu etkilemesini istiyorsak 

--after veya for trigger
--yap�s�n� kurmam�z gerekiyor
--Bu tabloda bizim �r�nler var stoklar� var ve sat��lar� var
--e sat�� yap�l�rsa urun stokunda azalma olmas� gerkeir 
--burda bir triger kurabiliriz dimi bunun gibi ypa�lar� 
--yani sat�� yap�ld��� anda stokda azalma olmas� gerekiti�ini
--trigger yap�s�yla elimizle de�ilde otomatik ger�ekle�mesini 
--sa�layaca��z

-- �nstead of trigger 
-- Bunu anlamad�k 

---create trigger isim on tabloisim trigger_tipi(yap�lacak i�lem) as kod yap�s�
--yap� b�yle kuruluyor

-- Ben sat�s tablosuna bir �ey sat�ld���nda stokdan d��mesini
--istiyorumm

--�NSERT YAPISI �RNE��
--create trigger stok_azalt --trigger ad�
--on sat�s -- tetiklenmesini sa�layan tablo
--after insert -- tetikleyici komut
--as 
--begin
--declare @sat�n_al�nan_urun int
--declare @adet int
--select @sat�n_al�nan_urun=sat�n_al�nan_urun,
--@adet=adet from inserted--de�i�kenleri olu�turdum 
---- Bu de�i�kenler ile sat�n al�nnan �r�n� ve adetini tutucam 
----�imdi update yap�s�yla stok tablomda de�i�iklik yap�cam tek-tikleyecem yani
--update stok set stok_say�s�=stok_say�s�-@adet
----Burada stok say�s�n� g�ncelledik
--where urun_id=@sat�n_al�nan_urun
----Burada g�ncellememiz gereken stok say�n�n hangi �r�n oldu�unu 
----s�yledik
--end
----�imdi yap� kuruldu
--select *from stok
--select*from sat�s
--insert into  sat�s values('mehmet',1,150)
----Burada bu mehmeti ekledi�imiz anda 
----Stokdaki 1 id li �r�n 150 azald�


--Yap�n�n �ok iyi anla��laca��n� d���n�yorummm

--DELETE YAPISI �RNE��

--SELECT*FROM sat�s
--select*from stok
--��MD� �SE 
--D�YEL�M ki ahmet ald��� 150 adetten vazge�ti veya 
--mehmet bu vazge�me sonucunda o ald��� adetleri nas�l geri d��ebiliriz
--tabiki de trigger yap�s�yla

--create trigger stok_ekle 
--on sat�s
--after delete
--as
--begin
--declare @sat�n_al�nan_urun int
--declare @adet int
--select @sat�n_al�nan_urun=sat�n_al�nan_urun,
--@adet=adet from  deleted --(bak bu daleted yap�s� 
---- arkada sildiklerimizi tutan bir sanal tablo asl�nda )

--update stok set stok_say�s�=stok_say�s�+@adet
--where urun_id=@sat�n_al�nan_urun
--end

--SELECT*FROM sat�s
--select*from stok

--delete from sat�s where sat�s_id=1
--delete from sat�s where sat�s_id=2
--delete from sat�s where sat�s_id=3
--delete from sat�s where sat�s_id=4
--delete from sat�s where sat�s_id=5

--B�t�n sat�rlar� sildim ve stoklar eski 
--haline d�nd�


--Update trigger yap�s�(update g�ncelleme)
--�imdi biz sat�� tablomuzda sat�s adedini
--de�i�tirdi�imiz de stokdaki adette de�i�iklik olsun
--istiyoruz
--hali haz�rda ahmet can 5 adet 1 . �r�nden almm��
--onu 25 yapt���m�zda sat�� adedinin nas�l
--de�i�ti�ini g�rece�iz
--bunun sistemini kurgulayal�m
--select*from sat�s
--select*from stok
--create trigger guncelleme
--on sat�s 
--after update -- update yap�s� oldu�unu s�yledik
--as
--begin
--declare @sat�n_al�nan_�r�n int
--declare @adet int
--declare @yeni int
--select @sat�n_al�nan_�r�n=sat�n_al�nan_urun,
--@adet=adet from deleted --�nce silme i�lemi yapaca�� i�in silinen veriyi de�i�kenlerde tuttu
--select @sat�n_al�nan_�r�n=sat�n_al�nan_urun,
--@yeni=adet from inserted-- sonra ekleyece�i i�in eklenen veriyi de�i�kenlerde tuttu 

--update stok 
--set stok_say�s�=stok_say�s�+(@adet-@yeni)--burada eskisiyle yenisinin fark�n� al�p stok say�s�na e�itledik 
--where urun_id=@sat�n_al�nan_�r�n
--end

--update sat�s set adet=15
--where sat�s_id=6
----Burada 5 iken 15 yapt�k bakal�m ne olacak
---- yap� �al���yor

--�NSTEAD OF TR�GGER
--�imdi asl�nda bu yap� kullan�c� bir i�lem yapt���nda onun yerine ba�ka bi�ey yaps�n program demektir
--Diyelimki kullan�c� bir veri silmek istiyor sat�� tablosundan 
--Buna izin vermek istemiyorsak ne yapacak bunu trigger yap�s�yla kuracaz silmeye kalkt���nda hay�r silemezsin diyebilece�iz
--e tab� bunun yerine silme i�lemi yapt���nda sildi�i veriyi ba�ka bir tabloya aktarabilce�imiz bir yap�da kurulabilir 
--asl�nda bunu kursak g�zel bir �rnek olacak ama �uan de�il �uan sadece silme i�lemi yapt���nda buna engel olal�m
--create trigger engelleme 
--on sat�s
--instead of delete --silmek yerine �unu yap 
--as 
--begin 
--raiserror('Bu tablo �zerinde silme yetkiniz yoktur',16,1)
--end
--select *from sat�s
--delete from sat�s where sat�s_id=6
----bu komutu girdi�imde veriyi silemeyece�imizi bize s�yledi
