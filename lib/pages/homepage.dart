import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_application_2/pages/cartpage.dart';
import 'package:flutter_application_2/pages/notifpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> promoList = [
    {
      "title": "Ayo beli Sedang Promo",
      "subtitle": "Sedang diskon 50%",
      "desc": "Laptop LOQ RTX 350",
      "color": const Color.fromARGB(255, 255, 52, 37),
      "image": "assets/images/buah1.jpg", // Ganti dengan nama gambar Anda
    },
    {
      "title": "Promo Baju Baru",
      "subtitle": "Diskon 70%",
      "desc": "Beli baju kekinian sekarang",
      "color": const Color.fromARGB(255, 160, 28, 165),
      "image": "assets/images/buah2.jpg", // Ganti dengan nama gambar Anda
    },
    {
      "title": "Promo Tas Branded",
      "subtitle": "Diskon 30%",
      "desc": "Tas kualitas terbaik untukmu",
      "color": const Color.fromARGB(255, 57, 189, 79),
      "image": "assets/images/buah2.jpg", // Ganti dengan nama gambar Anda
    },
  ];

  final List<Map<String, dynamic>> produkHorizontal = [
    {"nama": "Sepatu", "harga": "Rp 250.000", "image": "assets/images/sepatu.png"},
    {"nama": "Tas", "harga": "Rp 400.000", "image": "assets/images/tas.png"},
    {"nama": "Baju", "harga": "Rp 150.000", "image": "assets/images/baju.png"},
    {"nama": "Jaket", "harga": "Rp 350.000", "image": "assets/images/jaket.png"},
  ];

  final List<Map<String, dynamic>> produkVertical = [
    {"nama": "Topi", "harga": "Rp 50.000", "image": "assets/images/topi.png"},
    {"nama": "Kemeja", "harga": "Rp 180.000", "image": "assets/images/kemeja.png"},
    {"nama": "Sweater", "harga": "Rp 220.000", "image": "assets/images/sweater.png"},
    {"nama": "Celana Jeans", "harga": "Rp 300.000", "image": "assets/images/jeans.png"},
  ];

  final kategori = ["All", "Laptop", "Mouse", "Keyboard", "Handphone", "Aksesoris"];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DPShope",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 67, 1, 83),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              children: [
                // 🛒 Tombol Cart
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                ),
                const SizedBox(width: 20),

                // 🔔 Tombol Notifikasi
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔍 Search box
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search..",
                ),
              ),
            ),

            // 🟥 Container promo dengan carousel
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: promoList.length,
                      itemBuilder: (context, index) {
                        final promo = promoList[index];
                        return Container(
                          padding: const EdgeInsets.all(20),
                          color: promo["color"] as Color,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      promo["title"].toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      promo["subtitle"].toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      promo["desc"].toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // ✅ Gambar dengan error handling
                              SizedBox(
                                width: 120,
                                height: 150,
                                child: Image.asset(
                                  promo["image"].toString(),
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.white24,
                                      child: const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    // 📍 Indikator halaman
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: promoList.length,
                          effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 8,
                            activeDotColor: Colors.white,
                            dotColor: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Category",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: kategori.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 67, 1, 83),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        kategori[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}