import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kk/controllers/profile-controller.dart';
import 'package:get/get.dart';


class SwippingScreen extends StatefulWidget 
{
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> 
{
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
      {

        return PageView.builder(
        itemCount: profileController.allUsersProfileList.length,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index)
        {
          final eachProfileInfo = profileController.allUsersProfileList[index];

          return DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  eachProfileInfo.imageProfile.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
      }),
    );
  }
}