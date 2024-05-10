import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:vidyaveechi_website/controller/admin_section/student_controller/student_controller.dart';
import 'package:vidyaveechi_website/view/constantvalidate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/card%20registration/table.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

import '../../../../../card/controller/card_controller.dart';
import '../../../../../card/view/assigning process/assigning_process.dart';
import '../../../../../controller/notification_controller/notification_Controller.dart';
import '../../../../constant/const.dart';
import '../../../../widgets/notification_color/notification_color_widget.dart';

class CardRegistration extends StatefulWidget {
  final StudentController cntrl = Get.put(StudentController());
    final NotificationController noticntrl = Get.put(NotificationController());
   
  CardRegistration({super.key});

  @override
  State<CardRegistration> createState() => _CardRegistrationState();
}

class _CardRegistrationState extends State<CardRegistration> {
  final String cardID = "";
  final String deviceID = "";
  final int timeStamp = 0;
  String studentId = '';

  late DatabaseReference databaseReference;
  late final dref = FirebaseDatabase.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    databaseReference = dref.ref().child("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Card Registration"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Text(cardID),
              //Text(deviceID),
              //Text(timeStamp.toString()),
          
              StreamBuilder(
                stream: FirebaseDatabase.instance.ref().child("json/uid").onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data?.snapshot.value as Map?;
                    print(data);
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
          
                    //addDataToFirebase(cardId, deviceId, time);
          
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                              child: Column(
                                children: [
                                  ListTile(
                                      leading: const Icon(Icons.circle),
                                      title: GooglePoppinsWidgets(
                                          text: 'Card Id', fontsize: 12),
                                      subtitle: GooglePoppinsWidgets(
                                          text: 'Card ID: $cardId',
                                          fontsize: 18)),
                                  ListTile(
                                      leading: const Icon(Icons.circle),
                                      title: GooglePoppinsWidgets(
                                          text: 'Time', fontsize: 12),
                                      subtitle: GooglePoppinsWidgets(
                                          text: 'TIME : $time \n $input',
                                          fontsize: 18)),
                                  ListTile(
                                      leading: const Icon(Icons.circle),
                                      title: GooglePoppinsWidgets(
                                          text: 'DeviceID', fontsize: 12),
                                      subtitle: GooglePoppinsWidgets(
                                          text: 'DeviceID: $deviceId',
                                          fontsize: 18)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  GooglePoppinsWidgets(
                                      text: 'Assign cards for each ad.no',
                                      fontsize: 18),
                                  sh10,
                                  AdmissionNumberAssigning(),
                                  GestureDetector(
                                    onTap: () async {
                                      addDataToFirebase(cardId, deviceId, time,input);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.purple[200],
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child:
                                            const Center(child: Text("Register")),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
              ),sh30,ListofCard()
            ],
          ),
        ),
        );
  }

  Future<void> addDataToFirebase(
      String cardId, String deviceId, String time,String input) async {
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
            'Time': time+input,
          }, SetOptions(merge: true));
          //  Get.find<NotificationController>()
          //     .userStudentNotification(
          //         studentID:value.docs[i].data()['docid'],
          //         icon: cardNotifierSetup().icon,
          //         messageText: "${value.docs[i].data()['studentName'] } is onboarded at ${time+input}",
          //         // ,
          //         headerText: "Onboarding",
          //         whiteshadeColor: cardNotifierSetup().whiteshadeColor,
          //         containerColor: cardNotifierSetup().containerColor);
          
                          Get.find<NotificationController>().userparentNotification(
                parentID: value.docs[i].data()['parentId'],
                icon: cardNotifierSetup().icon,
                messageText:
                    'Your child ${value.docs[i].data()['studentName']  } is onboarded at ${time+input} ',
                headerText:
                    "Onboarding",
                whiteshadeColor: cardNotifierSetup().whiteshadeColor,
                containerColor: cardNotifierSetup().containerColor).then((value) => showToast(msg: 'Card Registered'));
                print("${   value.docs[i].data()['parentId']     }");
        } else {
          print(false);
        }
      }
    });


  }

  
}
