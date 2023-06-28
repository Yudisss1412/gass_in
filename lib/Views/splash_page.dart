import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gass_in/Views/sign_up_page.dart';
import 'package:gass_in/constant.dart';


//SplahOnePage adalah splashscreen bagian satu
class SplashOnePage extends StatefulWidget {
  const SplashOnePage({super.key});

  @override
  State<SplashOnePage> createState() => _SplashOnePageState();
}

class _SplashOnePageState extends State<SplashOnePage> {
  //digunakan untuk berpindah halaman secara otomatis setelah 3 detik
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SplashTwoPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green3,
      body: InkWell(
        onDoubleTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashTwoPage(),
              ));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Union.png"),
              const SizedBox(
                height: 10,
              ),
              const Text.rich(
                TextSpan(
                  text: "Gass",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 60.5),
                  children: [TextSpan(text: "IN", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 60.5))],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


//SplashTwoPage merupakan splashscreen bagian dua
class SplashTwoPage extends StatefulWidget {
  const SplashTwoPage({super.key});

  @override
  State<SplashTwoPage> createState() => _SplashTwoPageState();
}

class _SplashTwoPageState extends State<SplashTwoPage> {
  //digunakan untuk berpindah halaman secara otomatis setelah 3 detik
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onDoubleTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpPage(),
              ));
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
