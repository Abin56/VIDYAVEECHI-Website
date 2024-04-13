import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/achievements_controller/achievements.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/achievements/new_acheivements_ui.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notice/noticebutton_container.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class Achievements extends StatelessWidget {
  final AchievementsController achievementsController =
      Get.put(AchievementsController());
  Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> textformWidget = [
      Padding(
          padding: EdgeInsets.only(top: 5, right: 10, left: 10),
          child:
              SelectClassDropDown()), ///////////////////////////////////////////////////////////////////////0
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          controller: achievementsController.studentNameController,
          validator: checkFieldEmpty,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          title: 'Student name',
          hintText: 'Student name', /////////////////////////////////////////1
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          validator: checkFieldDateIsValid,
          controller: achievementsController.dateController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          hintText: 'Date',
          title: 'Date',
        ),
      ), ////////////////////////////////////////////////////////2
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          validator: checkFieldEmpty,
          controller: achievementsController.admissionNumberController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          title: 'Admission Number',
          hintText: 'Admission Number',
        ),
      ), ///////////////////////////////////////////////3
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          validator: checkFieldEmpty,
          controller: achievementsController.achievementController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          title: 'Achievement head',
          hintText: 'Achievement head',
        ),
      ), ////////////////////////////////////4

      const Expanded(
          child: SizedBox(
        height: 40,
        width: 400,
      ))
    ];
    return Container(
      height: 1000,
      color: screenContainerbackgroundColor,
      child: Form(
        key: achievementsController.formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25, top: 25),
                  child: Row(
                    children: [
                      TextFontWidget(
                        text: 'Achievements',
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            {
                              aweSideSheet(
                                  context: context,
                                  sheetPosition: SheetPosition.right,
                                  title: "Acheivements",
                                  body: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: 800,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10),
                                                child:
                                                    //  Obx(() {
                                                    // return
                                                    Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                      Stack(
                                                        children: [
                                                          // Obx(() {
                                                          const CircleAvatar(
                                                            radius: 60,
                                                            // backgroundImage: Image.network(
                                                            //         signupController.userImage.value)
                                                            //
                                                            //   .image,
                                                          ),

                                                          // }
                                                          // }),
                                                          Positioned(
                                                              bottom: -10,
                                                              left: 80,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    // signupController.uploadImg();
                                                                    // // signupController.uploadImage;
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .add_a_photo)))
                                                        ],
                                                      ),
                                                      textformWidget[0],
                                                      textformWidget[1],
                                                      textformWidget[2],

                                                      textformWidget[3],
                                                      textformWidget[4],

                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 10,
                                                                bottom: 10),
                                                        child:
                                                            NoticeButtonContainerWidget(
                                                          text: 'Submit',
                                                          width: 300,
                                                          height: 50,
                                                          fontSize: 18,
                                                          onTap: () {
                                                            if (achievementsController
                                                                .formKey
                                                                .currentState!
                                                                .validate()) {
                                                              achievementsController
                                                                  .uploadImageToStorage();
                                                            }
                                                          },
                                                          color: AppColors
                                                              .blueDarkColor,
                                                        ),
                                                      )
                                                      // }),
                                                    ]),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  showCloseButton: false,
                                  footer: Container());
                            }
                          },
                          child: const RouteSelectedTextContainer(
                              width: 140, title: 'Create')),
                    ],
                  ),
                ),
                // ResponsiveWebSite.isMobile(context)
                //     ? Container(
                //         color: cWhite,
                //         child: const Padding(
                //           padding: EdgeInsets.only(top: 10),
                //           child: Column(
                //             children: [],
                //           ),
                //         ),
                //       )

                // Obx(() {
                // return generalInsructionController.isLoading.value
                //  ?
                // const Center(
                //     child: CircularProgressIndicator(),
                //   )

                // :
                //  :
                SingleChildScrollView(
                  child: SizedBox(
                    height: 1000,
                    width: ResponsiveWebSite.isMobile(context)
                        ? double.infinity
                        : 1000,
                    child:
                        // Padding(
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 100,
                        //   vertical: 30,
                        // ),
                        // child:
                        StreamBuilder(
                            stream: server
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection(UserCredentialsController.batchId!)
                                .doc(UserCredentialsController.batchId!)
                                .collection('AdminAchievements')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              // ignore: prefer_is_empty
                              if (snapshot.data!.docs.length == 0) {
                                return Center(
                                    child: Text(
                                  'No Achievements',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ));
                              }
                              return GridView.builder(
                                itemCount: snapshot.data!.docs.length,

                                //snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  AchievementModel data =
                                      AchievementModel.fromMap(
                                          snapshot.data!.docs[index].data());
                                  return Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: NewAchievementsUI(
                                        data: data,
                                      ));
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            ResponsiveWebSite.isMobile(context)
                                                ? 1
                                                : 2),
                              );
                            }),

                    // ),
                  ),
                )
                //})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiledBlueContainerWidgetAchievement extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String title;
  final String hintText;
  final Widget? widget;
  final double? width;
  Function(String)? onChanged;
  Iterable<String>? autofillHints;
  String? Function(String?)? validator;
  Function()? onTap;
  TextInputType? keyboardType;
  TextFormFiledBlueContainerWidgetAchievement({
    this.width,
    this.widget,
    required this.hintText,
    required this.title,
    this.keyboardType,
    this.controller,
    this.autofillHints,
    this.onChanged,
    this.validator,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
      // color: cWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFontWidget(text: '$title *', fontsize: 12.5),
              widget == null ? const SizedBox() : widget!,
            ],
          ),
          const SizedBox(
            height: 05,
          ),
          Container(
            height: 40,
            width: width,
            color: screenContainerbackgroundColor,
            child: Center(
              child: TextFormField(
                onChanged: onChanged,
                autofillHints: autofillHints,
                onTap: onTap,
                validator: validator,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        width: 0.4,
                        style: BorderStyle.none,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 0.4,
                      style: BorderStyle.none,
                      color: Colors.red,
                    ),
                  ),
                  // contentPadding: const EdgeInsets.all(8.0),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0.4)),
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: hintText,
                  focusedBorder: const OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
