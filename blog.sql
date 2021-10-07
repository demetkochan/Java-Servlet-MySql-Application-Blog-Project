-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 12 Ağu 2021, 19:16:17
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`aid`, `name`, `email`, `password`) VALUES
(1, 'Demet Koçhan', 'demet@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'Erkan Bilki', 'erkan@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(3, 'Ali Bilmem', 'ali@mail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blogs`
--

CREATE TABLE `blogs` (
  `bid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `aid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `blogs`
--

INSERT INTO `blogs` (`bid`, `title`, `detail`, `date`, `aid`) VALUES
(1, 'Bağışıklık Sistemi Nasıl Çalışır?', 'Doğuştan gelen bağışıklık, örüntü (motif veya desen) tanıma olarak bilinen olağandışı molekülleri veya aktiviteleri algılayan sensörleri tetikleyerek başlar. Bu sensörler (PRR, Desen Tanıma Reseptörleri) tarafından mikrobiyal desenler tespit edildiğinde sitokinler ve interferonlar salgılayarak anında alarmı tetiklerler. İnterferonlar, daha fazla istilaya karşı korunmaya yardımcı olmak için etraflarındaki çeşitli hücrelerdeki reseptörlere bağlanırlar, daha fazla virüs üretimini durdurmak için enfekte olmuş hücrelerin ölümüne neden olurlar, beyaz kan hücrelerinin istilacılara saldırmak için enfeksiyon bölgesine gelmesini sağlarlar. Ancak sitokinler sürekli tetiklendip yapıldıklarında sitokinlere yanıt veren hücreler zarar görebilir ve organların işlevi durrabilir. Bu durum, COVID19 dahil olmak üzere ciddi hastalıklara aracılık eden “sitokin fırtınası” olarak bilinir.', '2021-08-04 11:26:31', 1),
(2, 'Dünya Dönmeyi Bırakırsa Ne Olur?', 'Dünya bir anda dönmeyi bırakırsa, gezegenin yüzeyinin çoğu için çok büyük bir felaket olurdu. Hissetmesek de, hepimiz dönerken gezegenle birlikte hareket ediyoruz; Ekvatorda bu, saatte yaklaşık 1.609 km hıza çıkıyor. Gezegeni aniden durdurursanız, üzerinde oturan her şey doğuya doğru uçar. İnsanların, evlerin, ağaçların, kayaların ve daha fazlasının saatte yüzlerce km hızla yana doğru fırlatıldığını hayal edin. Sonrasında, hala neredeyse gezegen kadar hızlı dönen yüksek hızlı rüzgarlar, yüzeyi temizlerdi. Yavaşlama daha kademeli olarak gerçekleşseydi, etkiler yine de dramatik olacak, ancak daha uzun bir süre boyunca ortaya çıkacaktı. Fark edebileceğimiz ilk şey, Güneş’in artık bir gün boyunca gökyüzünde dolaşmıyor olmasıdır. Güneş’in görünürdeki hareketi, Dünya’nın dönüşünden gelir, yani eğer gezegen durağan olsaydı, tek bir günün yarım yıl sürmesine neden olurdu (yine de bazı çok uzun süreli gün batımlarını dört gözle bekleyebilirdik).', '2021-08-04 11:26:31', 2),
(3, 'Antarktika üzerindeki ozon deliği 2020’de yeniden genişledi', 'Bilim insanları 2019’da, Antarktika üzerindeki ozon deliğini incelemeye başladığı 1982’den beri en küçük yıllık zirveye ulaştığını açıklamıştı. Ozon tabakası deliğine dair bu umut verici gelişmenin ardından 2020’de yaşanan iklimden anormallik ve büyüme, konunun hâlâ ciddi bir seviyede ele alınması gerektiğini gösteriyor. Avrupa Uzay Ajansı‘nın Copernicus Sentinel-5P uydusundan yapılan yeni ölçümler, ozon deliğinin bu yıl 2 Ekim’de yaklaşık 25 milyon kilometre kare maksimum büyüklüğüne ulaştığını gösteriyor. Daha önce 2018’de 22,9 ve 2015’te 25,6 milyon kilometrekarelik ölçümler kaydedilmişti. \r\n\r\nBirleşmiş Milletler’in (BM) alt kuruluşu olan Dünya Meteoroloji Örgütü‘nün (DMÖ) sözcüsü Clare Nullis, BM Cenevre ofisinde yaptığı konuşmada, ozon tabakasındaki deliğin her yıl Ağustos ayında genişlemeye başladığını ve Ekim’de pik noktasına ulaştığını söyledi. Nullis, ozon tabakasının (stratosfer), ultraviyole adı verilen ve insanlık için son derece zararlı olan ışınların yüzde 99’unu emme özelliğine sahip bulunduğuna dikkati çekti. Nullis bununla beraber uzmanların, 1978’de imzalanan ve kloroflürokarbon içeren ürünlerinin kullanımını ve yapımını yasaklayan  Montreal Protokolü’nün işletilmeye başlamasıyla birlikte ozon tabakasının kendini iyileştirme yoluna girdiği yolundaki görüşlerine değindi ve iklim bilimcilerin tahminlerine göre 2060’da tabakanın 1980 yılındaki haline geri dönebileceğini söyledi.\r\n\r\n', '2021-08-09 18:24:10', 1),
(4, 'Spor yaparken su tüketimi nasıl olmalı?', 'Günlük su ihtiyacımızı içtiğimiz sudan, çeşitli içeceklerden ve tükettiğimiz besinlerin içindeki su kaynaklarından sağlarız. Kaliteli bir yaşam için su ihtiyacımızı alkollü-alkolsüz, gazlı-gazsız, şeker ilaveli içecekler yerine çoğunlukla içme suyu ile gidermeliyiz. Vücudumuzda meydana gelebilecek düşük miktarlarda su kayıpları bile performansı önemli derecede etkiler. Diğer taraftan egzersiz sırasında terleyerek sıvı ve mineral kayıpları yaşarız ve bunları da telafi etmemiz gerekir. Mineralli soda, sporcu içecekleri, sodalı ayran, sirkeli su gibi içecekler kaybettiğimiz minerallerin yerine konulmasına yardımcı olur. Bir diğer önemli uyarımız ise şu şekilde olacaktır; eğer sadece susadığınız zamanlarda su içiyorsanız, dehidrasyon yani vücuttan su kaybı başladığı anda bunu fark ederek, gecikmeli su içiyor olabilirsiniz çünkü susama hissi, vücuttaki suyun %1’i kaybedildiğinde oluşan bir sinyaldir, dehidrasyonun bir ileri aşama işaretidir ve dehidrasyon beynin susuzluk merkezini daha fazla sıvı almak için uyarır. \r\n\r\nSpor Yapanlar İçin Sıvı Tüketmek Neden Bu Kadar Önemli?\r\n\r\nEgzersiz sırasında sıvı tüketmenin en önemli rolü vücut sıcaklığının kontrolüdür. Hareket halindeki kaslarımız ısı üretirler ve bu ısının vücuttan uzaklaştırılması gerekir, bu süreç terimizin deriden buharlaşması ve solunum ile yaşanır. Yani terlerken hatta soluduğumuz havada bile sıvı kaybederiz. Aşırı sıvı kaybı yani dehidrasyon oluştuğunda, performansta düşüş ve yorgunluk görülür ayrıca toparlanma da gecikir.\r\n\r\nDehidrasyon Belirtileri Nelerdir?\r\n\r\nPerformansta azalma\r\nErken yorulma\r\nVücut sıcaklığında artış\r\nOdaklanmada güçlük\r\nBaş ağrısı\r\nTerleyememe\r\nİdrar renginin koyulaşması\r\nEgzersiz sonrasında ek sıvı tüketmelisiniz', '2021-08-09 18:30:28', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `contact`
--

INSERT INTO `contact` (`cid`, `name`, `email`, `number`, `message`) VALUES
(1, 'Yiğit Kılıç', 'kılıc@mail.com', '345672', 'Site çok güzel'),
(2, 'Kemal Sönmez', 'kemal@mail.com', '8794', 'Çok güzel bir blog sayfası'),
(3, 'Ayşe Yıldız', 'ayse@mail.com', '9473572', 'Geliştirilmesi gereken noktalar var'),
(4, 'Nazlı Ölmez', 'nazlı@mail.com', '785345', 'çok güzel'),
(5, 'Nazlı Ölmez', 'nazlı@mail.com', '785345', 'çok güzel'),
(6, 'Kenan', 'kenan@mail.com', '092558153', 'Spor ile ilgili yazılarda olmalı');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Tablo için indeksler `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`bid`);

--
-- Tablo için indeksler `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `blogs`
--
ALTER TABLE `blogs`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
