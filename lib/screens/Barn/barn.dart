import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'components/MyHeader.dart';
import 'components/MyBody.dart';
class Barn extends StatefulWidget {
  const Barn({Key? key}) : super(key: key);

  @override
  State<Barn> createState() => _BarnState();
}

class _BarnState extends State<Barn> {
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
