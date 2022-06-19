import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig(
    this.appEnv,
    this.appBaseUrl, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);


  // values which should be different for different flavor.
  final String appEnv;
  final String appBaseUrl;

  static AppConfig of(BuildContext context) {
    final AppConfig? result =
        context.dependOnInheritedWidgetOfExactType<AppConfig>();
    assert(result != null, 'No AppConfig found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppConfig old) {
    return false;
  }
}
