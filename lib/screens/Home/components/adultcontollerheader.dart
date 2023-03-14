import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';

class Adultcontollerheader extends StatefulWidget {
  const Adultcontollerheader({Key? key}) : super(key: key);

  @override
  State<Adultcontollerheader> createState() => _AdultcontollerheaderState();
}

class _AdultcontollerheaderState extends State<Adultcontollerheader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '사용자들',
              style: TextStyle(
                  color: kTextColor, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Column(children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color.fromRGBO(255, 226, 208, 1),
                      border: Border.all(color: Color(0xffd4d5dd), width: 0.5)),
                  child: Icon(CupertinoIcons.smiley, color: kPrimaryColor,size: 40,),
                ),
              SizedBox(
                height: 10,
              ),
              Text('Alex', style: TextStyle(color: kPrimaryColor, fontSize: 20),)
            ]),
          ],
        ),
      ),
    );
  }
}
