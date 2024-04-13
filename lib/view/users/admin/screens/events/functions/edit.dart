import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/events.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';

editFunctionOfEvent(BuildContext context, EventModel data) {
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.eventName,
            title: 'Event'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.eventDate,
            title: 'Date'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.venue,
            title: 'Venue'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.eventDescription,
            title: 'Description'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.signedBy,
            title: 'Signed by')
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        eventController.updateEvent(data.id,context );
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
