import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';

class LeaveApplicationData extends StatelessWidget {
  final int index;
  final dynamic data;
  final int compare;
  const LeaveApplicationData({
    required this.index,
    required this.data,
    super.key,
    required this.compare,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(child: Text('Leave Letter')),
              content: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  'To',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  'The Teacher',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  UserCredentialsController.schoolName ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Subject: Application For Leave',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  'Leave Type :${data['leaveResonType']}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Respected Sir,',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                const Text("I would like to inform you that due to",
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Text(
                  '${data['leaveReason']}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text("my child ${data['studentName']} would not be able to attend the classes ",
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Text(
                    'from ${data['leaveFromDate']} to ${data['leaveToDate']} . Therefore,I humbly request',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                const Text('you to grant leave.', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                const Text('Thanking You,', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                const Text('Yours sincerely,', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Text('${data['studentParent']}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Text('Date: ${data['applyLeaveDate']} ', style: const TextStyle(fontSize: 16))
              ]),
            );
          },
        );
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: index % 2 == 0 ? const Color.fromARGB(255, 246, 246, 246) : Colors.blue[50],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextFontWidget(
                  fontsize: 12,
                  color: cWhite,
                  // width: 150,
                  index: index,
                  text: '${index + 1}'), //....................No
            ),
            const SizedBox(
              width: 02,
            ),
            Expanded(
              flex: 2,
              child: TextFontWidget(
                  fontsize: 12, color: cWhite, index: index, text: data['id'] ?? 'List is Empty'),
            ), //................................................. Student ID
            const SizedBox(
              width: 02,
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
                  const SizedBox(
                    width: 05,
                  ),
                  Expanded(
                    child: DataContainerWidget(
                      headerTitle: data['studentName'] ?? 'List is Empty',
                      rowMainAccess: MainAxisAlignment.start,
                      index: index,
                    ),
                  ),
                ],
              ),
            ), //........................................... Teacher Name
            const SizedBox(
              width: 02,
            ),
            Expanded(
              flex: 2,
              child: TextFontWidget(
                  fontsize: 12.5,
                  color: cWhite,
                  // width: 150,
                  index: index,
                  text: compare.toString()), //....................Teacher attendence count
            ),

            const SizedBox(
              width: 02,
            ),

            Expanded(
              flex: 2,
              child: TextFontWidget(
                  fontsize: 12.5,
                  color: cWhite,
                  // width: 150,
                  index: index,
                  text: data['applyLeaveDate'] ??
                      'List is Empty'), //....................Teacher attendence count
            ),

            const SizedBox(
              width: 02,
            ),

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                    child: Image.asset(
                      'webassets/png/telephone.png',
                    ),
                  ),
                  const SizedBox(
                    width: 05,
                  ),
                  TextFontWidget(fontsize: 12, color: cWhite, index: index, text: 'phoneNumber'),
                ],
              ),
            ), //....................................... Student Phone Number
            const SizedBox(
              width: 02,
            ),
          ],
        ),
      ),
    );
  }
}
