import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          arkaplanrenkim, //const Color.fromARGB(255, 236, 137, 137),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Ortalamak için
          children: <Widget>[
            // Logo bölümü
            Expanded(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/logo.webp',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Yükleniyor yazısı
            //CircularProgressIndicator(),

            // Lottie animasyonu
            InkWell(
              onTap: () => context.go("/home"),
              child: SizedBox(
                width: 400,
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
