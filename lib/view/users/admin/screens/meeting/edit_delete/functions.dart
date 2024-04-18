import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/meeting_controller/meeting_controller.dart';
import 'package:vidyaveechi_website/model/meeting_model/meeting_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/meeting/edit_delete/view_table_meeting.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

final MeetingController meetingController = Get.put(MeetingController());
editFunctionOfMeeting(BuildContext context, MeetingModel data) {
  customShowDilogBox(
    context: context,
    title: 'Edit Meeting',
    children: [
      TextFormFiledBlueContainerWidgetMeeting(hintText: data.topic, title: 'Topic'),
      TextFormFiledBlueContainerWidgetMeeting(hintText: data.date, title: 'Date'),
      TextFormFiledBlueContainerWidgetMeeting(hintText: data.time, title: 'Time '),
      TextFormFiledBlueContainerWidgetMeeting(hintText: data.category, title: 'Category'),
      TextFormFiledBlueContainerWidgetMeeting(hintText: data.venue, title: 'Venue'),
      TextFormFiledBlueContainerWidgetMeeting(hintText: data.members, title: 'Expected Members'),
      TextFormFiledBlueContainerWidgetMeeting(hintText: data.specialGuest, title: 'Special Guest'),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
                color: themeColorBlue,
                border: Border.all(color: themeColorBlue),
                borderRadius: BorderRadius.circular(05)),
            child:  Center(
              child: TextFontWidget(
                text: "Update",
                fontsize: 14,
                // fontWeight: FontWeight.w600,
                color: cWhite,
              ),
            ),
          ),
        ],
      ),
    ],
    actiononTapfuction: () {
      meetingController.updateMeeting(data.meetingId, context);
    },
    doyouwantActionButton: false,
    actiontext: 'Update',
  );
}

deleteFunctionOfMeetings(BuildContext context, MeetingModel data) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      title: const Text(
        "Delete",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      content: const Text(
        "Are you sure do you want to delete ?",
        style: TextStyle(fontSize: 14),
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
                    title: "No", fontSize: 12, color: adminePrimayColor, width: 100)),
            GestureDetector(
                onTap: () {
                  meetingController.deleteMeeting(data.meetingId, context);
                },
                child: BlueContainerWidget(
                    title: "Yes", fontSize: 12, color: adminePrimayColor, width: 100)),
          ],
        ),
      ],
    ),
  );

  // customShowDilogBox(
  //     context: context,
  //     title: 'Delete',
  //     children: [
  //       GooglePoppinsWidgets(
  //           text: 'Are you sure to want delete',
  //           fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 15)
  //     ],actiononTapfuction: () {
  //       meetingController.deleteMeeting(data.meetingId, context);
  //     },
  //     doyouwantActionButton: true);
}

allviewFunctionOfMeeting(BuildContext context, MeetingModel data) {
  customShowDilogBox(
      context: context,
      title: 'Meeting',
      children: [
        SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFontWidget(
                    text: "   Topic",
                    fontsize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                      width: ResponsiveWebSite.isMobile(context) ? 250 : 500,
                      height: 35,
                      color: cBlue.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFontWidget(text: data.topic, fontsize: 13),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TextFontWidget(
                    text: "   Time",
                    fontsize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                      width: ResponsiveWebSite.isMobile(context) ? 250 : 500,
                      height: 35,
                      color: cBlue.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFontWidget(text: data.time, fontsize: 13),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 TextFontWidget(
                    text: "   Date",
                    fontsize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                      width: ResponsiveWebSite.isMobile(context) ? 250 : 500,
                      height: 35,
                      color: cBlue.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFontWidget(text: data.date, fontsize: 13),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TextFontWidget(
                    text: "   Category",
                    fontsize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                      width: ResponsiveWebSite.isMobile(context) ? 250 : 500,
                      height: 35,
                      color: cBlue.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFontWidget(text: data.category, fontsize: 13),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TextFontWidget(
                    text: "   Venue",
                    fontsize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                      width: ResponsiveWebSite.isMobile(context) ? 250 : 500,
                      height: 35,
                      color: cBlue.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFontWidget(text: data.venue, fontsize: 13),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TextFontWidget(
                    text: "  Expected Members",
                    fontsize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                      width: ResponsiveWebSite.isMobile(context) ? 250 : 500,
                      height: 35,
                      color: cBlue.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFontWidget(text: data.members, fontsize: 13),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
           TextFontWidget(
                    text: "   Special Guest",
                    fontsize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                      width: ResponsiveWebSite.isMobile(context) ? 250 : 500,
                      height: 35,
                      color: cBlue.withOpacity(0.1),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFontWidget(text: data.specialGuest, fontsize: 13),
                      )),
                ],
              ),
              //  TextFontWidget(text: data.time, fontsize: 13),
              //  TextFontWidget(text: data.date, fontsize: 13),
              // TextFontWidget(text: data.category, fontsize: 13),
              // TextFontWidget(text: data.venue, fontsize: 13),
              // TextFontWidget(text: data.members, fontsize: 13),
              // TextFontWidget(text: data.specialGuest, fontsize: 13),
            ],
          ),
        )
      ],
      doyouwantActionButton: false);
}
