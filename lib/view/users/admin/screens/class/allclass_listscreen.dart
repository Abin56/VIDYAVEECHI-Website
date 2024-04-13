import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/class_details/class_details.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/create_class/create_class.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/view_class_students/data_list.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/tableheaderWidget.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllClassListView extends StatelessWidget {
  final ClassController classController = Get.put(ClassController());
  AllClassListView({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // List<Widget> widgetlist = [];
        Obx(
      () => classController.ontapClass.value == true
          ? ClassDetailsContainer()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: screenContainerbackgroundColor,
                height: 1000,
                width: 1150,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFontWidget(
                            text: 'All Classes List',
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 05),
                              child: RouteSelectedTextContainer(
                                  title: 'All Classes'),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                createClassFunction(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15,bottom: 5),
                                child: ButtonContainerWidget(
                                    curving: 30,
                                    colorindex: 0,
                                    height: 40,
                                    width: 180,
                                    child: const Center(
                                      child: TextFontWidget(
                                        text: 'Create / E D I T',
                                        fontsize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: cWhite,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                         padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Container(
                          color: cWhite,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: TableHeaderWidget(headerTitle: 'No')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: TableHeaderWidget(headerTitle: 'Class')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: TableHeaderWidget(
                                        headerTitle: 'TotalStudents')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: TableHeaderWidget(headerTitle: 'Status')),
                                SizedBox(
                                  width: 01,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: TableHeaderWidget(headerTitle: 'Options')),
                                SizedBox(
                                  width: 01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Container(
                            width: 1200,
                            color: cWhite,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                              child: StreamBuilder(
                                stream: server
                                    .collection('SchoolListCollection')
                                    .doc(UserCredentialsController.schoolId)
                                    .collection(UserCredentialsController.batchId!)
                                    .doc(UserCredentialsController.batchId!)
                                    .collection('classes')
                                    .snapshots(),
                                builder: (context, snaps) {
                                  if (snaps.hasData) {
                                    if (snaps.data!.docs.isEmpty) {
                                      return const Center(
                                        child: TextFontWidget(
                                            text: "No class found add new classes",
                                            fontsize: 12.5),
                                      );
                                    } else {
                                      return ListView.separated(
                                          itemBuilder: (context, index) {
                                            final data = ClassModel.fromMap(
                                                snaps.data!.docs[index].data());
                                            return GestureDetector(
                                              onTap: () {
                                                classController
                                                    .classModelData.value = data;
                                                classController.ontapClass.value =
                                                    true;
                                              },
                                              child: ClassDataListWidget(
                                                data: data,
                                                index: index,
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              height: 02,
                                            );
                                          },
                                          itemCount: snaps.data!.docs.length);
                                    }
                                  } else {
                                    return circularProgressIndicator;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
