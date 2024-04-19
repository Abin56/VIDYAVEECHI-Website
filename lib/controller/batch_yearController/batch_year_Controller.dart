import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/view/splash_screen/splash_screen.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class BatchYearController extends GetxController {
  List<String> allbatchList = [];
  RxString batchyearValue = ''.obs;
   DateTime? selectedDateForApplyDate;
  DateTime? selectedToDate;

    TextEditingController applynewBatchYearContoller = TextEditingController();
  TextEditingController selectedToDaterContoller = TextEditingController();

  Future<List<String>> fetchBatchyear() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection("BatchYear")
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['id'];
      allbatchList.add(list[i]);
    }
    return allbatchList;
  }
  

  Future<void> setBatchYear() async {
    await SharedPreferencesHelper.setString(
          SharedPreferencesHelper.batchIdKey, batchyearValue.value)
        .then((value) async {
      Get.offAll(() => SplashScreen());
    });
  }

Future<void> createBatchYear(BuildContext context )async {
    await server
         .collection("SchoolListCollection")
         .doc(UserCredentialsController.schoolId)
         .collection("BatchYear")
         .doc('${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}')
         .set({'id':'${applynewBatchYearContoller.text.trim()}-${selectedToDaterContoller.text.trim()}'
     }).then((value) {
       Navigator.of(context).pop();
      // Navigator.of(context).pop();
     });
}
  
  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateForApplyDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDateForApplyDate) {
     
        selectedDateForApplyDate = picked;
        DateTime parseDate = DateTime.parse(selectedDateForApplyDate.toString());
        final DateFormat formatter = DateFormat('yyyy-MMMM');
        String formatted = formatter.format(parseDate);

        applynewBatchYearContoller.text = formatted.toString();
        log(formatted.toString());
    
    }
  }

  selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedToDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedToDate) {
    
        selectedToDate = picked;
        DateTime parseDate = DateTime.parse(selectedToDate.toString());
        final DateFormat formatter = DateFormat('yyyy-MMMM');
        String formatted = formatter.format(parseDate);

        selectedToDaterContoller.text = formatted.toString();
        log(formatted.toString());
      
    }
  }

}
