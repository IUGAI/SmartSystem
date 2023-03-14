import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';



class Networksenddata {
  Future<dynamic> getalldata(String app_loca, String data) async {
    Map<String, dynamic>  queryparams = {'mod': 'output', 'tb' : data, 'app_loca' : app_loca};
    try {
      var response = await Dio().get('http://211.255.23.65/resfh/SFHIO.php', queryParameters:  queryparams);
      if (response.statusCode == 200){
        return jsonDecode(response.data);
      }
    } catch(e){
      print(e);
    }
  }
}


class Insert{

  Future<dynamic> insertdata(String mode,String kinds,bool fan, bool water, bool food) async {
    int values1 = toint(fan);
    int values2 = toint(water);
    int values3 = toint(food);
    String kind = kinds;
    var response = await Dio().post('http://211.255.23.65/resfh/SFHIO.php?mod=input&tb=${mode}', data: {
      "app_code": "test",
      "app_loca": kind,
      "app_nm" : '앱',
      "value1": values1,
      "value2" : values2,
      "value3": values3,
      "value4" : 0,
      "value5": 0,
      "use_yn" : 'Y',
    },
      options: Options(contentType: Headers.formUrlEncodedContentType),);
    print(response.data);
  }

  Future<dynamic> insertdata_aut(String mode,String kinds,int values1, int values2, int values3, int values4) async {
    String kind = kinds;
    var response = await Dio().post('http://211.255.23.65/resfh/SFHIO.php?mod=input&tb=${mode}', data: {
      "app_code": "test",
      "app_loca": kind,
      "app_nm" : '앱',
      "value1": values1,
      "value2" : values2,
      "value3": values3,
      "value4" : values4,
      "value5": 0,
      "use_yn" : 'Y',
    },
      options: Options(contentType: Headers.formUrlEncodedContentType),);
    print(response.data);
  }


  int toint(bool bool_Value){
    return bool_Value? 1: 0;
  }

}

