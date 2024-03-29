import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kk/tabScreens/favorite_sent_favorite_received_screen.dart';
import 'package:kk/tabScreens/like_sent_like_received_screen.dart';
import 'package:kk/tabScreens/swipping_screen.dart';
import 'package:kk/tabScreens/user_details_screen.dart';
import 'package:kk/tabScreens/view_sent_view_received_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int screenIndex = 0;

  List tabScreensList = 
  [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavoriteSentFavoriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen(userId: FirebaseAuth.instance.currentUser!.uid,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber)
        {
          setState((){
            screenIndex = indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
        items: const [
          //SwippingScreen
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: ""
          ),

          //viewSentViewReceived icon button
           BottomNavigationBarItem(
            icon: Icon(
              Icons.remove_red_eye,
              size: 30,
            ),
            label: ""
          ),

          //favoriteSentFavoriteReceived icon button
           BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: 30,
            ),
            label: ""
          ),

          //likeSentLikeReceived icon button
           BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: ""
          ),
          
          //userDetailsScreen icon button
           BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: ""
          ),
        ],
      ),
      body: tabScreensList[screenIndex],
    );
  }
}