import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Alt menüdeki seçili sekme

  // Alt menüdeki sekmeler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Menüye tıklandığında uygun sayfaya gitmek
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/history');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 235, 190, 124), // Turuncu arka plan
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 241, 152, 18), // Başlık çubuğu rengi
        title: const Text(
          "TRAVEL DİARY",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Görsel Başlık
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/logo.webp', // Logo veya görsel
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Hoşgeldiniz yazısı ve simgeler
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Hoşgeldiniz",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Hızlı Erişim Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHomeButton(context, "Geçmiş Seyahatlerim", "/history"),
                _buildHomeButton(context, "Yeni Ülke Keşfet", "/search"),
              ],
            ),

            const SizedBox(height: 20),

            // Popüler Seyahatler Kartları
            const Text(
              "Popüler Seyahatler",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildDestinationCard("Paris", "assets/images/paris.jpg"),
                  _buildDestinationCard("Tokyo", "assets/images/tokyo.jpg"),
                  _buildDestinationCard("london", "assets/images/london.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),

      // Alt Menü
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
            backgroundColor: Colors.orange, // Uygulama rengiyle uyumlu
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Keşfet',
            backgroundColor: Colors.orange, // Uygulama rengiyle uyumlu
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Geçmiş',
            backgroundColor: Colors.orange, // Uygulama rengiyle uyumlu
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
            backgroundColor: Colors.orange, // Uygulama rengiyle uyumlu
          ),
        ],
        selectedItemColor:
            const Color.fromARGB(255, 253, 157, 32), // Seçilen ikona beyaz renk
        unselectedItemColor: const Color.fromARGB(
            198, 68, 66, 66), // Seçilmeyen ikonlar biraz daha soluk
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Hızlı Erişim Butonları
  Widget _buildHomeButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () {
        context.go(route); // Yönlendirme
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Popüler Seyahat Kartları
  Widget _buildDestinationCard(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: 200,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
