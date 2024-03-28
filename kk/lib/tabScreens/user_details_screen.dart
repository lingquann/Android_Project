import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';


class UserDetailsScreen extends StatefulWidget 
{
  String? userId;

  UserDetailsScreen({super.key, this.userId,});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> 
{
  //personal info
  String name = '';
  String age = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  //Appearance
  String height= '';
  String weight = '';
  String bodyType= '';

  //Life style
  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren= '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  //Background - Cultural Values
  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';

  //slider images
  String urlImage1 = "https://firebasestorage.googleapis.com/v0/b/dating-app-45cc9.appspot.com/o/Place%20Holder%2Fprofile_avatar.png?alt=media&token=fa26cacf-d826-412e-95be-041bf6e7d4ed";
  String urlImage2 = "https://firebasestorage.googleapis.com/v0/b/dating-app-45cc9.appspot.com/o/Place%20Holder%2Fprofile_avatar.png?alt=media&token=fa26cacf-d826-412e-95be-041bf6e7d4ed";
  String urlImage3 = "https://firebasestorage.googleapis.com/v0/b/dating-app-45cc9.appspot.com/o/Place%20Holder%2Fprofile_avatar.png?alt=media&token=fa26cacf-d826-412e-95be-041bf6e7d4ed";
  String urlImage4 = "https://firebasestorage.googleapis.com/v0/b/dating-app-45cc9.appspot.com/o/Place%20Holder%2Fprofile_avatar.png?alt=media&token=fa26cacf-d826-412e-95be-041bf6e7d4ed";
  String urlImage5 = "https://firebasestorage.googleapis.com/v0/b/dating-app-45cc9.appspot.com/o/Place%20Holder%2Fprofile_avatar.png?alt=media&token=fa26cacf-d826-412e-95be-041bf6e7d4ed";


  retrieveUserInfo() async
  {
    await FirebaseFirestore.instance
    .collection("user")
    .doc(widget.userId)
    .get()
    .then((snapshot)
    {
      if(snapshot.exists)
      {
        if(snapshot.data()!["urlImage1"] != null)
        {
          setState(() {
            urlImage1 = snapshot.data()!["urlImage1"];
            urlImage2 = snapshot.data()!["urlImage2"];
            urlImage3 = snapshot.data()!["urlImage3"];
            urlImage4 = snapshot.data()!["urlImage4"];
            urlImage5 = snapshot.data()!["urlImage5"];
          });
        }

        setState(() {
          //personal info
          name = snapshot.data()!["name"];
          age = snapshot.data()!["age"];
          phoneNo = snapshot.data()!["phoneNo"];
          city = snapshot.data()!["city"];
          country = snapshot.data()!["country"];
          profileHeading = snapshot.data()!["profileHeading"];
          lookingForInaPartner = snapshot.data()!["lookingForInaPartner"];


          //Appearance
          height = snapshot.data()!["height"];
          weight = snapshot.data()!["weight"];
          bodyType = snapshot.data()!["bodyType"];

          //Life style
          drink = snapshot.data()!["drink"];
          smoke = snapshot.data()!["smoke"];
          martialStatus = snapshot.data()!["martialStatus"];
          haveChildren = snapshot.data()!["haveChildren"];
          noOfChildren = snapshot.data()!["noOfChildren"];
          profession = snapshot.data()!["profession"];
          employmentStatus = snapshot.data()!["employmentStatus"];
          income = snapshot.data()!["income"];
          livingSituation = snapshot.data()!["livingSituation"];
          willingToRelocate = snapshot.data()!["willingToRelocate"];
          relationshipYouAreLookingFor = snapshot.data()!["relationshipYouAreLookingFor"];

          //Background - Cultural Values
          nationality = snapshot.data()!["nationality"];
          education = snapshot.data()!["education"];
          languageSpoken = snapshot.data()!["languageSpoken"];
          religion = snapshot.data()!["religion"];
          ethnicity = snapshot.data()!["ethnicity"];
        });
      }
    });
  }

  @override
  void initState(){
    //TODO: implement initState
    super.initState();


    retrieveUserInfo();
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()
            {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [

              //image slider
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Carousel(
                    indicatorBarColor: Colors.black.withOpacity(0.3),
                    autoScrollDuration: const Duration(seconds: 2),
                    animationPageDuration: const Duration(milliseconds: 500),
                    activateIndicatorColor: Colors.black,
                    animationPageCurve: Curves.easeIn,
                    indicatorBarHeight: 30,
                    indicatorHeight: 10,
                    indicatorWidth: 10,
                    unActivatedIndicatorColor: Colors.grey,
                    stopAtEnd: false,
                    autoScroll: true,
                    items: [
                      Image.network(urlImage1, fit: BoxFit.cover,),
                      Image.network(urlImage2, fit: BoxFit.cover,),
                      Image.network(urlImage3, fit: BoxFit.cover,),
                      Image.network(urlImage4, fit: BoxFit.cover,),
                      Image.network(urlImage5, fit: BoxFit.cover,),
                    ],
                    
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}