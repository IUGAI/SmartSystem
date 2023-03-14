import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'package:smartsystem/network.dart';
import 'package:smartsystem/components/CustomSwitch.dart';
import 'package:smartsystem/network.dart';
import 'package:smartsystem/components/ContollerWidget.dart';

class Contollers extends StatefulWidget {
  const Contollers({Key? key}) : super(key: key);

  @override
  State<Contollers> createState() => _ContollersState();
}

class _ContollersState extends State<Contollers> {
   bool? _checked_fan;
  bool? _checked_water;
  bool? _checked_food;
  int? fan,water,food ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    var weatherdata = await Networksenddata().getalldata('barn', 'io');
    fan = weatherdata['value1'];
    water = weatherdata['value2'];
    food =  weatherdata['value3'];
    _checked_fan = fan == 1;
    _checked_water = water == 1;
    _checked_food = food == 1;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
        ),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContollerWidget(
                  text: '팬',
                  icon: Icon(Icons.ac_unit,
                      color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                  widget: CustomSwitch(
                    initialValue: _checked_fan!,
                    onChanged: (value) {
                      _checked_fan = value;
                      Insert networking = Insert();
                      networking.insertdata('io', 'barn', _checked_fan!,
                          _checked_water!, _checked_food!);
                    },
                  )),
              SizedBox(width: 20),
              ContollerWidget(
                text: '물 공급',
                icon: Icon(Icons.format_color_fill,
                    color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                widget: CustomSwitch(
                  initialValue: _checked_water!,
                  onChanged: (value) {
                    _checked_water = value;
                    Insert networking = Insert();
                    networking.insertdata('io', 'barn', _checked_fan!,
                        _checked_water!, _checked_food!);
                  },
                ),
              ),
              SizedBox(width: 20),
              ContollerWidget(
                text: '사료공급',
                icon: Icon(Icons.touch_app,
                    color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                widget: CustomSwitch(
                  initialValue: _checked_food!,
                  onChanged: (value) {
                    _checked_food = value;
                    Insert networking = Insert();
                    networking.insertdata('io', 'barn', _checked_fan!,
                        _checked_water!, _checked_food!);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
