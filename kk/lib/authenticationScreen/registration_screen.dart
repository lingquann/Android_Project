import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

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
              GestureDetector(
                onTap: ()
                {

                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "images/profile_avatar.png"
                  ),
                  backgroundColor: Colors.black,
                ),
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
                editingController: phoneTextEditingController,
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
                editingController: bodyTextEditingController,
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

            ],
          ),
        ),
      ),
    );
  }
}