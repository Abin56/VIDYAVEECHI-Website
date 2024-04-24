import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class ImageController extends GetxController {
  Rxn<Uint8List> image = Rxn();

  // for Picking images from gallery //
  pickImage() async {
    try {
      XFile? pickimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickimage != null) {
        print("<>>>>>>>>>>>>>>>>>>>>>>>.gasudgisa");
        print(pickimage.readAsBytes());
        image.value = await pickimage.readAsBytes();
        updateProfilePicture();
        // return await pickimage.readAsBytes();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // images uploaded to firebase and return a image url //
  Future<String> uploapImageToFirebase(Uint8List image) async {
    String imageUrl = '';

    final imageName = 'image_${DateTime.now()}.jpg';
    Reference storageRef =
        FirebaseStorage.instance.ref().child('imagecollection$imageName');

    try {
      // final Uint8List imageByte = await image.readAsBytes();
      await storageRef.putData(image).whenComplete(
        () async {
          imageUrl = await storageRef.getDownloadURL();
        },
      );
      log("image uploaded to firebasefirestore");
      return imageUrl;
    } catch (e) {
      return "error";
    }
  }

  Future updateProfilePicture() async {
    // print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${image.value}');
    String uploadedImage = await uploapImageToFirebase(image.value!);
    log('Image converted');

    final Map<String, dynamic> updateData = {
      "image": uploadedImage,
    };
    final DocumentReference collection1 = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(serverAuth.currentUser!.uid);
    final DocumentReference collection2 = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Admins')
        .doc(serverAuth.currentUser!.uid);
    final collection1Snapshot = await collection1.get();
    final collection2Snapshot = await collection2.get();

    if (collection1Snapshot.exists) {
      // Update data in collection 1
      try {
        await collection1.update(updateData);
        showToast(msg: 'Profile updated');
      } catch (e) {
        log('Error updating profile: $e');
        showToast(msg: 'Failed to update profile');
      }
    } else if (collection2Snapshot.exists) {
      try {
        await collection2.update(updateData);
        showToast(msg: 'Profile updated');
      } catch (e) {
        log('Error updating profile: $e');
        showToast(msg: 'Failed to update profile');
      }
    } else {
      // Handle the case where the user is not found in either collection
      print('User not found in any collection');
    }
    try {
      await FirebaseFirestore.instance
          .collection('SchoolListCollection')
          .doc(serverAuth.currentUser!.uid)
          .update(updateData);
      showToast(msg: 'Profile picture updated');
    } catch (e) {
      print(e);
      log('Error updating profile picture: $e');
      showToast(msg: 'Failed to update profile picture');
    }
  }
}

class AdminProfileController extends GetxController {
  final getImageCtr = Get.put(ImageController());
  RxBool onTapEdit = false.obs;
  RxString gender = ''.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future updateAdminProfile() async {
    final Map<String, dynamic> updateMainAdmin = {
      "adminUserName": nameController.text,
      "designation": designationController.text,
      "about": aboutController.text,
      "phoneNumber": phoneController.text,
      "email": emailController.text,
      "gender": gender.value,
    };
    final Map<String, dynamic> updateData = {
      "userName": nameController.text,
      "designation": designationController.text,
      "about": aboutController.text,
      "phoneNumber": phoneController.text,
      "email": emailController.text,
      "gender": gender.value,
    };
    final DocumentReference collection1 = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(serverAuth.currentUser!.uid);
    final DocumentReference collection2 = FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Admins')
        .doc(serverAuth.currentUser!.uid);
    final collection1Snapshot = await collection1.get();
    final collection2Snapshot = await collection2.get();

    if (collection1Snapshot.exists) {
      // Update data in collection 1
      try {
        await collection1
            .update(updateMainAdmin)
            .then((_) => onTapEdit.value = false);
        showToast(msg: 'Profile updated');
      } catch (e) {
        log('Error updating profile: $e');
        showToast(msg: 'Failed to update profile');
      }
    } else if (collection2Snapshot.exists) {
      try {
        await collection2
            .update(updateData)
            .then((_) => onTapEdit.value = false);
        showToast(msg: 'Profile updated');
      } catch (e) {
        log('Error updating profile: $e');
        showToast(msg: 'Failed to update profile');
      }
    } else {
      // Handle the case where the user is not found in either collection
      print('User not found in any collection');
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final DocumentSnapshot collection1 = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(serverAuth.currentUser!.uid)
        .get();
    final DocumentSnapshot collection2 = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('Admins')
        .doc(serverAuth.currentUser!.uid)
        .get();

    if (collection1.exists) {
      // Data found in collection 1
      final collection1Data = collection1.data();
      return {'collection1': collection1Data};
    } else if (collection2.exists) {
      // Data found in collection 2
      final collection2Data = collection2.data();
      return {'collection2': collection2Data};
    } else {
      // No data found in either collection
      return {};
    }
  }
}
