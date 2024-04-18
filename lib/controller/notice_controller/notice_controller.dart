import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/model/notice_model/notice_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class NoticeController extends GetxController {
  RxBool customValue = RxBool(false);
  RxBool studentValue = RxBool(false);
  RxBool parentValue = RxBool(false);
  RxBool teacherValue = RxBool(false);

   final formKey = GlobalKey<FormState>();

  Rx<ButtonState> buttonstate = ButtonState.idle.obs;

  final Rxn<DateTime> dateSelectedPublished = Rxn<DateTime>();
  final Rxn<DateTime> dateSelectedSubmission = Rxn<DateTime>();
  final Rxn<DateTime> dateSelectedOccasion = Rxn<DateTime>();

  final Rx<String> noticePublishedDateController = ''.obs;
  final Rx<String> noticeSubmissionDateController = ''.obs;
  final Rx<String> noticeOccasionDateController = ''.obs;

   TextEditingController noticeHeadingController = TextEditingController();
  // TextEditingController noticePublishedDateController = TextEditingController();
   TextEditingController noticeSubjectController = TextEditingController();
  // TextEditingController noticeDateofoccationontroller = TextEditingController();
 //  TextEditingController noticeDateofSubmissionontroller = TextEditingController();
   TextEditingController noticevenueController = TextEditingController();
   TextEditingController noticeGuestController = TextEditingController();
   TextEditingController noticeSignedByController = TextEditingController();

    Future<void> createNotice() async {
    final uuid =const  Uuid().v1();
    final noticeDetails = NoticeModel(
      subject: noticeSubjectController.text,
      publishedDate: noticePublishedDateController.value, 
      heading: noticeHeadingController.text, 
      dateofoccation: noticeOccasionDateController.value, 
      venue: noticevenueController.text, 
      chiefGuest: noticeGuestController.text, 
      dateOfSubmission: noticeSubmissionDateController.value, 
      signedBy: noticeSignedByController.text, 
      noticeId: uuid);

    // final Map<String, dynamic> eventData = eventDetails.toMap();

    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('AdminNotices')
          .doc(noticeDetails.noticeId)
          .set(noticeDetails.toMap())
          .then((value) async {
        noticeSubjectController.clear();
        noticePublishedDateController.value = '';
        noticeHeadingController.clear();
        noticeOccasionDateController.value = '';
        noticevenueController.clear();
        noticeGuestController.clear();
        noticeSubmissionDateController.value = '';
        noticeSignedByController.clear();
        buttonstate.value = ButtonState.success;
        print(UserCredentialsController.batchId!);


        showToast(msg: "Notice Created Successfully");
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }
   Future<void> updateNotice(String noticeId ,BuildContext context) async {
    // ignore: unused_local_variable
  //  String edit = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminNotices')
        .doc(noticeId)
        .update({
        'subject':  noticeSubjectController.text,
        'publishedDate': noticePublishedDateController.value,
        'heading': noticeHeadingController.text,
        'dateofoccation': noticeOccasionDateController.value,
        'venue': noticevenueController.text,
        'chiefGuest': noticeGuestController.text,
        'dateOfSubmission': noticeSubmissionDateController.value,
        'signedBy': noticeSignedByController.text,
        })
        .then((value) => Navigator.pop(context ))
        .then((value) => showToast(msg: 'Notice Updated!'));
  }

   Future<void> deleteNotice( String noticeId,BuildContext context)async{
    log("noticeId -----------$noticeId",);
     // ignore: unused_local_variable
    // String delete = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminNotices')
        .doc(noticeId)
        .delete()
        .then((value) => Navigator.pop(context ));
        
  }

  

   selectPublishedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateSelectedPublished.value ?? DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2100),
      // builder: (context, child) {
      //   return Container();
      // },
    );
    if (picked != null && picked != dateSelectedPublished.value) {
      dateSelectedPublished.value = picked;
      DateTime parseDate = DateTime.parse(dateSelectedPublished.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM-dd');
      String formatted = formatter.format(parseDate);

      noticePublishedDateController.value = formatted.toString();
      log(formatted.toString());
    }
  }

   selectSubmissionDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateSelectedSubmission.value ?? DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2100),
      // builder: (context, child) {
      //   return Container();
      // },
    );
    if (picked != null && picked != dateSelectedSubmission.value) {
      dateSelectedSubmission.value = picked;
      DateTime parseDate = DateTime.parse(dateSelectedSubmission.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM-dd');
      String formatted = formatter.format(parseDate);

      noticeSubmissionDateController.value = formatted.toString();
      log(formatted.toString());
    }
  }


 selectOccasionDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateSelectedOccasion.value ?? DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2100),
      // builder: (context, child) {
      //   return Container();
      // },
    );
    if (picked != null && picked != dateSelectedOccasion.value) {
      dateSelectedOccasion.value = picked;
      DateTime parseDate = DateTime.parse(dateSelectedOccasion.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM-dd');
      String formatted = formatter.format(parseDate);

      noticeOccasionDateController.value = formatted.toString();
      log(formatted.toString());
    }
  }
}