import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'package:smartsystem/screens/Barn/barn.dart';
import 'package:smartsystem/screens/Farm/farm.dart';
import 'package:smartsystem/screens/Home/home.dart';
import 'package:smartsystem/screens/Welcomescreen/Welcomescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedinext = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: IndexedStack(
        index: selectedinext,
        children: [
          Home(),
          Barn(),
          Farm(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: kTextColor,
          currentIndex: selectedinext,
          backgroundColor: kPrimaryColor,
          onTap: onTaped,
          items: [
            BottomNavigationBarItem(
                label: '홈', icon: Icon(CupertinoIcons.home, size:screenWidth < 900 ? 30.0 : 40.0)),
            BottomNavigationBarItem(
                label: '죽사', icon: Icon(CupertinoIcons.wrench, size: screenWidth < 900 ? 30.0 : 40.0)),
            BottomNavigationBarItem(
                label: '팜', icon: Icon(CupertinoIcons.bell, size: screenWidth < 900 ? 30.0 : 40.0)),
          ]),
    );
  }

  void onTaped(int value) {
    setState(() {
      selectedinext = value;
    });
  }
}
