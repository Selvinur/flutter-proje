import 'package:flutter/material.dart';

class getir extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
  ];

  final List<String> categoryNames = [
    "İndirimler",
    "Çok Al, Az Öde",
    "Bana Özel",
    "Şımart Kendini",
    "Su & İçecek",
    "Coca-Cola",
    "Gol Olur",
    "Eti Lezzetl",
    "Atıştırmalık",
    "Meyve & Sebze",
    "Süt Ürünleri",
    "Fırından",
    "Dondurma",
    "Temel Gıda",
    "Et, Tavuk",
    "Kahvaltılık",
    "Yiyecek",
    "Fit & Form",
    "Kişisel Bakım",
    "Ev Bakım",
    "Ev & Yaşam",
    "Evcil Hayvan",
    "Bebek",
    "Cinsel Sağlık",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // AppBar
            SliverAppBar(
              backgroundColor: Colors.purple,
              pinned: true,
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'getir',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Adres kısmı
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("adres ekleyiniz")),
                  );
                },
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          " adresiniz ",
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Slider
            SliverToBoxAdapter(
              child: SizedBox(
                height: 260, // Slider yüksekliği
                child: PageView.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ];
        },
        body: GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Her satırda 4 kare
            crossAxisSpacing: 8.0, // Kareler arası yatay boşluk
            mainAxisSpacing: 8.0, // Kareler arası dikey boşluk
            childAspectRatio: 1.0, // Kare oranı
          ),
          itemCount: categoryNames.length, // Kategori listesine göre kare sayısı
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categoryNames[index], // Kategorinin adı
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
