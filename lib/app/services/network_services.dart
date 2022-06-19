
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor_example/app/constants/api_constants.dart';
import 'package:flutter_flavor_example/app_config.dart';

var dio = Dio();

Future loginUser(Map<String,dynamic> req,BuildContext context) async{

  var url = AppConfig.of(context).appBaseUrl+loginUrl;

  print(url);

  var response = await dio.post(url,data: req);

  if(response.statusCode==200){
    return response.data;
  }
  else{
    return "error";
  }

}