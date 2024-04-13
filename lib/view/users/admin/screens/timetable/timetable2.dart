// import 'package:awesome_side_sheet/Enums/sheet_position.dart';
// import 'package:awesome_side_sheet/side_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vidyaveechi_website/controller/timetable_controller/timetable_controller.dart';
// import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
// import 'package:vidyaveechi_website/view/users/admin/screens/notice/noticebutton_container.dart';
// import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
// import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
// import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

// import '../../../../../constants/colors/app_colors.dart';
// import '../../../../drop_down/class_wise_subject.dart';

// class TimeTable extends StatelessWidget {
//   final formKey = GlobalKey<FormState>();
//   final timetableCtrl = Get.put(TimeTableController());
//   TimeTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> textformWidget = [
//       Padding(
//         padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
//         child: SelectClassDropDown()
//       ),
//   Padding(
//         padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
//         child:    Obx(() => Container(
//             decoration: BoxDecoration(
//               borderRadius:  BorderRadius.circular(5),
//               border: Border.all(color: Colors.black.withOpacity(0.7), ),
//             ),
//             width: 450,
//             child: DropdownButton<String>(
//               underline: Container(),
//               isExpanded: true,
//               value: timetableCtrl.dayName.value,
//               onChanged: (String? newValue) {
//                 timetableCtrl.dayName.value = newValue ?? '';
//               },
//               items: <String>[
//                 'Select Day',
//                 'Monday',
//                 'Tuesday',
//                 'Wednesday',
//                 'Thursday',
//                 'Friday',
//                 'Saturday',
//                 'Sunday'
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           )),
//       ), 
//        ////////////////////////////////////////////////////////1
//       Padding(
//         padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
//         child:    SelectClassWiseSubjectDropDown(),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//         child: TextFormFiledBlueContainerWidget(
//           controller: timetableCtrl.periodController,
//           width: ResponsiveWebSite.isMobile(context) ? double.infinity : 400,
//           hintText: 'Period',
//           title: 'Period',
//           // onTap: () async {
           
//           // },
//         ),
//       ),  ///////////////////////////////////////////////2

//       Padding(
//         padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//         child: TextFormFiledBlueContainerWidget(
//           controller: timetableCtrl.startTimeController,
//           width: ResponsiveWebSite.isMobile(context) ? double.infinity : 400,
//           hintText: 'Start time',
//           title: 'Start time',
//           // onTap: () async {
          
//           // },
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//         child: TextFormFiledBlueContainerWidget(
//           controller: timetableCtrl.endTimeController,
//           width: ResponsiveWebSite.isMobile(context) ? double.infinity : 400,
//           hintText: 'End time',
//           title: 'End time',
//           // onTap: () async {
           
//           // },
//         ),
//       ),  ////////////////////////////////////3
      
      

//       const Expanded(
//           child: SizedBox(
//         height: 40,
//         width: 400,
//       ))
//     ];
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Row(
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       {
//                         timetable_Creation(context, textformWidget);
//                       }
//                     },
//                     child: const RouteSelectedTextContainer(
                      
//                         width: 140, title: 'Create')),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> timetable_Creation(BuildContext context, List<Widget> textformWidget) {
//     return aweSideSheet(
//                           context: context,
//                           sheetPosition: SheetPosition.right,
//                           title: "TimeTable",
//                           body: Padding(
//                             padding: const EdgeInsets.only(left: 10, top: 10),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                       height: 800,
//                                       child: Container(
//                                         margin:
//                                             const EdgeInsets.only(top: 10),
//                                         child:
//                                             //  Obx(() {
//                                             // return
//                                             Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                               textformWidget[0],
//                                               textformWidget[1],
//                                               textformWidget[2],

//                                               textformWidget[3],
//                                               textformWidget[4],
//                                                 textformWidget[5],

//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.only(
//                                                         top: 10, bottom: 10),
//                                                 child: Center(
//                                                   child:
//                                                       NoticeButtonContainerWidget(
//                                                     text: 'Submit',
//                                                     width: 300,
//                                                     height: 50,
//                                                     fontSize: 18,
//                                                     onTap: () { timetableCtrl
//                                                                                                   .addTimeTableDataToFirebase();},
//                                                     color: AppColors
//                                                         .darkBlueColor,
//                                                   ),
//                                                 ),
//                                               )
//                                               // }),
//                                             ]),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           showCloseButton: false,
//                           footer: Container());
//   }
// }
