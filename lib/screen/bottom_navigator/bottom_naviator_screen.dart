import 'package:familiar/core/image/app_images.dart';
import 'package:familiar/screen/page/home/home_screen.dart';
import 'package:familiar/screen/page/saved/saved_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        currentIndex: index,
        onTap: (indexFrom) async {
          setState(() {
            index = indexFrom;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.homeIcon,
              width: 26,
              color: const Color.fromARGB(255, 105, 106, 110),
            ),
            activeIcon: Image.asset(
              AppImages.homeIcon,
              color: Colors.white,
              width: 26,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.savedIcon,
              width: 20,
              color: const Color.fromARGB(255, 105, 106, 110),
            ),
            activeIcon: Image.asset(
              AppImages.savedIcon,
              color: Colors.white,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const HomeScreen(),
  const SaveScreen(),
];
