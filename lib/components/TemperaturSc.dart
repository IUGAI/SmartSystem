import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'package:smartsystem/network.dart';
import 'DatasBorder.dart';

class TemperatureSc extends StatefulWidget {
  const TemperatureSc({Key? key}) : super(key: key);

  @override
  State<TemperatureSc> createState() => _Temperature_upState();
}

class _Temperature_upState extends State<TemperatureSc> {

  String? temp;
  String? solid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatas();
  }
  void getdatas() async {
    var weatherdata = await Networksenddata().getalldata('home','data');
    temp = weatherdata['value1'];
    solid = weatherdata['value4'];
    print(weatherdata);
  }
  @override
  Widget build(BuildContext context) {
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
                title: '습도',
                textV: '${temp?.substring(0,2)}%',
                icon: Icon(CupertinoIcons.drop,
                    color: kPrimaryColor, size: 50)),
            DatasBorder(
                title: '미센먼지',
                textV: '155 ',
                icon: Icon(CupertinoIcons.smiley, color: kPrimaryColor, size: 50)),
          ],
        ));
  }
}

