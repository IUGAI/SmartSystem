import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'package:smartsystem/network.dart';
import 'package:smartsystem/components/DatasBorder.dart';

class Temperature_up extends StatefulWidget {
  const Temperature_up({Key? key}) : super(key: key);


  @override
  State<Temperature_up> createState() => _Temperature_upState();
}

class _Temperature_upState extends State<Temperature_up> {
  String? temp;
  String? solid;

  void initState() {
    // TODO: implement initState
    getdatas();
    super.initState();
  }
  void getdatas() async {
    var weatherdata = await Networksenddata().getalldata('home','data');
    temp = weatherdata['value1'];
    solid = weatherdata['value4'];
    print(weatherdata);
  }
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            border: Border.all(
                color: Colors.black, width: 1, style: BorderStyle.solid)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DatasBorder(
                title: '실내 온도',
                textV: '${temp?.substring(0,2)}°C',
                icon: Icon(CupertinoIcons.thermometer,
                    color: kPrimaryColor, size: 50)),
            DatasBorder(
                title: '외부 온도',
                textV: '$solid°C',
                icon: Icon(CupertinoIcons.thermometer, color: kPrimaryColor, size: 50)),
          ],
        ));
  }
}


