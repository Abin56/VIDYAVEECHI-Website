import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class AchievementsController extends GetxController {
  QueryDocumentSnapshot<Map<String, dynamic>>? classListValue;
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool loadingStatus = false;
  String studentID = '';
  Uint8List? file;
  Uint8List? afile;

  TextEditingController achievementController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController admissionNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<Map<String, String>> uploadImageToStorage(
   // file
    ) async {
    try {
      String uid = const Uuid().v1();
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("files/achievements/$uid")
          .putData(file!);

      final TaskSnapshot snap = await uploadTask;
      final String downloadUrl = await snap.ref.getDownloadURL();

      AchievementModel achievementDetails = AchievementModel(
          photoUrl: downloadUrl,
          studentName: studentNameController.text,
          dateofAchievement: dateController.text,
          achievementHead: achievementController.text,
          admissionNumber: admissionNumberController.text,
          uid: uid,
        //  studentID: studentID
          );

      server //d4srOy0ovzUPBmZs3CBFRoOImIU2
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          // .collection(Get.find<GetFireBaseData>().bYear.value)
          // .doc(Get.find<GetFireBaseData>().bYear.value)
          .collection('AdminAchievements')
          .doc(achievementDetails.uid)
          .set(achievementDetails.toMap())
          .then((value) {
        studentNameController.clear();
        dateController.clear();
        achievementController.clear();
        admissionNumberController.clear();
        //   if (afile == null) {
        //     showToast(msg: 'Select an image');
        //   } else {
        // showToast(msg: 'New Achievement Added!');}
      })
      .then((value) => showToast(msg: 'New Achievement Added!'));

      return {
        "downloadUrl": downloadUrl,
        "imageUid": uid,
      };
      //}
      //  else {
      //   return {};
      // }
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  Future<void> updateAchievement( String uid,BuildContext context) async {
     
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        // .collection(Get.find<GetFireBaseData>().bYear.value)
        // .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('AdminAchievements')
        .doc(uid)
        .update({
          'studentName':studentNameController.text,
           'dateofAchievement':dateController.text,
           'achievementHead':achievementController.text,
           'admissionNumber':admissionNumberController.text,
          // 'photoUrl': downloadUrl,
    })  .then((value) => Navigator.pop(context ))
        .then((value) => showToast(msg: 'Achievement Updated!'));
  }

  Future<void> deleteAchievements(String uid,BuildContext context) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        // .collection(Get.find<GetFireBaseData>().bYear.value)
        // .doc(Get.find<GetFireBaseData>().bYear.value)
        .collection('AdminAchievements')
        .doc(uid)
        .delete()
        .then((value) => Navigator.pop(context ))
        .then((value) => showToast(msg: 'Successfully Deleted!'));
  }
}
