import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Yönlendirme için

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Başlangıçta 'Profile' sekmesi seçili

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
      backgroundColor: const Color.fromARGB(255, 255, 204, 137),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 152, 20),
        title: const Text('Abdullah Şeker'),
        centerTitle: true,
        actions: [],
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
        backgroundColor: Colors.white,
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
      child: ListTile(
        leading: Icon(Icons.airplane_ticket, size: 50, color: Colors.green),
        title: const Text('Aktif Vize Durumu',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Amerika Vizesi - Kalan Süre: 4 Ay'),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }

  Widget _buildVisitedCountries() {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.location_on, size: 50, color: Colors.orange),
        title: const Text('Gezilen Ülkeler',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('• Fransa (2019, Harcama: 10.000 TL)'),
            Text('• Almanya (2021, Harcama: 12.500 TL)'),
            Text('• Japonya (2022, Harcama: 18.000 TL)'),
          ],
        ),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }

  Widget _buildGallery() {
    return Card(
      elevation: 5,
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
      child: ListTile(
        leading: Icon(Icons.attach_money, size: 50, color: Colors.purple),
        title: const Text('Toplam Harcama',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Toplam Harcama: 40.500 TL'),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }

  Widget _buildTargetCountries() {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.flag, size: 50, color: Colors.blue),
        title: const Text('Hedef Ülkeler',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('• İtalya'),
            Text('• Kanada'),
            Text('• Yeni Zelanda'),
          ],
        ),
        trailing: Icon(Icons.edit, color: Colors.orangeAccent),
      ),
    );
  }
}
