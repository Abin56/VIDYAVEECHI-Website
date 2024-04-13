import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/achievements_controller/achievements.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/events.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

editFunctionOfAchievements(BuildContext context, AchievementModel data) {
  final AchievementsController achievementsController =
      Get.put(AchievementsController());
  customShowDilogBox(
      context: context,
      title: 'Edit',
      children: [
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.studentName, title: 'Student Name'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.admissionNumber, title: 'Admission Number'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.dateofAchievement, title: 'Date'),
        TextFormFiledBlueContainerWidgetEvent(
            hintText: data.achievementHead, title: 'Achievement'),
      ],
      doyouwantActionButton: true,
      actiononTapfuction: () {
        achievementsController.updateAchievement(data.uid,context);
      },
      actiontext: 'Update');
}

deleteFunctionOfAchievement(BuildContext context, AchievementModel data) {
    final AchievementsController achievementsController =
      Get.put(AchievementsController());
  customShowDilogBox(
      context: context,
      title: 'Delete',
      children: [
        GooglePoppinsWidgets(
            text: 'Are you sure to want delete',
            fontsize: ResponsiveWebSite.isMobile(context) ? 12 : 15)
      ],
      actiononTapfuction: () {
        print(data.uid);
       achievementsController.deleteAchievements(data.uid,context);
      },
      doyouwantActionButton: true);
}
