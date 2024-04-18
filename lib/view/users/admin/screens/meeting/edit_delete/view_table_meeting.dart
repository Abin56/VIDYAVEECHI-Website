import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/meeting_controller/meeting_controller.dart';
import 'package:vidyaveechi_website/model/meeting_model/meeting_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/meeting/view_of_allmeetings/all_view_data_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/route_NonSelectedContainer.dart';

class MeetingEditRemove extends StatelessWidget {
  final MeetingController meetingController = Get.put(MeetingController());
  MeetingEditRemove({
    Key? key,
    // required this.schoolID
  }) : super(key: key);

  // String schoolID;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: screenContainerbackgroundColor,
        height: 800,
        width: 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: TextFontWidget(
                text: 'View All Meeting',
                fontsize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      meetingController.ontapMeeting.value = false;
                    },
                    child: const RouteNonSelectedTextContainer(title: 'Home'),
                  ),
                  Spacer(),
                  const RouteSelectedTextContainer(width: 140, title: 'Meeting Deatils'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: Container(
                color: cWhite,
                height: 600,
                // width: 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFontWidget(
                        text: 'Meeting ',
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                          stream: server
                              .collection('SchoolListCollection')
                              .doc(UserCredentialsController.schoolId)
                              .collection(UserCredentialsController.batchId!)
                              .doc(UserCredentialsController.batchId!)
                              .collection('AdminMeetings')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            // ignore: prefer_is_empty
                            if (snapshot.data!.docs.length == 0) {
                              return Center(
                                  child: Text(
                                'No Meetings',
                                style:
                                    GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
                              ));
                            }
                            return Container(
                              color: screenContainerbackgroundColor,
                              height: 1000,
                              width: 1200,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    child: Container(
                                      color: cWhite,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5, right: 5),
                                        child: Container(
                                          color: cWhite,
                                          height: 40,
                                          child: const Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child:
                                                      CatrgoryTableHeaderWidget(headerTitle: 'No')),
                                              SizedBox(
                                                width: 01,
                                              ),
                                              // Expanded(
                                              //     flex: 2,
                                              //     child: CatrgoryTableHeaderWidget(
                                              //         headerTitle: 'ID')),
                                              // SizedBox(
                                              //   width: 01,
                                              // ),
                                              Expanded(
                                                  flex: 4,
                                                  child: CatrgoryTableHeaderWidget(
                                                      headerTitle: 'Topic')),
                                              SizedBox(
                                                width: 02,
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: CatrgoryTableHeaderWidget(
                                                      headerTitle: 'Time')),
                                              SizedBox(
                                                width: 02,
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: CatrgoryTableHeaderWidget(
                                                      headerTitle: 'Date')),
                                              SizedBox(
                                                width: 02,
                                              ),
                                              Expanded(
                                                  flex: 4,
                                                  child: CatrgoryTableHeaderWidget(
                                                      headerTitle: 'Venue')),
                                              SizedBox(
                                                width: 02,
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: CatrgoryTableHeaderWidget(
                                                      headerTitle: 'Edit')),
                                              SizedBox(
                                                width: 02,
                                              ),

                                              Expanded(
                                                  flex: 3,
                                                  child: CatrgoryTableHeaderWidget(
                                                      headerTitle: 'Delete')),
                                              SizedBox(
                                                width: 02,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 0, right: 0),
                                      child: Container(
                                        width: 1200,
                                        decoration: BoxDecoration(
                                          color: cWhite,
                                          border: Border.all(color: cWhite),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5, right: 5),
                                          child: SizedBox(
                                              // width: 1100,
                                              child:
                                                  //  StreamBuilder(
                                                  //   stream: server
                                                  //       .collection('SchoolListCollection')
                                                  //       .doc(UserCredentialsController.schoolId)
                                                  //       .collection('LoginHistroy')
                                                  //       .snapshots(),
                                                  //   builder: (context, snaPS) {
                                                  //     if (snaPS.hasData) {
                                                  //       return
                                                  ListView.separated(
                                                      itemBuilder: (context, index) {
                                                        final data = MeetingModel.fromMap(
                                                            snapshot.data!.docs[index].data());
                                                        return GestureDetector(
                                                          onTap: () {
                                                            // adminLoginHistroyController
                                                            //     .parentModelData
                                                            //     .value = data;
                                                            // adminLoginHistroyController
                                                            //     .loginHistroyontapped
                                                            //     .value = true;
                                                          },
                                                          child: AllMeetingsDataList(
                                                            index: index,
                                                            data: data,
                                                          ),
                                                        ); ///////
                                                      },
                                                      separatorBuilder: (context, index) {
                                                        return const SizedBox(
                                                          height: 02,
                                                        );
                                                      },
                                                      itemCount: snapshot.data!.docs.length)
                                              //  snaPS.data!.docs.length);
                                              //           //////////
                                              //     } else {
                                              //       return const LoadingWidget();
                                              //     }
                                              //   },
                                              // ),////////
                                              ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                            // GridView.count(//
                            //   crossAxisCount: ResponsiveWebSite.isMobile(context)
                            //       ? 1
                            //       : ResponsiveWebSite.isTablet(context)
                            //           ? 3
                            //           : 4,
                            //   crossAxisSpacing: 12,
                            //   mainAxisSpacing: 12,
                            //   children: List.generate(snapshot.data!.docs.length, (index) {
                            //       MeetingModel data = MeetingModel.fromMap(
                            //       snapshot.data!.docs[index].data() );
                            //     return Padding(
                            //       padding: const EdgeInsets.all(20),
                            //       child: Container(
                            //         height: 200,
                            //         width: 300,
                            //         decoration: const BoxDecoration(
                            //             color: cWhite,
                            //             //Color.fromARGB(255, 245,252,255),
                            //             boxShadow: [
                            //               BoxShadow(
                            //                 blurRadius: 1,
                            //                 offset: Offset(3, 3),
                            //               ),
                            //               BoxShadow(
                            //                 blurRadius: 1,
                            //                 offset: Offset(1, 1),
                            //               )
                            //             ]),
                            //         child: Column(
                            //           mainAxisAlignment: MainAxisAlignment.start,
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           children: [
                            //              Padding(
                            //               padding: const EdgeInsets.only(top: 10, left: 10),
                            //               child: TextFontWidget(
                            //                 text: data.topic,
                            //                 fontsize: 18,
                            //                 fontWeight: FontWeight.bold,
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: EdgeInsets.only(left: 10, top: 10),
                            //               child: TextFontWidget(
                            //                 text: data.date,
                            //                 fontsize: 14,
                            //               ),
                            //             ),
                            //              Padding(
                            //               padding: EdgeInsets.only(left: 10, top: 10),
                            //               child: TextFontWidget(
                            //                 text: data.time,
                            //                 fontsize: 14,
                            //               ),
                            //             ),
                            //              Padding(
                            //               padding: EdgeInsets.only(left: 10, top: 10),
                            //               child: TextFontWidget(
                            //                 text: data.venue,
                            //                 fontsize: 14,
                            //               ),
                            //             ),
                            //             const Spacer(),
                            //             Padding(
                            //               padding: const EdgeInsets.only(
                            //                 top: 10,
                            //                 bottom: 10,
                            //               ),
                            //               child: Row(
                            //                 children: [
                            //                   Expanded(
                            //                     child: Padding(
                            //                       padding:
                            //                           const EdgeInsets.only(left: 10),
                            //                       child: MaterialButton(
                            //                         onPressed: () {
                            //                           editFunctionOfMeeting(context, data);
                            //                         },
                            //                         color: themeColorBlue,
                            //                         child: GooglePoppinsWidgets(
                            //                           text: 'Edit',
                            //                           fontsize: 13,
                            //                           color: cWhite,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   Expanded(
                            //                     child: Padding(
                            //                       padding: const EdgeInsets.only(
                            //                         left: 10,
                            //                         right: 10,
                            //                       ),
                            //                       child: MaterialButton(
                            //                         onPressed: () {
                            //                          deleteFunctionOfMeetings(context);
                            //                         },
                            //                         color: cred,
                            //                         child: GooglePoppinsWidgets(
                            //                           text: 'Delete',
                            //                           fontsize: 13,
                            //                           color: cWhite,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     );
                            //   }),
                            // );///
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiledBlueContainerWidgetMeeting extends StatelessWidget {
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
  TextFormFiledBlueContainerWidgetMeeting({
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
      height: 80,
      width: 350,
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
            // height: 40,
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
                  contentPadding: const EdgeInsets.symmetric(vertical: 01, horizontal: 01),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.none,
                      color: Colors.red,
                    ),
                  ),
                  // contentPadding: const EdgeInsets.all(8.0),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0.4)),
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
