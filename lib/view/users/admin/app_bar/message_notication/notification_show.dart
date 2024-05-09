import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';

import '../../../../../controller/registration_controller/registation_controller.dart';
import '../../../../utils/shared_pref/user_auth/user_credentials.dart';

notificationShowingFunctionOnAppBar(BuildContext context,) {
  aweSideSheet(
      context: context,
      sheetPosition: SheetPosition.right,
      title: "Notifications",
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                dividerColor: Colors.transparent,
                tabs: <Widget>[
                  Tab(
                    text: 'All Notifications',
                    // icon: Icon(Icons.flight),
                  ),
                  Tab(
                    text: 'New Notifications',
                    // icon: Icon(Icons.flight),
                  ),
                ],
              ),
              SizedBox(
                height: 500,
                child: TabBarView(children: [
                  Container(
                    color: themeColorGreen.withOpacity(0.1),
                    height: 300,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: const ListTile(
                              title: Text(
                                'Title',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Notifications',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 0.1,
                            color: const Color.fromARGB(255, 12, 94, 14),
                          );
                        },
                        itemCount: 20),
                  ),
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
                            .doc(
                              Get.find<RegistrationController>()
                                .classRegClassID
                                .value
                                )
                            .collection('RegTemp_Students')

                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print(UserCredentialsController.schoolId);
                            print(UserCredentialsController.batchId!);
                            print(
                              Get.find<RegistrationController>()
                                .classRegClassID
                                .value
                                );
                                 print(snapshot.data!.docs.length);

                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  final data =
                                      snapshot.data!.docs[index].data();
                                  print(data['studentName']);
                                  return GestureDetector(
                                    onTap: () {},
                                    child: ListTile(
                                      title: Text(
                                        '${data['studentName']}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: const Text(
                                        'Notifications',
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 0.1,
                                    color:
                                        const Color.fromARGB(255, 12, 94, 14),
                                  );
                                },
                                itemCount: snapshot.data!.docs.length);
                          } else {
                            return const Text('No data found');
                          }
                        }),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      showCloseButton: false,
      footer: Container());
}
