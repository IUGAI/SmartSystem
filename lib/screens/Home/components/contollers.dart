import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';
import 'package:smartsystem/network.dart';
import 'package:smartsystem/components/CustomSwitch.dart';
import 'package:smartsystem/components/ContollerWidget.dart';

class Contollers extends StatefulWidget {
  const Contollers({Key? key}) : super(key: key);

  @override
  State<Contollers> createState() => _ContollersState();
}

class _ContollersState extends State<Contollers> {
  bool? _checked_led;
  bool? _checked_door;
  int? led, door;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
getdata();
  }

  Future<void> getdata() async {
    var weatherdata = await Networksenddata().getalldata('home', 'io');
    led = weatherdata['value1'];
    door = weatherdata['value2'];
    _checked_led = led == 1;
    _checked_door = door == 1;
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
                text: '조명',
                icon: Icon(CupertinoIcons.lightbulb,
                    color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                widget: CustomSwitch(
                  initialValue: _checked_led!,
                  onChanged: (value) {
                    _checked_led = value;
                    Insert networking = Insert();
                    networking.insertdata('io',
                        'home', _checked_led!, _checked_door!, false);
                  },
                ),
              ),
              SizedBox(width: 20),
              ContollerWidget(
                text: '문',
                icon:
                    Icon(CupertinoIcons.wifi, color: kPrimaryColor, size: screenWidth < 900 ? 40 : 70),
                widget: CustomSwitch(
                  initialValue: _checked_door!,
                  onChanged: (value) {
                    _checked_door = value;
                    Insert networking = Insert();
                    networking.insertdata('io',
                        'home', _checked_led!, _checked_door!, false);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

