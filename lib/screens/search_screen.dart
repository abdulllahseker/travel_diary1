import 'package:flutter/material.dart';
import 'package:flutter_app/screens/history_screen.dart';

// Yeni Sayfalar
import 'home_screen.dart';
import 'profile_screen.dart';
// ignore: duplicate_import
import 'history_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1; // SearchScreen varsayılan olarak seçili

  // BottomNavigationBar için sekme seçim fonksiyonu
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Sekme seçimine göre yönlendirme
    switch (index) {
      case 0:
        // Home Sayfasına Git
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        // Search Sayfasına Git (mevcut sayfa)
        break;
      case 2:
        // profil Sayfasına Git
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoryScreen()),
        );
        break;
      case 3:
        // Profile Sayfasına Git
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent, // Sıcak renkler
        title: const Text(
          'TRAVEL DIARY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Başlık ortada
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color:
                  const Color.fromARGB(255, 252, 165, 52)), // Geri ok simgesi
          onPressed: () {
            Navigator.pop(context); // Bu sadece önceki sayfaya döner
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade100,
              Colors.orange.shade300
            ], // Sıcak tonlar
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  const SizedBox(height: 30),
                  _buildCityCard('Paris', 'assets/images/paris.jpg'),
                  const SizedBox(height: 20),
                  _buildCityCard('Tokyo', 'assets/images/tokyo.jpg'),
                  const SizedBox(height: 20),
                  _buildCityCard('New York', 'assets/images/newyork.webp'),
                  const SizedBox(height: 20),
                  _buildCityCard('London', 'assets/images/london.jpg'),
                ],
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar ekleniyor
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Seçili sekme
        onTap: _onItemTapped, // Tıklanabilir sekme fonksiyonu
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.orangeAccent, // Seçili item rengi
        unselectedItemColor: Colors.black54, // Seçili olmayan item rengi
      ),
    );
  }

  // Arama çubuğunu yapalım
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'İstediğiniz ülke hakkında bilgi alın...',
          hintStyle:
              TextStyle(color: Colors.orange.shade700), // Renk sıcak tonlarda
          prefixIcon: Icon(Icons.search, color: Colors.orangeAccent),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        ),
      ),
    );
  }

  // Şehir kartlarını yapalım
  Widget _buildCityCard(String cityName, String imagePath) {
    return InkWell(
      onTap: () {
        print('Navigating to $cityName');
      },
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Text(
              cityName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset(2, 2), blurRadius: 6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
