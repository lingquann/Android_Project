import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kk/authenticationScreen/login_screen.dart';
import 'package:kk/controllers/authentication_controller.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAOWT-n1xS_EGJ2xJjK43mRl6jyOCegXps", 
      appId: "1:70565685486:android:2fb8519bf9a37994452bff", 
      messagingSenderId: "70565685486", 
      projectId: "dating-app-45cc9"),
      
  );
  
  await Firebase.initializeApp().then((value){
    Get.put(AuthenticationController());
  });

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

