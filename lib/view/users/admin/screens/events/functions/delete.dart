import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/event_controller/event_controller.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

final EventController eventController = Get.put(EventController());
deleteFunctionOfEvents(BuildContext context, EventModel data) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      title: const Text(
        "Delete",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      content: Text(
        "Are you sure do you want to delete ?",
        style:
            TextStyle(fontSize: ResponsiveWebSite.isMobile(context) ? 12 : 15),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BlueContainerWidget(
                    title: "No",
                    fontSize: 12,
                    color: adminePrimayColor,
                    width: 100)),
            GestureDetector(
                onTap: () {
                  eventController.deleteEvent(
                    data.id,
                    context,
                  );
                },
                child: BlueContainerWidget(
                    title: "Yes",
                    fontSize: 12,
                    color: adminePrimayColor,
                    width: 100)),
          ],
        ),
      ],
    ),
  );

  // customShowDilogBox(
  //   context: context,
  //   title: 'Delete',
  //   children: [
  //     GooglePoppinsWidgets(
  //         text: 'Are you sure to want delete',
  //         fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 15)
  //   ],
  //   doyouwantActionButton: true,
  //   //actiontext: 'cancel',
  //   actiononTapfuction: () {
  //     eventController.deleteEvent(
  //       data.id,
  //       context,
  //     );
  //     // ignore: unused_local_variable
  //     // String delete = snapshot.data!
  //     //     .docs[index]['eventName'];
  //     // FirebaseFirestore.instance
  //     //     .collection(
  //     //         'SchoolListCollection')
  //     //     .doc(UserCredentialsController.schoolId)
  //     //     .collection(UserCredentialsController.batchId!)
  //     //     .doc(UserCredentialsController.batchId!)
  //     //     .collection('AdminEvents')
  //     //     .doc(snapshot.data!
  //     //         .docs[index]['id'])
  //     //     .delete()
  //     //     .then((value) =>Navigator.pop(context));
  //   },
  // );
}
