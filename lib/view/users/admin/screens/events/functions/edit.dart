import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/event_controller/event_controller.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/events.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';

editFunctionOfEvent(BuildContext context, EventModel data) {
  final EventController eventController = Get.put(EventController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        TextFormFiledBlueContainerWidgetEvent(
          controller: eventController.eventnameController,
            hintText: data.eventName,
            title: 'Event'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.eventDate,
            title: 'Date'),
        TextFormFiledBlueContainerWidgetEvent(
          controller: eventController.eventvenueController,
            hintText: data.venue,
            title: 'Venue'),
        TextFormFiledBlueContainerWidgetEvent(
          controller: eventController.eventdescriptionController,
            hintText: data.eventDescription,
            title: 'Description'),
        TextFormFiledBlueContainerWidgetEvent(
          controller: eventController.eventsignedByController,
            hintText: data.signedBy,
            title: 'Signed by')
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        eventController.updateEvent(data.eventDate,data.eventName,data.eventDescription,data.venue,data.signedBy,
          data.id,context );
        //      // ignore: unused_local_variable
        //      String edit = snapshot.data!
        //     .docs[index]['eventName'];

        // FirebaseFirestore.instance
        //     .collection('SchoolListCollection')
        //      .doc(UserCredentialsController.schoolId)
        //      .collection(UserCredentialsController.batchId!)
        //      .doc(UserCredentialsController.batchId!)
        //     .collection('AdminEvents')
        //     .doc(snapshot
        //         .data!.docs[index]['id'])
        //     .update({
        //       'eventDate': eventController.eventdateController.text,
        //       'eventName': eventController.eventnameController.text,
        //       'eventDescription': eventController.eventdescriptionController.text,
        //       'venue': eventController.eventvenueController.text,
        //       'signedBy':eventController.eventsignedByController.text,
        //     })
        //     .then((value) =>
        //         Navigator.pop(context))
        //     .then((value) => showToast(
        //         msg: 'Event Updated!'));
      },
      actiontext: 'Update');
}
