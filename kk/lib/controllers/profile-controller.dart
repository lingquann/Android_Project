import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kk/global.dart';
import 'package:kk/models/person.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class ProfileController extends GetxController
{
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  @override
  void onInit(){
    //TODO: implement onInit
    super.onInit();

    usersProfileList.bindStream(
      FirebaseFirestore.instance
      .collection("user")
      .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots()
      .map((QuerySnapshot queryDataSnapshot)
    {
      List<Person> profilesList = [];

      for(var eachProfile in queryDataSnapshot.docs)
      {
        profilesList.add(Person.fromDataSnapshot(eachProfile));
      }
      return profilesList;
    })
  );
  }
  
  favoriteSentAndFavoriteReceived(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("favoriteReceived")
          .doc(currentUserID)
          .get();

    // remove the favorite from database
    if(document.exists) 
    {
        // xoa nguoi dung hien tai favoriteReceived list khoi ho so ca nhan
        await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("favoriteReceived")
          .doc(currentUserID)
          .delete();

        // xoa ho so cua minh o doi tac
        await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUserID)
          .collection("favoriteSent")
          .doc(toUserID)
          .delete();  
    }
    else // mask as favorite //add favorite in database
    {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("favoriteReceived")
          .doc(currentUserID)
          .set({});

        // xoa ho so cua minh o doi tac
        await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUserID)
          .collection("favoriteSent")
          .doc(toUserID)
          .set({});  
    }

    update();
  }

  likeSentAndLikeReceived(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("likeReceived")
          .doc(currentUserID)
          .get();

    // remove the like from database
    if(document.exists) 
    {
        // xoa nguoi dung hien tai favoriteReceived list khoi ho so ca nhan
        await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("likeReceived")
          .doc(currentUserID)
          .delete();

        // xoa ho so cua minh o doi tac
        await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUserID)
          .collection("likeSent")
          .doc(toUserID)
          .delete();  
    }
    else // mask as favorite //add favorite in database
    {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("likeReceived")
          .doc(currentUserID)
          .set({});

        // xoa ho so cua minh o doi tac
        await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUserID)
          .collection("likeSent")
          .doc(toUserID)
          .set({});  
    }

    update();
  }
  
  viewSentAndViewReceived(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("viewReceived")
          .doc(currentUserID)
          .get();

    // remove the like from database
    if(document.exists) 
    {
        print("already in view list")
    }
    else // mask as favorite //add favorite in database
    {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(toUserID)
          .collection("viewReceived")
          .doc(currentUserID)
          .set({});

        // xoa ho so cua minh o doi tac
        await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUserID)
          .collection("viewSent")
          .doc(toUserID)
          .set({});  
    }

    update();
  }
}