import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gass_in/Views/splash_page.dart';
import 'package:provider/provider.dart';

import 'Provider/auth_provider.dart';
import 'Provider/driver_provider.dart';

Future<void> main() async {
  //digunakan untuk menghilangkan status bar pada bagian atas hp
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // digunakan untuk menyambungkan ke firebase
  await Firebase.initializeApp();
  runApp(

    //fungsinya mendaftarkan provider yang digunakan pada projek
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => DriverProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //tema untuk mengatur keseluruhan font, warna, dan ukuran text
      theme: ThemeData(
        fontFamily: "TT Norm Pro",
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashOnePage(),
    );
  }
}
