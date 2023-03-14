import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controllers.dart';
import 'package:smartsystem/constans.dart';
import 'package:smartsystem/components/Temperature_B.dart';
import 'package:smartsystem/components/TemperatureSc_B.dart';
import 'barncontroller.dart';
class Mybody extends StatefulWidget {
  const Mybody({Key? key}) : super(key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: kSecondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:screenWidth < 900 ? 20 : 80),
                    Temperature_up_B(),
                    SizedBox(height: 30,),
                    TemperatureSc_B(),
                    SizedBox(height: 30),
                    Contollers(),
                    screenWidth < 900 ? BarnController() : Container()
                  ],
                ),
              ),
            ),
            screenWidth < 900 ?
            Container() :
            Expanded(
              flex: 1,
              child:   BarnController()
              ),
          ],
        ),
    );
  }
}
