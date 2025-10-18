import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/presentation/login/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 360.0),
              duration: const Duration(seconds: 4),
              builder: (context, value, child) {
                return Transform.rotate(
                  alignment: Alignment.center,
                  angle: (value) * pi / 180,
                  child: SvgPicture.asset("assets/images/singleiconWhite.svg"),
                );
              },
            ),
            SizedBox(height: 25),
            Text(
              "Trendy App",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
