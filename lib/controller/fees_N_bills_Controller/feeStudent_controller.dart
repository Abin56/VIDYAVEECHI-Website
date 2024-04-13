import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/fees_N_bills_Controller/fees_bills_controller.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class StudentFeeController extends GetxController {
  final RxMap<String, dynamic> studentdata = {'': ''}.obs;
  TextEditingController updateFeeController = TextEditingController();

  Future<void> feeEditController(
    String studentID,
    bool status,
  ) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(Get.find<FeesAndBillsController>().feeMonthData.value)
        .collection(Get.find<FeesAndBillsController>().feeMonthData.value)
        .doc(Get.find<FeesAndBillsController>().feeDateData.value)
        .collection('Students')
        .doc(studentID)
        .update({
      "editFee": status,
    }).then((value) async {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('FeesCollection')
          .doc(Get.find<FeesAndBillsController>().feeMonthData.value)
          .collection(Get.find<FeesAndBillsController>().feeMonthData.value)
          .doc(Get.find<FeesAndBillsController>().feeDateData.value)
          .collection('Students')
          .doc(studentID)
          .get()
          .then((value) async {
        if (value.data()!['feepaid'] == true) {
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('FeesCollection')
              .doc(Get.find<FeesAndBillsController>().feeMonthData.value)
              .collection(Get.find<FeesAndBillsController>().feeMonthData.value)
              .doc(Get.find<FeesAndBillsController>().feeDateData.value)
              .collection('Students')
              .doc(studentID)
              .update({'paid': value.data()!['fee']});
        }
      });
    });
  }

  Future<void> updateStudentFeeInFeeBill(String studentID) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(Get.find<FeesAndBillsController>().feeMonthData.value)
        .collection(Get.find<FeesAndBillsController>().feeMonthData.value)
        .doc(Get.find<FeesAndBillsController>().feeDateData.value)
        .collection('Students')
        .doc(studentID)
        .update({'fee': int.parse(updateFeeController.text.trim())}).then(
            (value) => feeEditController(studentID, false));
  }

  Future<void> updateStudentFeeStatus(
      String studentID, bool status, int fee) async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('FeesCollection')
        .doc(Get.find<FeesAndBillsController>().feeMonthData.value)
        .collection(Get.find<FeesAndBillsController>().feeMonthData.value)
        .doc(Get.find<FeesAndBillsController>().feeDateData.value)
        .collection('Students')
        .doc(studentID)
        .update({'feepaid': status, 'paid': fee});
  }
}
