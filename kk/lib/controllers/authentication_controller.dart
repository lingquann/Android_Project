import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kk/models/person.dart' as personModel;


class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;


  pickedImageFromGallery() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully picked your profile image from gallery.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFromPhoneCamera() async
  {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully captured your profile image using camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> upLoadImageToStorage(File imageFile) async
  {
    Reference referenceStorage = FirebaseStorage.instance.ref().child("Profile Images").child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    
    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
    return downloadUrlOfImage;
  }
  createNewUserAccount(
    //personal info
    File imageProfile, String name, String email, String password, 
    String age, String phoneNo, String city, String country, 
    String profileHeading, String lookingForInaPartner, 
    String publishDateTime,
    
    //Appearance
    String height, String weight, String bodyType,

    //Life style
    String drink, String smoke, String martialStatus,
    String haveChildren, String noOfChildren, String profession,
    String employmentStatus, String income, String livingSituation,
    String willingToRelocate, String relationshipYouAreLookingFor,

    //Background - Curtural Values
    String nationality, String education, String languageSpoken,
    String religion, String ethnicity,) async
  {
    try
    {
      //1. 
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);

        //2.
        String urlOfDownloadedImage = await upLoadImageToStorage(imageProfile);

        //3. 
        personModel.Person personInstance = personModel.Person(
          //personal info
          imageProfile: urlOfDownloadedImage,
          email: email,
          password: password,
          name: name,
          age: age,
          phoneNo: phoneNo,
          city: city,
          country: country,
          profileHeading: profileHeading,
          lookingForInaPartner: lookingForInaPartner,
          publishDateTime: DateTime.now().millisecondsSinceEpoch,

          //Appearance
          height: height,
          weight: weight,
          bodyType: bodyType,

          //Life style
          drink: drink,
          smoke: smoke,
          martialStatus: martialStatus,
          haveChildren: haveChildren,
          noOfChildren: noOfChildren,
          profession: profession,
          employmentStatus: employmentStatus,
          income: income,
          livingSituation: livingSituation,
          willingToRelocate: willingToRelocate,
          relationshipYouAreLookingFor: relationshipYouAreLookingFor,

          //Background - Cultural Values
          nationality: nationality,
          education: education,
          languageSpoken: languageSpoken,
          religion: religion,
          ethnicity: ethnicity,

        );

        await FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser!.uid).set(personInstance.toJson());
      Get.snackbar("Account Created","Congratulation: $errorMsg");
    }
    catch(errorMsg)
    {
      Get.snackbar("Account Creation Unsuccessful","Error occurred: $errorMsg");
    }
  }
}