import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

import '../controller/card_controller.dart';
import 'assigning process/assigning_process.dart';

// String device = "";
// String card = "";
// String timeNow = "";

class Attendance1 extends StatefulWidget {
  final StudentController cntrl = Get.put(StudentController());
  Attendance1({super.key});

  @override
  State<Attendance1> createState() => _Attendance1State();
}

class _Attendance1State extends State<Attendance1> {
  //  final CardController cardcontroller = Get.put(CardController());
  // final SignupController signupController = Get.put(SignupController());

  final String cardID = "";
  final String deviceID = "";
  final int timeStamp = 0;
  String studentId = '';

  late DatabaseReference databaseReference;
  late final dref = FirebaseDatabase.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference = dref.ref().child("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Values from device"),
        ),
        body: Column(
          children: [
            //Text(cardID),
            //Text(deviceID),
            //Text(timeStamp.toString()),

            StreamBuilder(
              stream: databaseReference.child("json/uid").onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data?.snapshot.value as Map?;

                  if (data == null) {
                    return const Text('No data');
                  }

                  final cardId = data['cardId'];
                  final timestamp = data['ts'];
                  final deviceId = data['deviceId'];

                  var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
                  var input = DateFormat('hh:mm a').format(dt);
                  var time = DateFormat.yMMMMEEEEd().format(dt);

                  // device = deviceId;
                  // card = cardId;
                  // timeNow = time;
                  // NewPage(cardId: cardId, time: time, deviceId: deviceId);

                   addDataToFirebase(cardId, deviceId, time);

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(color: cred,
                          child: Column(children: [
                          Text('Card ID: $cardId'),
                        Text('TIME : $time \n $input'),
                        Text('DeviceID: $deviceId'),
                        ],),),
                      ),
                      GestureDetector(
                        child: Container(color: cBlue,
                          child: Column(children: [  AdmissionNumberAssigning(),
                          GestureDetector(
                            onTap: () async {
                              addDataToFirebase(cardId, deviceId, time);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 50,
                                width: 500,
                                decoration: BoxDecoration(
                                  color: Colors.purple[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(child: Text("Register")),
                              ),
                            ),
                          ),],),),
                      )
                    ],
                  );
                }
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return Text(snapshot.error.toString());
                }

                return const Text('....');
              },
            )
          ],
        ));
  }

  Future<void> addDataToFirebase(
      String cardId, String deviceId, String time) async {
    final CardController cardController = Get.put(CardController());
    final String adnumber = '000${cardController.onTapValue.value}';
    print(adnumber);

    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection('AllStudents')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        if (adnumber == value.docs[i].data()['admissionNumber']) {
          print(true);
          server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection('AllStudents')
              .doc(value.docs[i].data()['docid'])
              .set({
            'CardId': cardId,
            'DeviceId': deviceId,
            'Time': time,
          }, SetOptions(merge: true));
        } else {
          print(false);
        }
      }
    });

    // QuerySnapshot querySnapshot =
    //     await studentsCollection.where('${Get.find<StudentController>().stAdNumber.value}',isEqualTo: 'admissionNumber' ).get();

    // if (querySnapshot.docs.isNotEmpty) {
    //   for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
    //     await documentSnapshot.reference.update({
    //       'CardId': cardId,
    //       'DeviceId': deviceId,
    //       'Time': time,
    //     }).then((_) {
    //       print(
    //           'Data updated successfully for student with ID: ${documentSnapshot.id}');
    //     }).catchError((error) {
    //       print('Failed to update data: $error');
    //     });
    //   }
    // } else {
    //   print('No students found with ID $cardId.');
    // }
  }

  // Future<void> searchStudentsByName(BuildContext context) async {
  //   signupController.fetchAllStudents();
  //   await showSearch(context: context, delegate: UserDetails());
  // }
}
