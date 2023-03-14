import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/network.dart';
import 'package:smartsystem/constans.dart';
import 'DatasBorder.dart';

class Temperature_up_F extends StatefulWidget {
  const Temperature_up_F({Key? key}) : super(key: key);

  @override
  State<Temperature_up_F> createState() => _Temperature_upState();
}

class _Temperature_upState extends State<Temperature_up_F> {

  String? temp;
  String? solid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }

  void getdatas() async {
    var weatherdata = await Networksenddata().getalldata('farm', 'data');
    temp = weatherdata['value1'];
    solid = weatherdata['value3'];
    print(weatherdata);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 1080;
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
                title: '온도',
                textV: '${temp.toString().substring(0,2)}°C',
                icon: Icon(CupertinoIcons.thermometer,
                    color: kPrimaryColor, size: 50)),
            DatasBorder(
                title: '토양',
                textV: '${solid.toString()}',
                icon: Icon(Icons.grass, color: kPrimaryColor, size: 50)),
          ],
        ));
  }
}
