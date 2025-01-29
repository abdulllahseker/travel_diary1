import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Yönlendirme için

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: ThemeData(
        brightness: Brightness.light, // Açık mod
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 253, 152, 20),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.black54,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Açık modda siyah yazı
          bodyMedium: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Karanlık mod
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 55, 55, 55),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF303030),
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
        ),
        textTheme: const TextTheme(
          bodyLarge:
              TextStyle(color: Colors.white), // Karanlık modda beyaz yazı
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system, // Sistemin tema ayarına göre mod seçimi
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Başlangıçta 'Profile' sekmesi seçili
  bool isDarkMode = false; // Karanlık mod kontrolü

  // Sekme tıklama fonksiyonu
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Burada ilgili ekranın yönlendirmesini yapabilirsiniz.
    if (index == 0) {
      // Home ekranına gitmek için:
      context.go('/home');
    } else if (index == 1) {
      // Search ekranına gitmek için:
      context.go('/search');
    } else if (index == 2) {
      // Geçmiş seyahatlerim ekranına gitmek için:
      context.go('/history');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xFF303030) // Karanlık mod için arka plan
          : const Color.fromARGB(255, 255, 204, 137), // Açık mod için arka plan
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 55, 55, 55) // Karanlık mod için app bar
            : const Color.fromARGB(255, 253, 152, 20), // Açık mod için app bar
        title: const Text('Abdullah Şeker'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.sunny : Icons.nightlight_round),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode; // Karanlık mod aç/kapat
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildProfilePhoto(),
            const SizedBox(height: 20),
            _buildUserInfo(),
            const SizedBox(height: 20),
            _buildActiveVisa(),
            const SizedBox(height: 20),
            _buildVisitedCountries(),
            const SizedBox(height: 20),
            _buildGallery(),
            const SizedBox(height: 20),
            _buildBudget(),
            const SizedBox(height: 20),
            _buildTargetCountries(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
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
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.orangeAccent, // Seçili ikon turuncu
        unselectedItemColor: Colors.black54, // Seçili olmayan ikonlar siyah
        backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.white,
        elevation: 10,
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Center(
      child: CircleAvatar(
        radius: 60,
        backgroundImage:
            AssetImage('assets/images/erkek.jpg'), // Profil fotoğrafı
      ),
    );
  }

  Widget _buildUserInfo() {
    return Card(
      elevation: 5,
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: ListTile(
        leading:
            Icon(Icons.account_circle, size: 50, color: Colors.orangeAccent),
        title: const Text('Kullanıcı Adı: Abdullah Şeker',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: const Text('Email: abdullah@example.com',
            style: TextStyle(fontSize: 16)),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }

  Widget _buildActiveVisa() {
    return Card(
      elevation: 5,
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: ListTile(
        leading: Icon(Icons.airplane_ticket, size: 50, color: Colors.green),
        title: const Text('Aktif Vize Durumu',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Amerika Vizesi - Kalan Süre: 4 Ay',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }

  Widget _buildVisitedCountries() {
    return Card(
      elevation: 5,
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: ListTile(
        leading: Icon(Icons.location_on, size: 50, color: Colors.orange),
        title: const Text('Gezilen Ülkeler',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('• Fransa (2019, Harcama: 10.000 TL)',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            Text('• Almanya (2021, Harcama: 12.500 TL)',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            Text('• Japonya (2022, Harcama: 18.000 TL)',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          ],
        ),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }

  Widget _buildGallery() {
    return Card(
      elevation: 5,
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Gezilen Ülkelerden Fotoğraflar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildGalleryItem('assets/images/paris.jpg'),
                _buildGalleryItem('assets/images/tokyo.jpg'),
                _buildGalleryItem('assets/images/newyork.webp'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          width: 120,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBudget() {
    return Card(
      elevation: 5,
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: ListTile(
        leading: Icon(Icons.attach_money, size: 50, color: Colors.purple),
        title: const Text('Toplam Harcama',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Toplam Harcama: 40.500 TL',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }

  Widget _buildTargetCountries() {
    return Card(
      elevation: 5,
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      child: ListTile(
        leading: Icon(Icons.flag, size: 50, color: Colors.blue),
        title: const Text('Hedef Ülkeler',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('• İtalya',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            Text('• Kanada',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            Text('• Yeni Zelanda',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          ],
        ),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }
}
