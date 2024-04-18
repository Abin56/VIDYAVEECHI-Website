import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notice_controller/notice_controller.dart';
import 'package:vidyaveechi_website/model/notice_model/notice_model.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/events.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';

editFunctionOfNotice(BuildContext context, NoticeModel data) {
  final NoticeController noticeController = Get.put(NoticeController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.heading, title: 'Heading'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.publishedDate, title: 'Published Date'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.subject, title: 'Subject'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.dateofoccation, title: 'Date Of Occation'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.venue, title: 'Venue'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.dateOfSubmission, title: 'Date Of Submission'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.chiefGuest, title: 'Cheif guest'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.signedBy, title: 'Signed by'),
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        noticeController.updateNotice(
          data.noticeId,
          context,
        );
      },
      actiontext: 'Update');
}
