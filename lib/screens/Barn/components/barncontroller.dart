import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'package:smartsystem/network.dart';
import 'package:numberpicker/numberpicker.dart';

class BarnController extends StatefulWidget {
  const BarnController({Key? key}) : super(key: key);

  @override
  State<BarnController> createState() => _FarmController();
}

class _FarmController extends State<BarnController> {
  int temperature = 25;
  int _selectedValue  = 1;
  int humidity = 65;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedValue = 1;
    });
  }
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
                    fontSize:  screenWidth < 900 ? 20 : 30,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor)),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius:  screenWidth < 900 ? 7.0 : 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius:  screenWidth < 900 ? 20.0 : 30.0)),
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
            SizedBox(height: 40),
            Text('습도: $humidity%',
                style: TextStyle(
                    fontSize:  screenWidth < 900 ? 20 : 30,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor)),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: screenWidth < 900 ? 7.0 : 15.0),
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
              height: 30,
            ),
            Text('배급회수',
                style: TextStyle(
                    fontSize:  screenWidth < 900 ? 20 : 30,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor)),
            SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  Text('1회', style: TextStyle(fontSize: screenWidth < 900 ? 20 : 30, color: kPrimaryColor),),
                  Radio(
                    value: 2,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  Text('2회',style: TextStyle(fontSize: screenWidth < 900 ? 20 : 30, color: kPrimaryColor)),
                  Radio(
                    value: 3,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  Text('3회',style: TextStyle(fontSize: screenWidth < 900 ? 20 : 30, color: kPrimaryColor)),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               Insert().insertdata_aut('setup', 'barn', temperature, humidity, _selectedValue,0);
              },
              child: Text('호출',style: TextStyle(fontSize:  screenWidth < 900 ? 20 : 30),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical:10),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
