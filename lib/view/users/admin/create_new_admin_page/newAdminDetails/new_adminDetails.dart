import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_section/admin_controller/admin_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/create_new_admin_page/create_admin.dart';

import 'package:vidyaveechi_website/view/users/admin/create_new_admin_page/newAdminDetails/adminList.dart';
import 'package:vidyaveechi_website/view/widgets/button_container/button_container.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

import 'package:vidyaveechi_website/view/widgets/table/table_widgets.dart';

class AllAdminListPage extends StatelessWidget {
    final AdminController adminController = Get.put(AdminController());
   AllAdminListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => adminController.ontapCreateAdmin.value == true
    ? CreateAdmin()
    :SingleChildScrollView(
      child: Container(
        height: 1200,
        width: 1200,
        color: const Color.fromARGB(255, 242, 236, 236),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 40,
                bottom: 30,
              ),
              child: Text(
                'List Of Admins',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 05, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    //   meetingController.ontapMeeting.value = true;
                                  },
                                  child: const RouteSelectedTextContainer(
                                      width: 150, title: 'ALL ADMINS'),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                 adminController.ontapCreateAdmin..value = true;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25, bottom: 5),
                                  child: ButtonContainerWidget(
                                      curving: 30,
                                      colorindex: 0,
                                      height: 35,
                                      width: 150,
                                      child: const Center(
                                        child: TextFontWidgetRouter(
                                          text: 'Create Admin',
                                          fontsize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: cWhite,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 1200,
                    height: 600,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            HeaderOfTable(text: "No.", flex: 2),
                            HeaderOfTable(text: "Admin Name", flex: 8),
                            HeaderOfTable(text: "Email", flex: 9),
                            HeaderOfTable(text: "Phone Number", flex: 8),
                            HeaderOfTable(text: "Active/Deactive", flex: 7),
                          ],
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return AdminDataList(index: index);
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 1,
                            ),
                            itemCount: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )
  );
  }
}
