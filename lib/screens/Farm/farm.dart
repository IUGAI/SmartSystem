import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'componets/MyBody.dart';
import 'componets/MyHeader.dart';

class Farm extends StatefulWidget {
  const Farm({Key? key}) : super(key: key);

  @override
  State<Farm> createState() => _FarmState();
}

class _FarmState extends State<Farm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: kSecondaryColor,
          child: ListView(
            children: [
              SizedBox(height:  10),
              MyHeader(),
              SizedBox(height:  10),
              Mybody()
            ],
          ),
        ),
      ),
    );
  }
}
