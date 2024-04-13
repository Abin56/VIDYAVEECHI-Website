import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';

notificationShowingFunctionOnAppBar(BuildContext context) {
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
              Container(
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
                ]),
              ),
            ],
          ),
        ),
      ),
      showCloseButton: false,
      footer: Container());
}
