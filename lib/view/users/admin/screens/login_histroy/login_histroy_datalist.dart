import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/loginHistory_model/login_history_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class AllLoginLogoutDataList extends StatelessWidget {
  final int index;
  final AdminLoginDetailHistoryModel data;
  const AllLoginLogoutDataList({
    required this.index,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? const Color.fromARGB(255, 246, 246, 246)
            : Colors.blue[50],
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
                headerTitle: '${index + 1}'), //....................No
          ),
          const SizedBox(
            width: 01,
          ),
          // Expanded(
          //   flex: 2,
          //   child: DataContainerWidget(
          //       rowMainAccess: MainAxisAlignment.center,
          //       color: cWhite,
          //       index: index,
          //       headerTitle: "99578"),
          // ), //................................................. Parent ID
          // const SizedBox(
          //   width: 01,
          // ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
               
                Expanded(
                  child: TextFontWidget(
                    text: "  ${data.adminuserName}",
                    // "  Name of the Person",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //........................................... Parent Name
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
               
                Expanded(
                  child: TextFontWidget(
                    text: "  ${data.adminuserName}",
                    //  "  @gmail.com",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), // ................................... Parent Email
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                
                const Expanded(
                  child: TextFontWidget(
                    text:
                    // "  ${data.loginTime}",
                      "  12:45 pm",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //....................................... parent Phone Number
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                
                Expanded(
                  child: TextFontWidget(
                    text: "  ${data.logoutTime}",
                    fontsize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ), //............................. Student Class

          const SizedBox(
            width: 01,
          ),
          // Expanded(
          //   flex: 3,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: 15,
          //         child: Image.asset(
          //           'webassets/png/active.png',
          //         ),
          //       ),
          //       const TextFontWidget(
          //         text: "  Active",
          //         fontsize: 12,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ],
          //   ),
          // ), //............................. Status [Active or DeActivate]
        ],
      ),
    );
  }
}
