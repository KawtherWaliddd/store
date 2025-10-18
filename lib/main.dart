import 'package:flutter/material.dart';

import 'package:store_app/core/services/all_products.dart';
import 'package:store_app/features/presentation/home/views/home_screen.dart';
import 'package:store_app/features/presentation/update_product/view/update_screen.dart';
import 'package:store_app/features/presentation/login/views/login_screen.dart';
import 'package:store_app/features/presentation/splash/view/splash_screen.dart';

void main() {
  runApp(const FashionApp());
  AllProducts().getAllProducts();
}

class FashionApp extends StatelessWidget {
  const FashionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        UpdateScreen.id: (context) => UpdateScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
