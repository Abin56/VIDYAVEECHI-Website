import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/registration_controller/registation_controller.dart';
import 'package:vidyaveechi_website/model/registation_student_count_model.dart/registration_studentCount_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

notificationShowingFunctionOnAppBar(BuildContext context) {
 // final Map<String, dynamic> data;
  aweSideSheet(
      context: context,
      sheetPosition: SheetPosition.right,
      title: "Notifications",
      body: SingleChildScrollView(
        // child: DefaultTabController(
        //   length: 2,
        child: Column(
          children: [
            // const TabBar(
            //   dividerColor: Colors.transparent,
            //   tabs: <Widget>[
            //     Tab(
            //       text: 'All Notifications',
            //       // icon: Icon(Icons.flight),
            //     ),
            //     Tab(
            //       text: 'New Notifications',
            //       // icon: Icon(Icons.flight),
            //     ),
            //   ],
            // ),
            Container(
              height: 500,
              child:
                  //   TabBarView(
                  //children: [
                  Container(
                color: themeColorGreen.withOpacity(0.1),
                height: 300,
                child: StreamBuilder(
                    stream: server
                        .collection('SchoolListCollection')
                        .doc(UserCredentialsController.schoolId)
                        .collection(UserCredentialsController.batchId!)
                        .doc(UserCredentialsController.batchId!)
                        .collection('classes')
                        .doc(Get.find<RegistrationController>()
                            .classRegClassID
                            .value)
                        .collection('RegTemp_Students')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final data= StudentModel.fromMap(
                                          snapshot.data!.docs[index].data());
                            return GestureDetector(
                              onTap: () {},
                              child: 
                              ListTile(
                                title: Text('New',
                               //   '${data['studentName']}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold), 
                                ),
                                subtitle:
                                //  StreamBuilder(
                                //     stream: server
                                //         .collection('SchoolListCollection')
                                //         .doc(UserCredentialsController.schoolId)
                                //         .collection(   UserCredentialsController.batchId!)
                                //         .doc(UserCredentialsController.batchId!)
                                //         .collection('classes')
                                //         .doc(data['classId'])
                                //         .snapshots(),
                                //     builder: (context, classsnap) {
                                //       if (classsnap.hasData) {
                                //         return 
                                        Text(data.studentName,
                                         // '${classsnap.data!.data()!['className']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        //
                                    //   } else {
                                    //     return circularProgressIndicator;
                                    //   }
                                    // }),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 0.1,
                              color: const Color.fromARGB(255, 12, 94, 14),
                            );
                          },
                          itemCount: snapshot.data!.docs.length);
                    }),
              ),
              // Container(
              //   color: themeColorGreen.withOpacity(0.1),
              //   height: 300,
              //   child: ListView.separated(
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //           onTap: () {},
              //           child: const ListTile(
              //             title: Text(
              //               'Title',
              //               style: TextStyle(
              //                   fontSize: 12, fontWeight: FontWeight.bold),
              //             ),
              //             subtitle: Text(
              //               'Notifications',
              //               style: TextStyle(fontSize: 11),
              //             ),
              //           ),
              //         );
              //       },
              //       separatorBuilder: (context, index) {
              //         return Container(
              //           height: 0.1,
              //           color: const Color.fromARGB(255, 12, 94, 14),
              //         );
              //       },
              //       itemCount: 20),
              // ),
              //  ]),
            ),
          ],
        ),
        // ),
      ),
      showCloseButton: false,
      footer: Container());
}
