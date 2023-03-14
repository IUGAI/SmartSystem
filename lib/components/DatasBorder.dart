import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';

class DatasBorder extends StatelessWidget {
  const DatasBorder(
      {Key? key, required this.title, required this.textV, required this.icon})
      : super(key: key);

  final String title;
  final String textV;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title, style: TextStyle(color: kPrimaryColor, fontSize: 20), textAlign: TextAlign.start,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(textV,
                style: screenWidth < 800 ? ktextstylesensors_mobile :  textstylesenseors),
            icon,
          ],
        )
      ],
    );
  }
}
