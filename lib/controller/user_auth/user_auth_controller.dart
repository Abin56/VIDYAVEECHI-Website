import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/home/main_screen.dart';
import 'package:vidyaveechi_website/view/splash_screen/splash_screen.dart';
import 'package:vidyaveechi_website/view/users/admin/admin_home.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class UserAuthController extends GetxController {
  Future<void> checkSavedLoginAuth() async {
    if (kDebugMode) {}
    FirebaseAuth auth = FirebaseAuth.instance;

    UserCredentialsController.userRole =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.userRoleKey);
    UserCredentialsController.batchId =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.batchIdKey);
    UserCredentialsController.schoolId =
        SharedPreferencesHelper.getString(SharedPreferencesHelper.schoolIdKey);
    UserCredentialsController.schoolName = SharedPreferencesHelper.getString(
        SharedPreferencesHelper.schoolNameKey);

    if (auth.currentUser == null) {
      if (kDebugMode) {
        print("Google Auth null");
      }
      Get.offAll(() => const MainScreen());
    } else {
      if (UserCredentialsController.userRole == 'admin') {
        log("SchoolID :  ${UserCredentialsController.schoolId}");
        log("BatchID :  ${UserCredentialsController.batchId}");
        log("userrole :  ${UserCredentialsController.userRole}");
        checkAdmin();
        Get.offAll(() => const AdminHomeScreen());
      } else {
        if (kDebugMode) {
          print("shared pref Auth null");
        }
        Get.offAll(() => const MainScreen());
      }
    }
  }
}

Future<void> checkAdmin() async {
  if (UserCredentialsController.userRole == "" &&
      UserCredentialsController.batchId == "" &&
      UserCredentialsController.schoolId == "") {
    logoutUser();
    Get.offAll(() => SplashScreen());
  }
}
