import 'package:flutter/material.dart';
import 'dart:async';
import 'getir.dart';

class HomePage extends StatefulWidget {
  @override
  _AppBarWithArrowState createState() => _AppBarWithArrowState();
}

class _AppBarWithArrowState extends State<HomePage> {
  final List<String> imagePaths = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
  ];

  final List<String> categories = [
    "getirbüyük",
    "getiryemek",
    "getirçarşı",
    "getiralışveriş",
    "getirsu",
    "getiriş",

  ];

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);


    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("  adresiniz  "),
            SizedBox(width: 5),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Slider
          SizedBox(
            height: 260,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: ClipRRect(
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

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => getir()),
                      );
                    },
                    child: Container(
                      height: 170,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "getir",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Getir Finans tıklandı!")),
                      );
                    },
                    child: Container(
                      height: 170,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "getirfinans",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Küçük kategoriler
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Bir satırda 2 kutu
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 75, // Her kutunun yüksekliği
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${categories[index]} tıklandı!"),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

