import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/achievements/edit_delete/edit_function.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class NewAchievementsUI extends StatelessWidget {
  final AchievementModel data;
  const NewAchievementsUI({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Center(
          child: Container(
            height: ResponsiveWebSite.isTablet(context) ? 355 :ResponsiveWebSite.isMobile(context) ?300: 400,
            width: ResponsiveWebSite.isTablet(context) ? 285 :ResponsiveWebSite.isMobile(context) ?280: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('webassets/images/cup.removed.png'))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: ResponsiveWebSite.isMobile(context) ? 20 : 40),
                  child: CircleAvatar(
                    child: const Image(
                        image: AssetImage('webassets/images/student_png.png')),
                    radius: ResponsiveWebSite.isMobile(context) ? 40 : 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GooglePoppinsWidgets(
                    text: "Student Name:  ${data.studentName}",
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GooglePoppinsWidgets(
                    text: 'Adm No: ${data.admissionNumber}',
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GooglePoppinsWidgets(
                    text: 'Date: ${data.dateofAchievement}',
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: GooglePoppinsWidgets(
                    text: 'Achievement: ${data.achievementHead}',
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ResponsiveWebSite.isDesktop(context)?  const Spacer():SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        editFunctionOfAchievements(context, data);
                      },
                      child: const RouteSelectedTextContainer(
                          width: 110, title: 'Edit'),
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteFunctionOfAchievement(context, data);
                      },
                      child: const RouteSelectedTextContainer(
                          width: 110, title: 'Delete'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
