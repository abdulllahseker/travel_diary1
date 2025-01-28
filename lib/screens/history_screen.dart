import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Örnek Seyahat Verileri
  final List<Map<String, String>> trips = [
    {
      'title': 'Paris',
      'date': '2023-10-01',
      'amount': '1500 \$',
      'image': 'assets/images/paris.jpg',
    },
    {
      'title': 'Tokyo',
      'date': '2023-07-15',
      'amount': '1800 \$',
      'image': 'assets/images/tokyo.jpg',
    },
    {
      'title': 'London',
      'date': '2022-12-01',
      'amount': '2000 \$',
      'image': 'assets/images/london.jpg',
    },
    {
      'title': 'New York',
      'date': '2023-05-20',
      'amount': '2200 \$',
      'image': 'assets/images/new_york.jpg',
    },
  ];

  String _getTimeAgo(String date) {
    final dateTime = DateTime.parse(date);
    final difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} yıl önce';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} ay önce';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} gün önce';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} dakika önce';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 241, 152, 18), // Başlık çubuğu rengi
        title: const Text(
          "Geçmiş Seyahatlerim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: trips.length,
          itemBuilder: (context, index) {
            final trip = trips[index];
            final timeAgo = _getTimeAgo(trip['date']!);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        trip['image']!,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        trip['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Harcanan Tutar: ${trip['amount']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        timeAgo,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Geçmiş sayfası seçili
        onTap: (index) {
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
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Keşfet',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Geçmiş',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
            backgroundColor: Colors.orange,
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 253, 157, 32),
        unselectedItemColor: const Color.fromARGB(198, 68, 66, 66),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
