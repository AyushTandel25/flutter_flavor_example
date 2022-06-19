import 'package:flutter/material.dart';
import 'package:flutter_flavor_example/app/services/network_services.dart';
import 'package:flutter_flavor_example/app_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    // declaration app configuration object
    final config = AppConfig.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          config.appEnv.toString().toUpperCase(),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email can not be empty";
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Email"
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password can not be empty";
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Password"
                      ),
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                      Map<String,dynamic> req = {
                        "email":emailController.text.trim(),
                        "password":passwordController.text.trim(),
                      };

                      var response = await loginUser(req, context);
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
