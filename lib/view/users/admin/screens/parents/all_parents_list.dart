import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/parent_controller/parent_controller.dart';
import 'package:vidyaveechi_website/controller/all_parents_controller/all_parents_controller.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/create_parent/create_parent.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/list_table/list_table_of_prnt.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/parent_details/parent_details.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class AllParentsListContainer extends StatelessWidget {
  final ParentController parentController = Get.put(ParentController());
  final AllParentsController allParentController =
      Get.put(AllParentsController());
  AllParentsListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => parentController.ontapviewParent.value == true
        ? ParentDetailsContainer()
        : parentController.ontapParent.value == true
            ? CreateParent()
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
                          padding: EdgeInsets.only(left: 25, top: 25),
                          child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: TextFontWidget(
                              text: 'All Parent List',
                              fontsize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 05),
                                child: RouteSelectedTextContainer(
                                    title: 'All Parents'),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  parentController.ontapParent.value = true;
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 25, top: 5),
                                  child: ButtonContainerWidget(
                                      curving: 30,
                                      colorindex: 0,
                                      height: 35,
                                      width: 150,
                                      child: const Center(
                                        child: TextFontWidgetRouter(
                                          text: 'Create New Parent',
                                          fontsize: 12,
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            color: cWhite,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                color: cWhite,
                                height: 40,
                                child: const Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: CatrgoryTableHeaderWidget(
                                            headerTitle: 'No')),
                                    SizedBox(
                                      width: 01,
                                    ),
                                    // Expanded(
                                    //     flex: 2,
                                    //     child: CatrgoryTableHeaderWidget(
                                    //         headerTitle: 'ID')),
                                    // SizedBox(
                                    //   width: 01,
                                    // ),
                                    Expanded(
                                        flex: 4,
                                        child: CatrgoryTableHeaderWidget(
                                            headerTitle: 'Name')),
                                    SizedBox(
                                      width: 02,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: CatrgoryTableHeaderWidget(
                                            headerTitle: 'E mail')),
                                    SizedBox(
                                      width: 02,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: CatrgoryTableHeaderWidget(
                                            headerTitle: 'Ph.No')),
                                    SizedBox(
                                      width: 02,
                                    ),

                                    Expanded(
                                        flex: 3,
                                        child: CatrgoryTableHeaderWidget(
                                            headerTitle: 'Class ')),
                                    SizedBox(
                                      width: 02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              //  width: 1150,
                              decoration: BoxDecoration(
                                color: cWhite,
                                border: Border.all(color: cWhite),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: SizedBox(
                                  // width: 1100,
                                  child: StreamBuilder<List<ParentModel>>(
                                    stream: allParentController
                                        .fetchAllParentDetails(),
                                    builder: (context, snapshot) {
                                      final parentDetailsList = snapshot.data;

                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.hasError) {
                                        return const Center(
                                          child: Text('Error fetching data'),
                                        );
                                      } else if (parentDetailsList == null ||
                                          parentDetailsList.isEmpty) {
                                        return const Center(
                                          child: Text(
                                              'No parent details available'),
                                        );
                                      }

                                      return ListView.separated(
                                          itemBuilder: (context, index) {
                                            final parent =
                                                parentDetailsList[index];
                                            return GestureDetector(
                                              onTap: () {
                                                parentController.parentModelData
                                                    .value = parent;
                                                parentController.ontapviewParent
                                                    .value = true;
                                              },
                                              child: AllParentsDataList(
                                                index: index,
                                                data: parent,
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              height: 02,
                                            );
                                          },
                                          itemCount: parentDetailsList.length);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
