import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kk/authenticationScreen/login_screen.dart';
import 'package:kk/controllers/authentication_controller.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthenticationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:  Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      );
  }
}

