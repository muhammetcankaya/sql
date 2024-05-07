---- uniýn ve union all yapýsý
----çekilen verileri join gibi yan yana deðilde alt alta 
----görmemizi saðlayan bir yapý


---- bu kullacaðým yapý için çok mantýklý olmasada þöayle aanlatalým
----bu yapý ile diyelimki bizim hasta ad ve hasta soyad verilerimiz
----ayrýk bir þekilde iki tabloda var iþte bu verileri alt alta tekrarsýz
----bir þekide yazdýrmak çin kullanacaðýmýz yapý union ve all union yapýsýdýr
---- ayrýca bunlarý alfabetik sýralar
--select hasta_ad as ad,hasta_soyad as soyad from Hasta
--union
--select dok_ad,Dok_Soyad from Doktor
----tekrarlý verileri atar
--select hasta_ad as ad,hasta_soyad as soyad from Hasta
--union all
--select dok_ad,Dok_Soyad from Doktor
----tekrarlý verileri atmaz

-- Deðiþken tanýmlama --
--Declare@deðiþken ismi deðiþken tipi
--set @deðiþken=deðiþken atamasý
--declare @x varchar(25)
--set @x= (select Dok_Ad from Doktor where Dok_id=25)
--select @x as Doktor_ad
--Görüldüðü üzere yapýyý oluþturduk 
-- bu deðiþken istediðim gibi içinde sutun deðilde sadece bir
--deðer atabiliyoruz burada id=25 olan doktorun adýný deðiþkene atadýk

--declare @x int, @y int,@z int
--set @x=12
--set @y=6
--set @z=@x+@y
--select @z as 'x+y'

--declare @ad varchar(15) ,@soyad varchar(15)
--set @ad='Anlaþýlýr'
--set @soyad='Ekonomi'
--select @ad + ' '+ @soyad as 'Ad Soyad'


--Case...When...Then...Else...End Þart Yapýsý
--Case
--Select sütün_adý,case þart sütunu when then þart saðlanýrsa bu iþlemi yap else þu iþlemi yap
-- yaþ 60 dan büyükse yaþlý küçükse genç


--select 
--	case hasta_cinsiyet
--		when 'E' then 'Erkek'
--		else  'Kadýn'
--	end as cinsiyet
--	from Hasta


--select Hasta_Ad+' '+Hasta_Soyad as ad_soyad,datediff(YEAR,Hasta_Dgmtrh,GETDATE()) as Yaþ,
--	case 
--		when  datediff(YEAR,Hasta_Dgmtrh,GETDATE())>=60 then 'Yüksek Risk'
--		when  datediff(YEAR,Hasta_Dgmtrh,GETDATE())<=60 and datediff(YEAR,Hasta_Dgmtrh,GETDATE())>=52 then 'Orta Risk'
--		else 'Risk yok'
--		end
--		as 'Risk Durumu'
--		from Hasta

-- Bu yapý bize böyle olursa þunu getir böyle olmazsa þunu getir der bu yapýyý anlatmak gerekirse 
--hasta ad soyad ve yaþýný zaten görücez case
--yapýsýný açtýktan sonra when ile ilk þartý verdim yaþý 60 dan büyükse büyük risk yazdýrsýn yanýna
--yaþý 60-52 arasýnda ise orta risk desin küçükse risk yok desin dedik 
--bütün bu ris deðerlerini yaþlarýn yanýna yeni bir sutun olarak atadýk aslýnda 
--excel de olduðu gibi hücre bazlý bir eðer yapýsý kurgulamaktan farksýz



--select Dok_Ad,Bolum,
--case Bolum
--	when 'Genel Cerrahi'  then 'yüksek riskli'
--	when 'Fizik Tedavi ve Rehabilitasyon'  then 'yüksek riskli'
--	when 'Göz Hastalýklarý'  then 'yüksek riskli'
--	else 'az riskli'
--	end as 'risk'
--from doktor inner join bolum on Doktor.Dok_id=Bolum.Bolum_id

--Burada da bu yapýyý join yapýsýyla birlikte kullandýk






--if exists yapýsý
--if kosul begin sonuç end else begin sonuç2

--declare @sayi int
--set @sayi=1020

--if @sayi=100 
--	begin 
--	print 'Sayý deðeri 100'
--end
--	else
--	print 'Sayý deðeri 100 den farklýdýr'

--declare @Kadýn float,@erkek float,@sonux float
--set @kadýn=(select count(Hasta_Cinsiyet) from hasta where Hasta_Cinsiyet='K')
--set @erkek=(select count(Hasta_Cinsiyet) from hasta where Hasta_Cinsiyet='E')
--set @sonux=@kadýn/(@erkek+@kadýn)
--print @sonux
--if @sonux>=0.5
--begin 
--print 'Kadýn hasta oraný %50 den büyüktür'
--end
--else 
--print 'Kadýn hasta oraný %50 den büyük deðildir'



--if exists
-- Bu yapý bize bir deðerin  tablo içerinde varmmý yokmu onu bulmamýza yardýmcý olur
-- Mesala 33844372688 tc li bir hasta varmý onu görelim

--if exists (select *from Hasta where Hasta_Tc=33844372688)
--print 'Kayýt var'
--else 
--print 'kayýt yok'
-- kayýt varamý yokmu kontrol etti ve sonuçllarý gösterdi

--son kýsmý tekrar bak 
