# Flutter Flavor Example For Android

This project contains, how to implement flavor in flutter projects.

## Features

- Manage url for different environment of projects like Dev, Production, Testing etc.

## Steps
 - Add Flavors to the app level build.gradle(android/app/build.gradle) file for android like below.


```
flavorDimensions "app_env"
    productFlavors{

        dev {
            dimension "app_env"
            applicationId "com.example.flavorsexample"
            versionCode 1
            versionName "1.0"
        }

        prod {
            dimension "app_env"
            applicationId "com.example.flavorsexample"
            versionCode 1
            versionName "1.0"
        }

    }
```

 - create configuration dart file for Flavor management.
```
import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig(
    this.appEnv,
    this.appBaseUrl, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

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
```

 - Rename main.dart to main_common.dart and main function to main_common function.
 - Create main files for diffrent flavors like below.
    - For Flavor Dev main_dev.dart:
```
void main() {
    var configApp = const AppConfig(
    "dev",
    devBaseUrl,
    child: MyApp(),
  );

  mainCommon();

  runApp(configApp);
}
```
 - For Flavor Production main_prod.dart:
```
void main() {
    var configApp = const AppConfig(
    "prod",
    prodBaseUrl,
    child: MyApp(),
  );

  mainCommon();

  runApp(configApp);
}
```

 - main_common.dart
 ```
 import 'package:flutter/material.dart';
import 'package:flutter_flavor_example/screens/login_screen.dart';

void mainCommon() {
    // pre-requisting method calling.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
 ```
 - To run any flutter command with diffrent flutter flavor add below code in any flutter code.

```
 <flutter-code> --flavor flavor_name -t lib/main_flavor.dart
```

For references:
 - [Flutter Flavor for Android](https://cogitas.net/creating-flavors-of-a-flutter-app/)
