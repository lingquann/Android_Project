import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk/controllers/profile-controller.dart';
import 'package:get/get.dart';
import 'package:kk/global.dart';


class SwippingScreen extends StatefulWidget 
{
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> 
{
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";
  readCurrentUserData() async
  {
    await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUserID)
          .get()
          .then((dataSnapshot)
          {
            setState(() {
              senderName = dataSnapshot.data()!["name"].toString();
            });
          });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();  
    
  
  }
  int a = ProfileController().allUsersProfileList.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
      {

        return PageView.builder(
        itemCount: a,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, b)
        {
          final eachProfileInfo = profileController.allUsersProfileList[b];

          return DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  eachProfileInfo.imageProfile.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  //filter icon button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: IconButton(
                        onPressed: ()
                        {

                        },
                        icon: const Icon(
                          Icons.filter_list,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                
                  const Spacer(),
                  //user data
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: Column(
                      children: [

                        //name
                        Text(
                          eachProfileInfo.name.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //age - city
                        Text(
                          eachProfileInfo.age.toString() + " ⦿ "  + eachProfileInfo.city.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 4,
                          ),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        //profession and religion
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                              child: Text(
                                eachProfileInfo.profession.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 6,
                            ),

                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                              child: Text(
                                eachProfileInfo.religion.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),

                        //country and ethnicity
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                              child: Text(
                                eachProfileInfo.country.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 6,
                            ),

                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                              child: Text(
                                eachProfileInfo.ethnicity.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),                
                
                  const SizedBox(
                          height: 14,
                  ),

                  //image buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      //favorite button
                      GestureDetector(
                        onTap: ()
                        {
                          profileController.favoriteSentAndFavoriteReceived(
                            eachProfileInfo.uid.toString(),
                            senderName,


                          );
                        },
                        child: Image.asset(
                          "images/favorite.png",
                          width: 60,
                        ),
                      ),

                      //chat button
                      GestureDetector(
                        onTap: ()
                        {

                        },
                        child: Image.asset(
                          "images/chat.png",
                          width: 90,
                        ),
                      ),

                      //like button
                      GestureDetector(
                        onTap: ()
                        {
                          profileController.likeSentAndLikeReceived(
                            eachProfileInfo.uid.toString(),
                            senderName,

                            );
                        },
                        child: Image.asset(
                          "images/like.png",
                          width: 60,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
      }),
    );
  }
}