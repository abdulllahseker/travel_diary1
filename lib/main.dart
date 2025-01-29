import 'package:flutter/material.dart';
import 'package:flutter_app/core/routes.dart' show router;

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter widget'larını başlat
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Tema modunun kontrolü için ValueNotifier kullanıyoruz
  final ValueNotifier<ThemeMode> _themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  void dispose() {
    _themeNotifier.dispose(); // State'i temizle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp.router(
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          themeMode: themeMode, // Burada tema modunu ayarlıyoruz
          routerConfig: router,
          debugShowCheckedModeBanner: false, // Debug bandını kaldır
        );
      },
    );
  }
}
