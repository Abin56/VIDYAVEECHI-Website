import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/function/edit_event.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/functions/delete.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/show_dialoge_box.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class AllEventsDataList extends StatelessWidget {
  final int index;
  final EventModel data;
  final Color color;
  const AllEventsDataList({
    required this.data,
    required this.index,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
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
          Expanded(
            flex: 4,
            child: DataContainerWidget(
                rowMainAccess: MainAxisAlignment.center,
                color: cWhite,
                index: index,
                headerTitle: data.eventName),
          ), //.............................Event Name
          const SizedBox(
            width: 01,
          ),
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          // ignore: unnecessary_null_comparison
                          color: color == null
                              ? null
                              : index % 2 == 0
                                  ? const Color.fromARGB(255, 246, 246, 246)
                                  : Colors.blue[50],
                        ),
                        child: Center(
                            child: GestureDetector(
                                onTap: () {
                                  showDialogeBox(
                                    context: context,
                                    // title: 'Delete',
                                    children: [
                                      GooglePoppinsWidgets(
                                          text: 'Textbjbbjkbnkhkhlilkhnkjhvjhbkjnlk\nhnlknhlkhl;kl;m;lm;lkccccccgjkhgvbl\nkfdeasrtyuiopnbfxsrxsrdfghgxfd\nbvhgjjbvvvh;lhvkjkjbkgv\ngvjhvhjyvjhvbjhvh',
                                          fontsize: ResponsiveWebSite.isMobile(
                                                  context)
                                              ? 12
                                              : 15)
                                    ],
                                    doyouwantActionButton: true,
                                    //actiontext: 'cancel',
                                    actiononTapfuction: () {
                                      // eventController.deleteEvent(
                                      //     context,
                                      //     index,
                                      //     snapshot
                                      //     );
                                      // ignore: unused_local_variable
                                      // String delete = snapshot.data!
                                      //     .docs[index]['eventName'];
                                      // FirebaseFirestore.instance
                                      //     .collection(
                                      //         'SchoolListCollection')
                                      //     .doc(UserCredentialsController.schoolId)
                                      //     .collection(UserCredentialsController.batchId!)
                                      //     .doc(UserCredentialsController.batchId!)
                                      //     .collection('AdminEvents')
                                      //     .doc(snapshot.data!
                                      //         .docs[index]['id'])
                                      //     .delete()
                                      //     .then((value) =>Navigator.pop(context));
                                    },
                                  );
                                },
                                child: Text(data.eventDescription)))),
                  ),
                ],
              )
              // DataContainerWidget(
              //     rowMainAccess: MainAxisAlignment.center,
              //     color: cWhite,
              //     // width: 150,
              //     index: index,
              //     headerTitle: 'Event Description'),
              ), // ...................................Event Description
          const SizedBox(
            width: 01,
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          // ignore: unnecessary_null_comparison
                          color: color == null
                              ? null
                              : index % 2 == 0
                                  ? const Color.fromARGB(255, 246, 246, 246)
                                  : Colors.blue[50],
                        ),
                        child: Center(
                            child: GestureDetector(
                          onTap: () {
                          editFunctionOfEvent(context, data);
                          },
                          child: Icon(
                            Icons.edit,
                            size: 15,
                            color: cgreen,
                          ),
                        ))),
                  ),
                ],
              )
              // DataContainerWidget(
              //     rowMainAccess: MainAxisAlignment.center,
              //     color: cWhite,
              //     // width: 150,
              //     index: index,
              //     headerTitle: 'Edit'),
              ), //....................................... Edit
          const SizedBox(
            width: 01,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        // ignore: unnecessary_null_comparison
                        color: color == null
                            ? null
                            : index % 2 == 0
                                ? const Color.fromARGB(255, 246, 246, 246)
                                : Colors.blue[50],
                      ),
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                  deleteFunctionOfEvents(context, data);
                              },
                              child: Icon(
                                Icons.delete,
                                size: 15,
                                color: cred,
                              )))),
                ),
                // Expanded(
                //   child: DataContainerWidget(
                //       rowMainAccess: MainAxisAlignment.center,
                //       color: cWhite,
                //       // width: 150,
                //       index: index,
                //       headerTitle: '11',
                //       icon: Icon(Icons.delete),),
                // ),
              ],
            ),
          ), //....................Delete
        ],
      ),
    );
  }
}
