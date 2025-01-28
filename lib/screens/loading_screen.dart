import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA726), // Turuncu rengi
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Ortalamak için
          children: <Widget>[
            // Logo bölümü
            Expanded(
              child: SizedBox(
                width: 200, // Daha büyük bir logo
                height: 200,
                child: Image.asset(
                  'assets/images/logo.webp',
                  fit: BoxFit.contain,
                ),
              ),
            ),

// "Uygulama Hazırlanıyor" yazısı
            const Text(
              "TRAVEL DİARY",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 5.5,
              ),
            ),
            // Yükleniyor yazısı
            const SizedBox(height: 20),

            // Lottie animasyonu
            InkWell(
              onTap: () => context.go("/home"),
              child: SizedBox(
                width: 300,
                child: DotLottieLoader.fromAsset(
                  "assets/motions/loading.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container(); // Eğer animasyon yüklenmediyse boş döner
                    }
                  },
                ),
              ),
            ),

            // Biraz boşluk
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
