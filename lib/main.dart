import 'package:flutter/material.dart';
import 'package:flutter_app/core/routes.dart' show router;

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter widget'larını başlat
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        brightness: Brightness.light, // Açık mod teması
        primarySwatch: Colors.orange, // Ana renk turuncu
        appBarTheme: const AppBarTheme(
          color: Colors.orange, // AppBar rengi
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.orange, // BottomNavigationBar arka planı
          selectedItemColor:
              Color.fromARGB(255, 253, 157, 32), // Seçili item rengi
          unselectedItemColor:
              Color.fromARGB(198, 68, 66, 66), // Seçili olmayan item rengi
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Karanlık mod teması
        dialogBackgroundColor: const Color.fromARGB(
            255, 255, 198, 43), // Ana renk turuncu tonlarında
        scaffoldBackgroundColor: Colors.black, // Karanlık modda arka plan siyah
        appBarTheme: const AppBarTheme(
          color: Colors.black, // AppBar rengi
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black, // BottomNavigationBar arka planı
          selectedItemColor:
              Color.fromARGB(255, 253, 157, 32), // Seçili item rengi
          unselectedItemColor: Colors.white70, // Seçili olmayan item rengi
        ),
      ),
      themeMode: ThemeMode.system, // Cihazın sistem temasına göre tema değişir
      routerConfig: router, // go_router yapılandırmamızı kullan
      debugShowCheckedModeBanner: false, // Debug bandını kaldır
    );
  }
}
