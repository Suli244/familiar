import 'package:familiar/core/image/app_images.dart';
import 'package:familiar/screen/bottom_navigator/bottom_naviator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    toGoOnBoarFamiliar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.logo,
              width: 180.w,
              height: 180.w,
            ),
          ),
        ],
      ),
    );
  }

  toGoOnBoarFamiliar() async {
    await Future.delayed(const Duration(milliseconds: 1650));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavigatorScreen(),
      ),
    );
  }
}
