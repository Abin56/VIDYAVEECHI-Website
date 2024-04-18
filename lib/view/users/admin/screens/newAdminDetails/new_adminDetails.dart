import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:vidyaveechi_website/view/users/admin/screens/newAdminDetails/adminList.dart';

import 'package:vidyaveechi_website/view/widgets/table/table_widgets.dart';

class NewAdminListPage extends StatelessWidget {
  const NewAdminListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1200,
      width: 1200,
      color: Color.fromARGB(255, 242, 236, 236),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1200,
              height: 600,
              child: Column(
                children: [
                  Row(
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
                      separatorBuilder: (context, index) => SizedBox(
                        height: 1,
                      ),
                      itemCount: 1,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
