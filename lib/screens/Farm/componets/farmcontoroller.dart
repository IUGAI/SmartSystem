import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:smartsystem/network.dart';

class FarmController extends StatefulWidget {
  const FarmController({Key? key}) : super(key: key);

  @override
  State<FarmController> createState() => _FarmController();
}

class _FarmController extends State<FarmController> {
  int temperature = 25;
  int _start = 0;
  int _end = 0;
  int humidity = 65;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Center(
      child: Container(
        margin: screenWidth > 900 ? EdgeInsets.only(left: 20) : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              '설정',
              style: TextStyle(
                  fontSize: screenWidth < 900 ? 30.0 : 40.0, fontWeight: FontWeight.w800, color: kTextColor),
            ),
            SizedBox(
              height: 30,
            ),
            Text('온도: $temperature°C',
                style: TextStyle(
                    fontSize: screenWidth < 900 ? 20 : 30,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor)),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius:  screenWidth < 900 ? 7.0 : 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius :screenWidth < 900 ? 20.0 : 30.0)),
              child: Slider(
                value: temperature.toDouble(),
                max: 40.0,
                min: 0.0,
                activeColor: kPrimaryColor,
                inactiveColor: Color(0xff8d8e98),
                onChanged: (double newvalue) {
                  print(newvalue);
                  setState(() {
                    temperature = newvalue.round();
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text('습도: $humidity%',
                style: TextStyle(
                    fontSize: screenWidth < 900 ? 20 : 30,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor)),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius:  screenWidth < 900 ? 7.0 : 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: screenWidth < 900 ? 20.0 : 30.0)),
              child: Slider(
                value: humidity.toDouble(),
                max: 200.0,
                min: 0.0,
                activeColor: kPrimaryColor,
                inactiveColor: Color(0xff8d8e98),
                onChanged: (double newvalue) {
                  print(newvalue);
                  setState(() {
                    humidity = newvalue.round();
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30),
                Text('시작',style: TextStyle(fontSize: screenWidth < 900 ? 20 : 30, color: kPrimaryColor)),
                SizedBox(width: 10),
                NumberPicker(
                  value: _start,
                  minValue: 0,
                  maxValue: 23,
                  itemWidth: 40,
                  onChanged: (value) => setState(() => _start = value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
                SizedBox(width: 20),
                NumberPicker(
                  value: _end,
                  minValue: 0,
                  maxValue: 23,
                  itemWidth: 40,
                  textStyle: TextStyle(
                    color: kTextColor
                  ),
                  onChanged: (value) => setState(() => _end = value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
                SizedBox(width: 10),
                Text('끝', style: TextStyle(fontSize : screenWidth < 900 ? 20 : 30, color: kPrimaryColor),),
                SizedBox(width: 30),
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Insert().insertdata_aut('setup', 'farm', temperature, humidity, _start, _end);
              },
              child: Text('호출',style: TextStyle(fontSize: screenWidth < 900 ? 20 : 30),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical:10),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }
}
