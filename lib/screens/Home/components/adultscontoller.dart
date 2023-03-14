import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'adultcontollerheader.dart';
import 'adultcontollerstate.dart';

class AdultContriller extends StatefulWidget {
  const AdultContriller({Key? key}) : super(key: key);

  @override
  State<AdultContriller> createState() => _AdultContrillerState();
}

class _AdultContrillerState extends State<AdultContriller> {

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: screenWidth > 900 ? EdgeInsets.only(right: 20,left: 20) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: kbgcolor
      ),
      child: Column(
        children: [
          Adultcontollerheader(),
          Adultcontollerstate()
        ],
      ),
    );
  }
}
