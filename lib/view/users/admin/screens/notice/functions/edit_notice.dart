import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notice_controller/notice_controller.dart';
import 'package:vidyaveechi_website/model/notice_model/notice_model.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/events.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

editFunctionOfNotice(BuildContext context, NoticeModel data) {
  final NoticeController noticeController = Get.put(NoticeController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        TextFormFiledHeightnoColor(
          controller: noticeController.noticeHeadingController,
            hintText: data.heading, title: 'Heading'),
        TextFormFiledHeightnoColor(
          onTap: () {
            noticeController.selectDate(context, noticeController.editnoticePublishedDateController,);
          },
          controller: noticeController.editnoticePublishedDateController,
            hintText: data.publishedDate, title: 'Published Date'),
        TextFormFiledHeightnoColor(
           controller: noticeController.noticeSubjectController,
            hintText: data.subject, title: 'Subject'),
        TextFormFiledHeightnoColor(
           onTap: () {
            noticeController.selectDate(context, noticeController.editnoticeDateofoccationController,);
          },
          controller: noticeController.editnoticeDateofoccationController,
            hintText: data.dateofoccation, title: 'Date Of Occation'),
        TextFormFiledHeightnoColor(
           controller: noticeController.noticevenueController,
            hintText: data.venue, title: 'Venue'),
        TextFormFiledHeightnoColor(
           onTap: () {
            noticeController.selectDate(context, noticeController.editnoticeDateofSubmissionController,);
          },
          controller: noticeController.editnoticeDateofSubmissionController,
            hintText: data.dateOfSubmission, title: 'Date Of Submission'),
        TextFormFiledHeightnoColor(
           controller: noticeController.noticeGuestController,
            hintText: data.chiefGuest, title: 'Cheif guest'),
        TextFormFiledHeightnoColor(
           controller: noticeController.noticeSignedByController,
            hintText: data.signedBy, title: 'Signed by'),
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        noticeController.updateNotice(
          data.noticeId,
          context,
        );
        print('idddddddddddddddddddddddddddddddddddddddd${data.noticeId}');
      },
      actiontext: 'Update');
}
