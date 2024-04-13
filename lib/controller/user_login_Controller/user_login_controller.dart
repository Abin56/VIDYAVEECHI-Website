import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/splash_screen/splash_screen.dart';
import 'package:vidyaveechi_website/view/users/teacher/teacher.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/utils/utils.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';

class UserLoginController extends GetxController {
  final GlobalKey<FormState> _secondFormkey = GlobalKey<FormState>();
  late AnimationController animationctr;
  late Animation colorAnimation;

  RxBool loginontapped = false.obs;
  RxBool lodingContainer = false.obs;
  RxBool isLoading = RxBool(false);

  RxString userUID = ''.obs;
  final TextEditingController userEmailIDController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  String schoolID = schoolListValue?['docid'];
  String schoolName = schoolListValue?['schoolName'];

  Future<bool> secondaryAdminLogin() async {
    //....... .......................................Secondary Admin Login Function
    try {
      final user =
          await server.collection('SchoolListCollection').doc(schoolID).get();
      await serverAuth
          .signInWithEmailAndPassword(
              email: userEmailIDController.text.trim(),
              password: userPasswordController.text.trim())
          .then((value) async {
        final result = await server
            .collection('SchoolListCollection')
            .doc(schoolID)
            .collection('Admins')
            .where('docid', isEqualTo: userUID.value)
            .get();
        if (result.docs.isNotEmpty) {
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.userRoleKey, 'admin');
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.batchIdKey, schoolID);
          await SharedPreferencesHelper.setString(
              SharedPreferencesHelper.schoolNameKey, schoolName);
          await SharedPreferencesHelper.setString(
                  SharedPreferencesHelper.batchIdKey, user.data()?['batchYear'])
              .then((value) async {
            userEmailIDController.clear();
            userPasswordController.clear();
            Get.offAll(() => SplashScreen());
          });
        } else if (result.docs.isEmpty) {
          showToast(msg: "Admin login failed");
        } else {
          showToast(msg: "Secondary-Admin login failed");
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: "Secondary-Admin login failed");
    }
    return true;
  }

  Future<void> adminLoginController(BuildContext context) async {
    //....... ........................................Admin  Login Function
    try {
      final user =
          await server.collection('SchoolListCollection').doc(schoolID).get();
      await serverAuth
          .signInWithEmailAndPassword(
              email: userEmailIDController.text.trim(),
              password: userPasswordController.text.trim())
          .then((value) async {
        userUID.value = value.user!.uid;
        if (user.data()?['batchYear'] == '') {
          setBatchYear(context);
        } else {
          if (userUID.value == schoolID) {
            await SharedPreferencesHelper.setString(
                SharedPreferencesHelper.userRoleKey, 'admin');
            await SharedPreferencesHelper.setString(
                SharedPreferencesHelper.schoolIdKey, schoolID);
            await SharedPreferencesHelper.setString(
                SharedPreferencesHelper.schoolNameKey, schoolName);
            await SharedPreferencesHelper.setString(
                    SharedPreferencesHelper.batchIdKey,
                    user.data()!['batchYear'])
                .then((value) async {
              log("SchoolID :  ${UserCredentialsController.schoolId}");
              log("BatchID :  ${UserCredentialsController.batchId}");
              log("userrole :  ${UserCredentialsController.userRole}");
              userEmailIDController.clear();
              userPasswordController.clear();
              Get.offAll(() => SplashScreen());
            });
          } else {
            await secondaryAdminLogin();
          }
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: "School Login failed !!");
    }
  }

  Future<void> teacherLoginController() async {
    //....... ........................................teacher  Login Function

    try {
      serverAuth
          .signInWithEmailAndPassword(
              email: userEmailIDController.text.trim(),
              password: userPasswordController.text.trim())
          .then((value) async {
        final result = await server
            .collection('SchoolListCollection')
            .doc(schoolID)
            .collection('Teachers')
            .where('docid', isEqualTo: userUID.value)
            .get();
        if (result.docs.isNotEmpty) {
          userEmailIDController.clear();
          userPasswordController.clear();
          Get.offAll(() => const TeacherHomePage());
        } else if (result.docs.isEmpty) {
          showToast(msg: "No Results Found !!");
        } else {
          showToast(msg: "Login failed");
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: "School Login failed !!");
    }
  }

  Future<void> studentLoginController() async {
    //....... ........................................teacher  Login Function

    try {
      serverAuth
          .signInWithEmailAndPassword(
              email: userEmailIDController.text.trim(),
              password: userPasswordController.text.trim())
          .then((value) async {
        final result = await server
            .collection('SchoolListCollection')
            .doc(schoolID)
            .collection('Teachers')
            .where('docid', isEqualTo: userUID.value)
            .get();
        if (result.docs.isNotEmpty) {
          userEmailIDController.clear();
          userPasswordController.clear();
          Get.offAll(() => const TeacherHomePage());
        } else if (result.docs.isEmpty) {
          showToast(msg: "No Results Found !!");
        } else {
          showToast(msg: "Login failed");
        }
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          isLoading.value = false;
          handleFirebaseError(error);
        }
      });
    } catch (e) {
      log(e.toString());
      showToast(msg: "School Login failed !!");
    }
  }

  Future<void> parentLoginController() async {
    //....... ........................................teacher  Login Function

    try {
      // userLoginFunction().then((value) async {
      //   server
      //       .collection('SchoolListCollection')
      //       .doc(schoolID)
      //       .collection('Teachers')
      //       .where('docid', isEqualTo: userUID.value);
      //   if (parentAuth.value == true) {
      //     showToast(msg: "Teacher Login Success");

      //     teacherAuth.value = false;
      //     userEmailIDController.clear();
      //     userPasswordController.clear();
      //     Get.offAll(() => const ParentHomePage());
      //   } else {
      //     showToast(msg: "School Login failed !!");
      //   }
      // });
    } catch (e) {
      log(e.toString());
      showToast(msg: "School Login failed !!");
    }
  }

  //////////////////////////////////

  TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();
  final Rxn<DateTime> _selectedDateForApplyDate = Rxn<DateTime>();
  final Rxn<DateTime> _selectedToDate = Rxn<DateTime>();
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateForApplyDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDateForApplyDate.value) {
      _selectedDateForApplyDate.value = picked;
      DateTime parseDate =
          DateTime.parse(_selectedDateForApplyDate.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM');
      String formatted = formatter.format(parseDate);

      applynewBatchYearContoller.text = formatted.toString();
      log(formatted.toString());
    }
  }

  _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedToDate.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      // builder: (context, child) {},
    );
    if (picked != null && picked != _selectedToDate.value) {
      _selectedToDate.value = picked;
      DateTime parseDate = DateTime.parse(_selectedToDate.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM');
      String formatted = formatter.format(parseDate);

      selectedToDaterContoller.text = formatted.toString();
      log(formatted.toString());
    }
  }

  setBatchYear(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: _secondFormkey,
          child: AlertDialog(
            title: const Text('Add BatchYear'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (applynewBatchYearContoller.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: applynewBatchYearContoller,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: const InputDecoration(
                      labelText: 'DD-MM-YYYY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Icon(Icons.arrow_downward_outlined),
                  TextFormField(
                    controller: selectedToDaterContoller,
                    validator: (value) {
                      if (selectedToDaterContoller.text.isEmpty) {
                        return 'Invalid';
                      } else {
                        return null;
                      }
                    },
                    readOnly: true,
                    onTap: () => _selectToDate(context),
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Create'),
                onPressed: () async {
                  if (_secondFormkey.currentState!.validate()) {
                    await server
                        .collection('SchoolListCollection')
                        .doc(schoolID)
                        .collection("BatchYear")
                        .doc(
                            '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
                        .set({
                      'id':
                          '${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
                    }).then((value) async {
                      await server
                          .collection('SchoolListCollection')
                          .doc(schoolID)
                          .set({
                        'batchYear':
                            "${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}"
                      }, SetOptions(merge: true)).then((value) {
                        return showDialog(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Message'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Batch added successfully, Please login again.')
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    html.window.location.reload();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      });
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
