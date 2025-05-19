import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ekranın sağ üst kısmında yazan debug kısmını kaldırır
      title: 'Deprem', // Başlık kısmı
      home: const MyHomePage(title: 'Son Deprem'), // App barın Son depremler isimli başlık kısmı
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});
// Final değişkeni sabit veri listesi
final depremListesi = const [ // final değişkeni sadece bir kere atanır bidaha değiştirilemez.
  {'sehir': 'Malatya, Türkiye', 'bolge': 'Eastern Turkiye', 'zaman': '39 Dakika önce', 'saat': '18:00', 'siddet': '1.23'},
  {'sehir': 'İzmir, Türkiye', 'bolge': 'Western Turkiye', 'zaman': '20 Dakika önce', 'saat': '18:20', 'siddet': '2.10'},
  {'sehir': 'Hatay, Türkiye', 'bolge': 'Southern Turkiye', 'zaman': '19 Dakika önce', 'saat': '17:30', 'siddet': '3.45'},
  {'sehir': 'Ankara, Türkiye', 'bolge': 'Central Anatolia', 'zaman': '42 Dakika önce', 'saat': '16:30', 'siddet': '2.80'},
  {'sehir': 'Van, Türkiye', 'bolge': 'Eastern Anatolia', 'zaman': '12 Dakika önce', 'saat': '15:10', 'siddet': '4.10'},
  {'sehir': 'Antalya, Türkiye', 'bolge': 'Mediterranean Region', 'zaman': '15 Dakika önce', 'saat': '18:30', 'siddet': '1.90'},
  {'sehir': 'Erzurum, Türkiye', 'bolge': 'Eastern Anatolia', 'zaman': '45 Dakika önce', 'saat': '17:50', 'siddet': '3.20'},
  {'sehir': 'Çanakkale, Türkiye', 'bolge': 'Marmara Region', 'zaman': '10 Dakika önce', 'saat': '18:35', 'siddet': '2.75'},
  {'sehir': 'Trabzon, Türkiye', 'bolge': 'Black Sea Region', 'zaman': '15 Dakika önce', 'saat': '18:45', 'siddet': '1.50'},
  {'sehir': 'Bursa, Türkiye', 'bolge': 'Marmara Region', 'zaman': '30 Dakika önce', 'saat': '17:40', 'siddet': '2.60'},
  {'sehir': 'Sakarya, Türkiye', 'bolge': 'Marmara Region', 'zaman': '25 Dakika önce', 'saat': '17:55', 'siddet': '3.00'},
  {'sehir': 'Aydın, Türkiye', 'bolge': 'Western Turkiye', 'zaman': '50 Dakika önce', 'saat': '16:10', 'siddet': '2.20'},
];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // scaffold kullanmamın sebebi ekranın yapısının dağılmaması için
      appBar: AppBar(   // app barın yani Üst kısım kodları 
        backgroundColor: Colors.orange, // appbarın arkaplanı değiştirme
        title: const Text('Son Depremler'),
        actions: [  // actions wigetlerin içine birden fazla işlem  button ikon text vs eklemek için kullanılır
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),


      backgroundColor: Colors.black,// Ana  sayfanın Arka plan rengini ayarlar
      body: ListView.builder(   //Listeleme kısmı kodları // sonsuz uzunlukta liste yapar
        padding: const EdgeInsets.all(16), // tüm kenarlardan eşit miktarda boşluk ekler
        itemCount: depremListesi.length, // itemcount ksç ise listeyi o kadar itemBuilder fonksiyonu çalışır.
        itemBuilder: (context, index) {//yukarıda oluşturduğumuz listeyi alıyoruz
          final deprem = depremListesi[index];//Deprem listesinden verileri alıyoruz
          return Padding( // Widgetın kenarlarından içeriye boşluk bırak
            padding: const EdgeInsets.symmetric(vertical: 8),// yatay ve dikey boşlukları ayrı ayrı vermek için kullanılır
            child: Row( //row kullanma nedenim herşey yan yana dizilmesi
              crossAxisAlignment: CrossAxisAlignment.start, //üstten hizalama
              children: [
  
                Image.asset('assets/turkey.png', width: 36, height: 36),//Türk Bayrağını ekler Görselinin yüksekliği ve genişliği
                const SizedBox(width: 12),//Türk Bayrağı ile metin arasına boşluk ekler
                Column(//şehir ve bölge bilgilerini tutan kısım ve column kullanma amacım herşeyin alt alta dizilmesi
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Deprem bilgilerini tutan kısım
                    Text(deprem['sehir']!, style: const TextStyle(fontSize: 16, color: Colors.white)),
                    Text(deprem['bolge']!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const Spacer(), // Spacer 
                Column(   // saat ve zaman bilgilerini tutan kısım
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deprem['zaman']!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 2),
                    Text(deprem['saat']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(width: 15),
                Container( // kırmızı şiddet bilgisini tutan kısım
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // horizontal sağdan ve soldan 8 boşluk bırakır, vertical üstten ve alttan 4 boşluk bırakır
                  decoration: BoxDecoration( //container tasarımı
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(15), // tüm köşelerden 15 birim boşluk bırakmaya yarar
                  ),
                  child: Text(
                    deprem['siddet']!, // Burdaki Ünlem NUll olmaz boş değer olmaması için
                    style: const TextStyle(color: Colors.white, fontSize: 14), // widget’ın metinini düzenler // stili değiştirilemez yapıyor
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
