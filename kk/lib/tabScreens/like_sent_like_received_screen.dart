import 'package:flutter/material.dart';


class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() => _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState extends State<LikeSentLikeReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Like Sent Like Received Screen",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            
          ),
        ),
      ),
    );
  }
}