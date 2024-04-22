import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/admin_details_controller/admin_details_controller.dart';

import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AdminDataList extends StatelessWidget {
  // final AdminDetailsModel data;

  final int index;
  AdminDataList({
    // required this.data,
    required this.index,
    super.key,
  });
  final adminDetailsController adminController = Get.put(adminDetailsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: index % 2 == 0 ? const Color.fromARGB(255, 246, 246, 246) : Colors.blue[50],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                // width: 150,
                index: index,
                headerTitle: '${index + 1}'),
          ),
          const SizedBox(
            width: 01,
          ),

          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Image.asset(
                      'webassets/stickers/icons8-student-100 (1).png',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFontWidget(
                      text: 'Admin',
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                  child: Center(
                    child: Image.asset(
                      'webassets/png/gmail.png',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFontWidget(
                      text: "Admin@gmail.com",
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),  
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                  child: Center(
                    child: Image.asset(
                      'webassets/png/telephone.png',
                    ),
                  ),
                ),
                 Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFontWidget(
                      text: " 987654321",
                      fontsize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: Obx(() {
              final isActive = adminController.active.value;
              return GestureDetector(
                onTap: () {
                  adminController.active.toggle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                      child: Image.asset(
                        isActive ? 'webassets/png/active.png' : 'webassets/png/turnofficon.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFontWidget(
                        text: isActive ? "Active" : "Deactive",
                        fontsize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
