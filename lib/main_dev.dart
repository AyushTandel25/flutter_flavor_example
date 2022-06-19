// if flavor is dev, this main function will call


import 'package:flutter/material.dart';
import 'package:flutter_flavor_example/app/constants/app_constants.dart';
import 'package:flutter_flavor_example/app_config.dart';
import 'package:flutter_flavor_example/main_common.dart';

void main() {

  // configuration for dev flavor
  var configApp = const AppConfig(
    "dev",
    devBaseUrl,
    child: MyApp(),
  );

  mainCommon();

  runApp(configApp);
}
