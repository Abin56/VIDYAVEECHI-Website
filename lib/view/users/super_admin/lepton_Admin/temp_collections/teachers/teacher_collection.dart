import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/users/super_admin/widgets/buttonContainer.dart';

import '../../../controllers/temp_Collection_controller/temp_teacher_controller/temp_teacher_controller.dart';

class TeacherTempCollection extends StatelessWidget {
 final TempTeacherController tempTeacherController =
      Get.put(TempTeacherController());
 final String schoolID;
  TeacherTempCollection({super.key, required this.schoolID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: 200,
            color: const Color.fromARGB(255, 160, 219, 162),
            child: const Row(
              children: [],
            ),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('SchoolListCollection')
                      .doc(schoolID)
                      .collection('TempTeacherList')
                      .orderBy('teacherName', descending: false)
                      .snapshots(),
                  builder: (context, snaps) {
                    if (snaps.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 60,
                                color: const Color.fromARGB(255, 190, 220, 245),
                                child: Row(
                                  children: [
                                    const SizedBox(height: 10,),
                                    Text('${index + 1}'),
                                    const SizedBox(height: 10,),
                                    Text(
                                        snaps.data!.docs[index]['teacherName']),
                                    IconButton(
                                        onPressed: () async {
                                          await tempTeacherController
                                              .updateName(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    const Spacer(),
                                    Text(
                                        'Ph :  ${snaps.data!.docs[index]['teacherPhNo']}'),
                                    IconButton(
                                        onPressed: () async {
                                          await tempTeacherController
                                              .updatePhoneNumber(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    const Spacer(),
                                    Text(
                                        'ID :  ${snaps.data!.docs[index]['employeeID']}'),
                                    IconButton(
                                        onPressed: () async {
                                          await tempTeacherController
                                              .updateAdmissionNumber(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await tempTeacherController
                                              .removeStudent(
                                                  context: context,
                                                  schoolID: schoolID,
                                                  teacherDocID: snaps.data!
                                                      .docs[index]['docid']);
                                        },
                                        child: ButtonContainerWidget(
                                            curving: 5,
                                            colorindex: 6,
                                            height: 35,
                                            width: 100,
                                            child: const Center(
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 8,
                            );
                          },
                          itemCount: snaps.data!.docs.length);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  })),
        ],
      ),
    ));
  }
}
