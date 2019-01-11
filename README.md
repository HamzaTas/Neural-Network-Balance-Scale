# Neural-Network-Balance-Scale

**Genel Bilgiler**
-  Bu Çalışma seçmeli olarak almış olduğum Bulunık Mantık ve Yapay Sinir Ağlarını Giriş isimli ders kapsamında final projesi olarak hazırlanıştır.
-  Proje kapsamında kullanılan Veri Tabanı UCI Repositories sayfasından alınmıştır. Projenin doğru çalışması için veri tabanı üzerinde aşağıda bahsedilen değişikliklerin yapılması gerekmektedir.

Veri Tabanı : [Balance Scale](https://archive.ics.uci.edu/ml/datasets/Balance+Scale)

**ÖZET**

   Yapılan çalışmanın temel amacı girilen veri seti üzerinde terazinin dengede olup olmadığını tahmin etmektir. Yapılan çalışmada oluşturulan yapay sinir ağı kendisine verilen veri seti üzerinde sınıflandırma yaparak çıkış değerlerinin tahminini öğrenmeye çalışır. Sınıflandırmanın amacı, basitçe bir veri kümesi (data set) üzerinde tanımlı olan çeşitli sınıflar arasında veriyi dağıtmaktır. Sınıflandırma algoritmaları, verilen eğitim kümesinden bu dağılım şeklini öğrenirler ve daha sonra sınıfının belirli olmadığı test verileri geldiğinde doğru şekilde sınıflandırmaya çalışırlar. Oluşturulan yapay sinir ağı da terazinin giriş değerlerine göre terazinin 3 denge durumlarından (dengede , sağda ve solda) birini tahmin eder. Bu amaçla daha önce oluşturulmuş Balance Scale isimli veri tabanından yardım alınarak yapay sinir ağının öğrenmesi sağlanmıştır. Oluşturulan yapay sinir ağı problem gereksinimlerine göre giriş ve çıkışları belirlenerek çok katmanlı bir yapay sinir ağı olarak şekillendirilmiştir. Yapılan testler sonucunda bu yapay sinir ağı %91.6800 doğruluk ile çıkışları tahmin etmiştir.

#### 1.GİRİŞ

Tarih boyunca insanlar iki cisim arasındaki ağırlığı ayırt edebilmek için çeşitli araçlardan yardım almıştır. Terazi de bu araçlardan biridir. Yapay sinir ağı ile yapılan bu çalışmada ortaya konulan yapay sinir ağı iki cismin ağırlığını ölçmek veya bir cismi denge de tutmak için kullanılabilir. Özellikle insansı robotların dengelerini sağlamaları için başvurulabilecek bir kaynak niteliği taşımaktadır. Yapılan çalışma ile iki cisim ağırlıklarına göre sınıflandırılabilecek veya bir cismin dengede kalabilmesi için cismin o an ki denge durumu hakkında bilgi alabileceğiz.

#### 2. MATERYAL VE YÖNTEM

**2.1 Kullanılan Veri Tabanı**

Uygulamada kullanılan veritabanı UCI Machine Learning Repository&#39;den alınan Balance Scale veri tabanıdır. 1976 yılımda Siegler R.S. tarafından psikolojik bir model olarak oluşturulmuştur. Çıkışlar bir terazinin denge durumları hakkında da sınıflandırmaya uygun durumdadır. Veri tabanında 625 adet veri bulunmaktadır ve bu verilere ait 3 sınıf bulunmaktadır. Bu sınıflar Left (L) , Right (R) ve Balance (B) şeklindedir. Örneklerin 49 tanesi Balance sınıfına , 288 tanesi Left Sınıfına ve 288 tanesi Right sınıfına aittir. Veri setinde toplam 5 öznitelik bulunmaktadır. Bu öznitelikler ve değer ağırlıkları tabloda gösterilmiştir.

Tablo 1. Veri Setleri ve değer aralıkları

| Öznitelik   | Veri Seti | Değer Aralığı |
| --- | --- | --- |
| 1 | Class Name | 3 (L, B, R) |
| 2 | Left-Weight | 5 (1, 2, 3, 4, 5) |
| 3 | Left-Distance | 5 (1, 2, 3, 4, 5) |
| 4 | Right-Weight | 5 (1, 2, 3, 4, 5) |
| 5 | Right-Distance | 5 (1, 2, 3, 4, 5) |

Tahminde kullanılabilecek öznitelikler 2 ile 5 arasındaki özniteliklerdir. 1. Öznitelik sınıf bilgisini, 2. Öznitelik terazinin sol ağırlığını, 3. Öznitelik terazinin sol kol uzunluğunu, 4. Öznitelik terazinin sağ ağırlığını ve en son olarak 5. Öznitelik terazinin sol kol uzunluğunu belirtmektedir.

Veri setine ait verilerden örnek bir kesit alınarak tablo 2&#39; de gösterilmiştir. görsel 1&#39;de veri setine ait öznitelikler şekil üzerinden gösterilmiştir.

Tablo 2. Veri Setine ait bir kesit

|   | Balance | Var1 | Var2 | Var3 | Var4 |
| --- | --- | --- | --- | --- | --- |
| 0 | B | 1 | 1 | 1 | 1 |
| 1 | R | 1 | 1 | 1 | 2 |
| 2 | R | 1 | 1 | 1 | 3 |
| 3 | R | 1 | 1 | 1 | 4 |
| 4 | R | 1 | 1 | 1 | 5 |

Görsel 1. Problem gösterimi

![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/1.png)

**2.2 Yapılan İş : Yapay Sinir Ağı ile Terazinin denge durumun belirlenmesi**

   Veri tabanında terazinin denge durumu tahmini için kullanılmak üzere 4 adet öznitelik bulunmaktadır. Dolayısıyla giriş katmanında 4 nöron kullanılmıştır. Çıkış katmanında da L sınıfını ifade etmek için 10 , B sınıfını ifade etmek için 11  ve R sınıfını ifade etmek için ikilik tabanda 01 ifadeleri kullanılmıştır. İkilik tabanda 2 basamaklı ifade edilen hedefler çıkış katmanında 2 nöron kullanılarak çıkışın problemimizi sınıflandırılabilir duruma getirilmesi sağlanmıştır. Başlangıçta ara katmanda ise 4 nöron kullanıldı. Ancak yapılan testler sonucunda yapay sinir ağımız en iyi tahmini 2 nöron kullanımı durumda  verdiğinden dolayı ara katmanda 2 nöron kullanılmıştır. Başlangıçta ara katman ve çıkış  katmanı ağırlıklarına ve bias değerleri 0 ve rastgele değerleri oluşturulmuş ve eğitim boyunca bu ağırlıklar ve bias güncellenerek son değerler elde edilmiştir. Çıkış nöronlarında oluşan hatanın geri yayılımı sayesinde tahmindeki hata oranı minimuma indirilmiştir.

Aktivasyon fonksiyonu olarak sigmoid fonksiyonu tercih edilmiştir.

![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/2.png)

Çıkış katmanı için hesaplamalar aşağıda çıkarılan formüle göre yapılmıştır.

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/3.png)

Burada opn çıkış katmanı çıkışları, opBari ara katman çıkışlarını wi çıkış katmanı ağırlıklarını ve bn çıkış katmanı biaslarını ifade eder.
 
Ara katman için hesaplamalar aşağıda çıkarılan formüle göre yapılmıştır.
 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/4.png)

   Burada opBarn ara katman çıkışlarını , Xi yapay sinir ağına verilecek girişleri , wBari ara katman ağırlıklarını ve bBarn ara katman baislarını ifade eder.

Oluşturulan yapay sinir ağında Öğrenme katsayısı 0.6 ve yerel minimumlara takılmamak adını alfa değeri 0.8 alınmıştır. Oluşturulan yapay sinir ağının şekli görsel 2&#39;deki gibidir.

Görsel 2. Oluşturulan Yapay Sinir Ağı

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/5.png)
 
Yapay sinir ağında çıkış ile hedef bir birine eşit olmadığı durumda geri besleme algoritmasına göre güncellemeler aşağıdaki formüllere göre yapılmaktadır.

 
 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/6.png)
 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/7.png)


T1,2  hedeflenen çıkış değerlerini ifade etmektedir.

Yapay sinir ağının kodlaması Matlab ortamında yapılmış ve Matlab&#39;ın hazır fonksiyonları ve YSA aracı kullanılmamıştır. Ağın vermiş olduğu çıktının ekran görüntüsü Görsel 3&#39;te gösterilmiştir.

Görsel 3. Çalışmanın ekran çıktısı

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/8.png)
 
**2.2.1 En uygun nöron sayısını bulmaya yönelik testler**

   Ara katmanda kaç nöron kullanılması gerektiğini tespit etmek için 1 nöron ile başlayıp 50 nörona kadar yapay sinir ağı tek tek denenerek aynı test verisi üzerindeki doğruluk oranları incelenmiştir. Yapılan incelemede en iyi doğruluk oranını yapay sinir ağında 2 nöron kullanıldığında verildiği görülmüştür. Bu yüzden 2 nöron kullanılmıştır. İlk 50 denemedeki nöronlara göre doğruluk oranları Grafik 1&#39;de verilmiştir.

Grafik 1. nöronlara göre doğruluk oranları

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/9.png)


**2.2.2 En uygun öğrenme katsayısını (nu) bulmaya yönelik testler**

   Nu katsayısının değerinin tespiti için ara nöron sayısı tespitine benzer şekilde 0.1 ile başlayarak 0.1 aralıklar ile 1 değerine kadar yapay sinir ağının verdiği sonuçlar kayıt altına alında ve en iyi doğruluk oranını 0.6 değerindeyken verdiği görülmüştür. Yapay sinir ağının ara nöron sayısı 2 olarak seçildiğinde en iyi doğruluk oranını verdiği görülmüştü. 2 nöron ve nu sayısı için bulunan 0.6 değeri kullandığında , yapay sinir ağının daha iyi sonuçlar ürettiği görülmüştür. Nu sayısını verilen değerlere göre doğruluk oranları Grafik 2&#39;de verilmiştir.

Grafik 2. Nu katsayısına göre doğruluk oranları

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/10.png)

**2.2.3 En uygun alfa katsayısını (alfa) bulmaya yönelik testler**

   Alfa katsayısının değerinin tespiti nu katsayısının tespitine benzer bir şekilde 0.1 aralıklar ile alfa değerleri denenmiş ve bu değerlere karşı alfa 0.8 değerindeyken en iyi sonucu verdiği görülmüştür. Alfa sayısını verilen değerlere göre doğruluk oranları Grafik 3&#39;te verilmiştir.

Grafik 3. alfaya göre doğruluk oranları

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/11.png)
 

**2.2.4 Hata miktarı ve epock sayısı**

   Belirlenen nöron sayısı , alfa değeri ve nu sayısının değeri ile yapay sinir ağı çalıştırıldığında 4558 epock ve 0.0068 hata ile eğitimini tamamlamıştır. Eğitim sonucunda yapılan testlerde %91.6800 doğruluk oranı ile test tamamlamıştır.

**2.2.5 Yapay Sinir Ağındaki Giriş ve Çıkış Formatları**

   Kullanılan veri setine bağlı olarak Yapay sinir ağı 4 giriş olarak tasarlandı. Veri seti üzerinde giriş için belirlenen öz nitelikler left-weight, left-distance, right-weight, right-distance öznitelikleridir ve bu öznitelikler 1 ile 5 arasında tam sayı değerleri almaktadır. Giriş için kullanılan özniteliklerin değerleri üzerinde herhangi bir düzenleme yapılmamıştır.  Ancak Çıkış değerleri için kullanılan L,B,R değerleri ikili tabanda ifade edilerek sayısal veriler üzerinde işlem yapma olanağı tanınmıştır. B çıkışı için 11, L çıkışı için 10 ve R çıkışı için 01 değeri kullanılmıştır.

**2.2.6 Verinin İşlenebilir duruma getirilmesine yönelik çalışmalar**

   2.1. inci bölümde kullanılan veri tabanı hakkında genel bilgiler verilmişti. Bu bölümde de kullanılan veri tabanının içerisindeki verilerin işlenebilir hale getirilmesi için yapılan çalışmalardan adım adım bahsedilecektir. Veri Seti içerisinde 625 örnek bulunmakta ve bu örnekler 5 adet öz niteliğe sahiptir. Görsel 4 &#39;te Veri setinin hiç işlenmemiş hali verilmiştir. Görsel üzerinden de anlaşılacağı üzere B,L,R öznitelikleri çıkışları ve diğer 4 öznitelik girişleri ifade etmektedir.

Görsel 4. Veri setinin hiç işlenmemiş hali

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/12.png)
 
   Veri setinin işlenebilir hale getirilmesi için yapılan ilk çalışma veri setinde tek sütun olarak verilen öz niteliklerin farklı sütunlarda ayrıştırılmasıdır. Bu işleme ait ekran görüntüsü Görsel 5&#39;de gösterilmiştir.

Görsel 5. Veri setinde verilen öz niteliklerin farklı sütunlarda ayrıştırılması

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/13.png)

 Veri setindeki öznitelikleri ayrıştırma işleminden sonra yapay sinir ağına sunulması için veriler eğitim, test ve bu veriler için hedef veriler yapay sinir ağı için tasarlanan kod yapısına göre düzenlenmiştir. Eğitim ve Test verilerinin son hali Görsel 6&#39;da gösterilmiştir.

Görsel 6. Veri setinde giriş değerlerinin kod yapısına göre düzenlenmesi

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/14.png)
 
Son olarak veri seti üzerinde çıkışlar için düzenlemeler yapılmıştır. L çıkışı için ikilik tabanda 10, R çıkışı için ikilik tabanda 01 ve B çıkışı için ikilik tabanda 11 ifadeleri kullanılarak veri seti yapay sinir ağı için hazırlanan kod yapısına göre düzenlenmiştir. Hedef verilere ait ekran görüntüsü Görsel 7&#39;de gösterilmiştir.

Görsel 7. Hedef veriler

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/15.png)
 

**2.2.7 Normalizasyon**

   Veri seti küçük verilerden oluştuğu için ilk başta normalizasyon yapılmadan ağ eğitilmiş ve yapılan testler sonucunda %88 ye varan doğruluk oranı ile test işlemi tamamlanmıştır. Normalizasyon yapılmadan iyileştirmeler yapılarak yapay sinir ağı şuan ki duruma yani %91,68 oranında doğru tahmin edilmesi sağlanmıştır. Normalizyon yapıldığı durumda ise yapay sinir ağının doğru tahmin oranı %72 değerini almıştır ve normalizasyon yapılması durumunda çıkışlarda oluşan değerler bir birine çok yakın çıktığı görülmüştür. Çıkışlarda oluşan değerler bir birine çok yakın çıkmasından dolayı çıkış belirleme güçleşmiş ve ağın doğru tahmini zorlaşmıştır. Bu yüzden normalizasyon yapılmadan ağ eğitilmiştir. Görsel 8 normalizasyon yapılmadan ve Görseş 9&#39;da normalizsayon yapılarak çıkışlarda oluşan değerler verilmiştir. Görsellerde de görüldüğü gibi normalizasyon yapılmadığı durumda çıkışlar daha keskin değerler ile bir birinden ayrılmaktadır. Normalizasyon yapıldığı durumda ise çıkış belirleme durumunda net bir koşul konulamayacağından dolayı yapay sinir ağında veriler üzerinde normalizson işlemi yapılmadan işlem eğitim yapılmıştır.

 ![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/16.png)

**2.2.8 Yapay Sinir Ağının Çıkışlarının Belirlenmesi**

   Eğitim işleminin bitmesinin ardından test işleminde her bir çıkış ve çıkması gereken hedef değerleri karşılaştırılarak yapay sinir ağının çıkışları için karar yapısı oluşturulmuştur. Görsel 8 &#39;de de görüldüğü gibi R yani 01 olması gerek değerler için op2 çıkış 0,99 , L yani 10 olması gereken  değerler için op1 çıkışı 0,99 değerine yakın değerler bulunmuş ve B olması gereken yani 11 olması gereken durumlar içinde op1 ve op2 çıkışları bir birine yakın değerlerden oluşmuştur. Bu gözlemlerden yola çıkarak çıkışlar için aşağıdaki Görsel 10&#39;daki gibi bir koşul konulmuştur. Bu koşul için yazılmış kod parçası Görsel 11&#39;de gösterilmiştir.

![alt text](https://github.com/HamzaTas/Neural-Network-Balance-Scale/blob/master/ss/17.png)
 
**2.2.9 Veri Seti Üzerinde Eğitim ve Test Verilerin Belirlenmesi**

   Kullanılan veri seti 1 ile 5 arasında terazinin sol ağırlığı , sol kol uzunluğu, sağ ağırlığını ve sağ kol uzunluğunu ifade eden özniteliklerin değerlerini içeren bir veri setidir. Ve 1 ile 5 arasında her bir denge çıkışı için olasılıklar kullanılmıştır. Bu yüzden yapay sinir ağının daha iyi öğrenebilmesi için veri seti üzerinde herhangi bir parçalama yapılmamıştır. Veri setindeki tüm değerler eğitimde kullanılmıştır. Aynı şekilde test işleminde de veri seti üzerinde herhangi bir parçalama yapılmadığı için aynı veri seti test seti olarak ta kullanılmıştır. Ağın eğitimi tamamlandıktan sonra veri seti üzerindeki ilk 100 kayıt alınarak tekrar test edilmiş ve ilk 100 kayıt için %100 doğruluk oranı ile çıkışı tahmin etmiştir.

#### 3. SONUÇ

   Bu çalışmada, edinilen veri tabanı kullanılarak yapay sinir ağları ile bir terazinin denge durumu tahmin mekanizması oluşturulmuştur. Veri tabanındaki her bir örneğe ait öznitelik değerleri oluşturulan yapay sinir ağının girişlerine verilmiş ve hata oranı belli bir seviyenin altına inene kadar geri besleme yapılarak ağ eğitilmiştir. Eğitim sırasında 625 örneğin tamamı kullanılmıştır. Yine aynı şekilde test aşamasında da 625 örnek için yapay sinir ağı test edilmiştir. Eğitim ve testte kullanılan örneklerin 288 tanesi L , 288 tane R ve 49 tanesi B sınıflarına aittir. Ağın başarısı çoğu zaman %85&#39;in üzerinde çıkmış ve yeniden ağırlıklandırılarak defalarca denenmiş ve en iyi sonucu ağırlık ve bias değerlerine 0 verildiği durumda çıktığı görülmüştür. Ağın en iyi başarı oranı 2 nöron kullanılarak, nu değerini 0.6 ve alfa değerini 0.8 alındığında %91.68 değeri ile çıktığı gözlemlenmiştir.
