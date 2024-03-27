import 'package:flutter/material.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Wellcome",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            
          ),
        ),
      ),
    );
  }
}