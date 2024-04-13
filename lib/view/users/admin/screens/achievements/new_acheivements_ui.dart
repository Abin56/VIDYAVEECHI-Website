import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class NewAchievementsUI extends StatelessWidget {
  final AchievementModel data;
  const NewAchievementsUI({
    required this.data,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Center(
          child: Container(
            height: ResponsiveWebSite.isMobile(context)?250:400 ,
            width: ResponsiveWebSite.isMobile(context)?250:400 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('webassets/images/cup.jpg'))),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: ResponsiveWebSite.isMobile(context)?30:40 ),
                  child: CircleAvatar(
                    child:Image(image: AssetImage('webassets/images/student_png.png')),
                    
                    radius: ResponsiveWebSite.isMobile(context)?30:50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GooglePoppinsWidgets(
                      text: "Student Name:  ${data.studentName}", fontsize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:
                      GooglePoppinsWidgets(text: 'Adm No: ${data.admissionNumber}', fontsize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GooglePoppinsWidgets(
                      text: 'Date: ${data.dateofAchievement}', fontsize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: GooglePoppinsWidgets(
                      text: 'Achievement: ${data.achievementHead}', fontsize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
