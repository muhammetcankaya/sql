---- uni�n ve union all yap�s�
----�ekilen verileri join gibi yan yana de�ilde alt alta 
----g�rmemizi sa�layan bir yap�


---- bu kullaca��m yap� i�in �ok mant�kl� olmasada ��ayle aanlatal�m
----bu yap� ile diyelimki bizim hasta ad ve hasta soyad verilerimiz
----ayr�k bir �ekilde iki tabloda var i�te bu verileri alt alta tekrars�z
----bir �ekide yazd�rmak �in kullanaca��m�z yap� union ve all union yap�s�d�r
---- ayr�ca bunlar� alfabetik s�ralar
--select hasta_ad as ad,hasta_soyad as soyad from Hasta
--union
--select dok_ad,Dok_Soyad from Doktor
----tekrarl� verileri atar
--select hasta_ad as ad,hasta_soyad as soyad from Hasta
--union all
--select dok_ad,Dok_Soyad from Doktor
----tekrarl� verileri atmaz

-- De�i�ken tan�mlama --
--Declare@de�i�ken ismi de�i�ken tipi
--set @de�i�ken=de�i�ken atamas�
--declare @x varchar(25)
--set @x= (select Dok_Ad from Doktor where Dok_id=25)
--select @x as Doktor_ad
--G�r�ld��� �zere yap�y� olu�turduk 
-- bu de�i�ken istedi�im gibi i�inde sutun de�ilde sadece bir
--de�er atabiliyoruz burada id=25 olan doktorun ad�n� de�i�kene atad�k

--declare @x int, @y int,@z int
--set @x=12
--set @y=6
--set @z=@x+@y
--select @z as 'x+y'

--declare @ad varchar(15) ,@soyad varchar(15)
--set @ad='Anla��l�r'
--set @soyad='Ekonomi'
--select @ad + ' '+ @soyad as 'Ad Soyad'


--Case...When...Then...Else...End �art Yap�s�
--Case
--Select s�t�n_ad�,case �art s�tunu when then �art sa�lan�rsa bu i�lemi yap else �u i�lemi yap
-- ya� 60 dan b�y�kse ya�l� k���kse gen�


--select 
--	case hasta_cinsiyet
--		when 'E' then 'Erkek'
--		else  'Kad�n'
--	end as cinsiyet
--	from Hasta


--select Hasta_Ad+' '+Hasta_Soyad as ad_soyad,datediff(YEAR,Hasta_Dgmtrh,GETDATE()) as Ya�,
--	case 
--		when  datediff(YEAR,Hasta_Dgmtrh,GETDATE())>=60 then 'Y�ksek Risk'
--		when  datediff(YEAR,Hasta_Dgmtrh,GETDATE())<=60 and datediff(YEAR,Hasta_Dgmtrh,GETDATE())>=52 then 'Orta Risk'
--		else 'Risk yok'
--		end
--		as 'Risk Durumu'
--		from Hasta

-- Bu yap� bize b�yle olursa �unu getir b�yle olmazsa �unu getir der bu yap�y� anlatmak gerekirse 
--hasta ad soyad ve ya��n� zaten g�r�cez case
--yap�s�n� a�t�ktan sonra when ile ilk �art� verdim ya�� 60 dan b�y�kse b�y�k risk yazd�rs�n yan�na
--ya�� 60-52 aras�nda ise orta risk desin k���kse risk yok desin dedik 
--b�t�n bu ris de�erlerini ya�lar�n yan�na yeni bir sutun olarak atad�k asl�nda 
--excel de oldu�u gibi h�cre bazl� bir e�er yap�s� kurgulamaktan farks�z



--select Dok_Ad,Bolum,
--case Bolum
--	when 'Genel Cerrahi'  then 'y�ksek riskli'
--	when 'Fizik Tedavi ve Rehabilitasyon'  then 'y�ksek riskli'
--	when 'G�z Hastal�klar�'  then 'y�ksek riskli'
--	else 'az riskli'
--	end as 'risk'
--from doktor inner join bolum on Doktor.Dok_id=Bolum.Bolum_id

--Burada da bu yap�y� join yap�s�yla birlikte kulland�k






--if exists yap�s�
--if kosul begin sonu� end else begin sonu�2

--declare @sayi int
--set @sayi=1020

--if @sayi=100 
--	begin 
--	print 'Say� de�eri 100'
--end
--	else
--	print 'Say� de�eri 100 den farkl�d�r'

--declare @Kad�n float,@erkek float,@sonux float
--set @kad�n=(select count(Hasta_Cinsiyet) from hasta where Hasta_Cinsiyet='K')
--set @erkek=(select count(Hasta_Cinsiyet) from hasta where Hasta_Cinsiyet='E')
--set @sonux=@kad�n/(@erkek+@kad�n)
--print @sonux
--if @sonux>=0.5
--begin 
--print 'Kad�n hasta oran� %50 den b�y�kt�r'
--end
--else 
--print 'Kad�n hasta oran� %50 den b�y�k de�ildir'



--if exists
-- Bu yap� bize bir de�erin  tablo i�erinde varmm� yokmu onu bulmam�za yard�mc� olur
-- Mesala 33844372688 tc li bir hasta varm� onu g�relim

--if exists (select *from Hasta where Hasta_Tc=33844372688)
--print 'Kay�t var'
--else 
--print 'kay�t yok'
-- kay�t varam� yokmu kontrol etti ve sonu�llar� g�sterdi

--son k�sm� tekrar bak 
