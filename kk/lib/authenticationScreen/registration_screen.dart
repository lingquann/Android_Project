import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kk/controllers/authentication_controller.dart';
import 'package:kk/widgets/custom_text_field_widget.dart';


class RegistrationScreen extends StatefulWidget 
{
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> 
{
  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  //Life style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController willingToRelocateTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();

  //Background - Cultural Values
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController = TextEditingController();
  
  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;
  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(
                height: 10,
              ),

              const Text(
                "to get Started Now.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //choose image circle avatar
              authenticationController.imageFile == null ?
              const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "images/profile_avatar.png"
                  ),
                  backgroundColor: Colors.black,
                ):
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: FileImage(
                        File(
                          authenticationController.imageFile!.path,
                        ),
                      ),
                    ),
                  ),
                ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.pickedImageFromGallery();

                      setState(() {
                        authenticationController.imageFile;

                      });
                    }, 
                    icon: Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.captureImageFromPhoneCamera();

                      setState(() {
                        authenticationController.imageFile;
                        
                      });
                    }, 
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),

                ],
              ),
            
              const SizedBox(
                height: 30,
              ),

              //personal info
              const Text(
                "Personal Info:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),


              //name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: nameTextEditingController,
                labelText: "Name",
                iconData: Icons.person_outline,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: emailTextEditingController,
                labelText: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
                ),
              ),
              
              const SizedBox(
                height: 24,
              ),

                //password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: passwordTextEditingController,
                labelText: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //age
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: ageTextEditingController,
                labelText: "Age",
                iconData: Icons.numbers,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: phoneNoTextEditingController,
                labelText: "Phone",
                iconData: Icons.phone,
                isObscure: true,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: cityTextEditingController,
                labelText: "City",
                iconData: Icons.location_city,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: countryTextEditingController,
                labelText: "Country",
                iconData: Icons.location_city,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: profileHeadingTextEditingController,
                labelText: "Profile Heading",
                iconData: Icons.text_fields,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //lookingForInaPartner
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: lookingForInaPartnerTextEditingController,
                labelText: "What you're looking for in a partner",
                iconData: Icons.face,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Appearance
              const Text(
                "Appearance",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),


              //height
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: heightTextEditingController,
                labelText: "Height",
                iconData: Icons.insert_chart,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: weightTextEditingController,
                labelText: "Weight",
                iconData: Icons.table_chart,
                isObscure: false,
                ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //bodyType
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: bodyTypeTextEditingController,
                labelText: "Body Type",
                iconData: Icons.type_specimen,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Life style
              const Text(
                "Life style",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),


              //drink
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: drinkTextEditingController,
                labelText: "Drink",
                iconData: Icons.local_drink_outlined,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //smoke
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: smokeTextEditingController,
                labelText: "Smoke",
                iconData: Icons.smoking_rooms,
                isObscure: false,
                ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //martialStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: martialStatusTextEditingController,
                labelText: "Martial Status",
                iconData: CupertinoIcons.person_2,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //haveChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: haveChildrenTextEditingController,
                labelText: "Do you have Children?",
                iconData: CupertinoIcons.person_3_fill,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //noOfChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: noOfChildrenTextEditingController,
                labelText: "Number of Children",
                iconData: CupertinoIcons.person_3_fill,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              
              //profession
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: professionTextEditingController,
                labelText: "Profession",
                iconData: Icons.business_center,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //employmentStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: employmentTextEditingController,
                labelText: "Employment Status",
                iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //income
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: incomeTextEditingController,
                labelText: "Income",
                iconData: CupertinoIcons.money_dollar_circle,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //livingSituation
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: livingSituationTextEditingController,
                labelText: "Living Situation",
                iconData: CupertinoIcons.person_2_square_stack,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //willingToRelocate
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: willingToRelocateTextEditingController,
                labelText: "Are you willing to Relocate?",
                iconData: CupertinoIcons.person_2,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //relationshipYouAreLookingFor
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: relationshipYouAreLookingForTextEditingController,
                labelText: "What relationship you are looking for?",
                iconData: CupertinoIcons.person_2,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Background - Cultural Values
              const Text(
                "Background - Cultural Values",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),


              //nationaliy
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: nationalityTextEditingController,
                labelText: "Nationality",
                iconData: Icons.flag_circle_outlined,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //education
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: educationTextEditingController,
                labelText: "Education",
                iconData: Icons.history_edu,
                isObscure: false,
                ),
              ),
              
              const SizedBox(
                height: 24,
              ),

              //languageSpoken
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: languageSpokenTextEditingController,
                labelText: "Language Spoken",
                iconData: CupertinoIcons.person_badge_plus_fill,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //religion
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: religionTextEditingController,
                labelText: "Religion",
                iconData: CupertinoIcons.checkmark_seal_fill,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                editingController: ethnicityTextEditingController,
                labelText: "Ethnicity",
                iconData: CupertinoIcons.eye,
                isObscure: false,
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              
              //create account button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )
                ),
                child: InkWell(
                  onTap: ()
                  {
                    if(authenticationController.profileImage != null)
                    {
                      if(
                      //personal info
                      nameTextEditingController.text.trim().isNotEmpty 
                      && emailTextEditingController.text.trim().isNotEmpty 
                      && passwordTextEditingController.text.trim().isNotEmpty
                      && ageTextEditingController.text.trim().isNotEmpty
                      && phoneNoTextEditingController.text.trim().isNotEmpty
                      && cityTextEditingController.text.trim().isNotEmpty
                      && countryTextEditingController.text.trim().isNotEmpty
                      && profileHeadingTextEditingController.text.trim().isNotEmpty
                      && lookingForInaPartnerTextEditingController.text.trim().isNotEmpty &&
                      
                      //Appearance
                      heightTextEditingController.text.trim().isNotEmpty
                      && weightTextEditingController.text.trim().isNotEmpty
                      && bodyTypeTextEditingController.text.trim().isNotEmpty &&
                      
                      //Life style
                      drinkTextEditingController.text.trim().isNotEmpty
                      && smokeTextEditingController.text.trim().isNotEmpty
                      && martialStatusTextEditingController.text.trim().isNotEmpty
                      && haveChildrenTextEditingController.text.trim().isNotEmpty
                      && noOfChildrenTextEditingController.text.trim().isNotEmpty
                      && professionTextEditingController.text.trim().isNotEmpty
                      && employmentTextEditingController.text.trim().isNotEmpty
                      && incomeTextEditingController.text.trim().isNotEmpty
                      && livingSituationTextEditingController.text.trim().isNotEmpty
                      && willingToRelocateTextEditingController.text.trim().isNotEmpty
                      && relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty &&
                      
                      //Background - Cutural Values
                      nationalityTextEditingController.text.trim().isNotEmpty
                      && educationTextEditingController.text.trim().isNotEmpty
                      && languageSpokenTextEditingController.text.trim().isNotEmpty
                      && religionTextEditingController.text.trim().isNotEmpty
                      && ethnicityTextEditingController.text.trim().isNotEmpty)
                      {
                        
                      }
                      else
                      {
                        Get.snackbar("A Field is Empty", "Please fill out all field in text fields.");
                      }
                    }
                    else
                    {
                      Get.snackbar("Image File Missing", "Please pick image from Gallery or capture with Camera");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(
                height: 16,
              ),

              //already have an account login here button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: ()
                    {
                      Get.back();
                    },
                    child: const Text(
                      "Login Here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
                ),

              const SizedBox(
                height: 16,
              ),

              showProgressBar == true 
              ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ) 
              : Container(),

              const SizedBox(
                height: 30,
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}