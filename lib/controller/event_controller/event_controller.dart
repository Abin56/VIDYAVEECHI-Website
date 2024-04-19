import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:uuid/uuid.dart';  
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/all_event_view.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class EventController extends GetxController {
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
  TextEditingController eventnameController = TextEditingController();
 // TextEditingController eventdateController = TextEditingController();
  TextEditingController eventdescriptionController = TextEditingController();
  TextEditingController eventvenueController = TextEditingController();
  TextEditingController eventsignedByController = TextEditingController();
  final formKey = GlobalKey<FormState>();
   final Rxn<DateTime> dateSelected = Rxn<DateTime>();
    final Rx<String> eventdateController = ''.obs;
   
  //EventModel? model;

  Future<void> createEvent() async {
    final uuid =const  Uuid().v1();
    final eventDetails = EventModel(
        eventDate: eventdateController.value,
        eventName: eventnameController.text,
        eventDescription: eventdescriptionController.text,
        venue: eventvenueController.text,
        signedBy: eventsignedByController.text,
        id: uuid
        );

    // final Map<String, dynamic> eventData = eventDetails.toMap();

    try {
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('AdminEvents')
          .doc(eventDetails.id)
          .set(eventDetails.toMap())
          .then((value) async {
        eventnameController.clear();
        eventdateController.value = '';
        eventdescriptionController.clear();
        eventvenueController.clear();
        eventsignedByController.clear();
        buttonstate.value = ButtonState.success;
        print(UserCredentialsController.batchId!);
        print(eventDetails.id);

        showToast(msg: "Event Created Successfully");
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

  Future<void> updateEvent(String eventData,String eventName,
    String eventDescription,String venue,String signedBy,
    String id,BuildContext context) async {
    // ignore: unused_local_variable
   // String edit = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminEvents')
        .doc(id)
        .update({
          'eventDate': eventController.eventdateController.value,
          'eventName': eventController.eventnameController.text,
          'eventDescription': eventController.eventdescriptionController.text,
          'venue': eventController.eventvenueController.text,
          'signedBy': eventController.eventsignedByController.text,
        })
        .then((value) => Navigator.pop(context ))
        .then((value) => showToast(msg: 'Event Updated!'));
  }

  Future<void> deleteEvent(String id,BuildContext context)async{
     // ignore: unused_local_variable
   //  String delete = snapshot.data!.docs[index]['eventName'];
    server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('AdminEvents')
        .doc(id)
        .delete()
        .then((value) => Navigator.pop(context ));
  }


   selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateSelected.value ?? DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2100),
      // builder: (context, child) {
      //   return Container();
      // },
    );
    if (picked != null && picked != dateSelected.value) {
      dateSelected.value = picked;
      DateTime parseDate = DateTime.parse(dateSelected.value.toString());
      final DateFormat formatter = DateFormat('yyyy-MMMM-dd');
      String formatted = formatter.format(parseDate);

      eventdateController.value = formatted.toString();
      log(formatted.toString());
    }
  }
}
