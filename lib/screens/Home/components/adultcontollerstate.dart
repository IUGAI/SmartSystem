import 'package:flutter/material.dart';
import 'package:smartsystem/constans.dart';

class Adultcontollerstate extends StatefulWidget {
  const Adultcontollerstate({Key? key}) : super(key: key);

  @override
  State<Adultcontollerstate> createState() => _AdultcontollerstateState();
}

class _AdultcontollerstateState extends State<Adultcontollerstate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 380,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('활동 관리', style: TextStyle(fontSize: 25, color: kTextColor, fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Valuescontainer(text: '제온: 정상', color:  Colors.grey.shade400),
                    Valuescontainer(text: '활동: 정상', color:  Colors.grey.shade400,),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                   Valuescontainer(text: '기침: 정상', color: Colors.grey.shade400,),
                    Valuescontainer(text: '수면: 정상', color: Colors.grey.shade400,)
                  ],
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}

class Valuescontainer extends StatelessWidget {
  const Valuescontainer({
    Key? key,required this.text, required this.color
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
                   decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(40),
     color: color
                   ),
        child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
