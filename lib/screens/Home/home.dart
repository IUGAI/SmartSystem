import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'components/Myheader.dart';
import 'components/Mybody.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: kSecondaryColor,
          child: ListView(
            children: [
              SizedBox(height: 10),
              MyHeader(),
              SizedBox(height: 10),
              Mybody()
            ],
          ),
        ),
      ),
    );
  }
}
