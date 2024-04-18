import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/constants/colors/app_colors.dart';
import 'package:vidyaveechi_website/controller/notice_controller/notice_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notice/noticebutton_container.dart';
import 'package:vidyaveechi_website/view/widgets/progess_button/progress_button.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class CreateNotice extends StatelessWidget {
  final NoticeController noticeController = Get.put(NoticeController());
  CreateNotice({super.key});

  // bool? valuefirst = false;
  @override
  Widget build(BuildContext context) {
    // List<Widget> textformWidget = [
    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       controller: noticeController.noticeHeadingController,
    //       validator: checkFieldEmpty,
    //       title: 'Heading',
    //       hintText: 'Heading', /////////////////////////////////////////0
    //     ),
    //   ),

    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       controller: noticeController.noticePublishedDateController,
    //       validator: checkFieldDateIsValid,
    //       hintText: 'Published Date',
    //       title: 'Published Date',
    //     ),
    //   ), ////////////////////////////////////////////////////////2
    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       validator: checkFieldEmpty,
    //       controller: noticeController.noticeSubjectController,
    //       title: 'Subject',
    //       hintText: 'Subject',
    //     ),
    //   ), ///////////////////////////////////////////////3
    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       validator: checkFieldDateIsValid,
    //       controller: noticeController.noticeDateofoccationontroller,
    //       title: 'Date of occation',
    //       hintText: 'Date of occation',
    //     ),
    //   ), ////////////////////////////////////4
    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       validator: checkFieldEmpty,
    //       controller: noticeController.noticevenueController,
    //       title: 'Venue',
    //       hintText: 'Venue',
    //     ),
    //   ), ////////////////////////////////////5
    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       validator: checkFieldEmpty,
    //       controller: noticeController.noticeGuestController,
    //       title: 'Cheif guest',
    //       hintText: 'Cheif guest',
    //     ),
    //   ), ////////////////////////////////////6
    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       validator: checkFieldEmpty,
    //       controller: noticeController.noticeSignedByController,
    //       title: 'Signed by',
    //       hintText: 'Signed by',
    //     ),
    //   ), ////////////////////////////////////7
    //   Padding(
    //     padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
    //     child: TextFormFiledWithoutColorEight(
    //       width: 500,
    //       validator: checkFieldDateIsValid,
    //       controller: noticeController.noticeDateofSubmissionontroller,
    //       title: 'Date of Submission',
    //       hintText: 'Date of Submission',
    //     ),
    //   ),

    //   const Expanded(
    //       child: SizedBox(
    //     height: 40,
    //     width: 400,
    //   ))
    // ];
    return Container(
      child: Form(
        key: noticeController.formKey,
        child: Column(
          children: [
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
                              title: "Notice",
                              body: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 900,
                                        width: 500,
                                        margin: const EdgeInsets.only(top: 10),
                                        child:
                                             //  Obx(() {
                                            // return
                                            Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                          
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:const EdgeInsets.only(top: 5, left: 10,right: 10),
                                                  child: TextFormFiledWithoutColorEight(
                                                    width: 500,
                                                    controller: noticeController .noticeHeadingController,
                                                    validator: checkFieldEmpty,
                                                    title: 'Heading',
                                                    hintText:'Heading', /////////////////////////////////////////0
                                                  ),
                                                ),

                                                Padding(
                                                  padding:const EdgeInsets.only( top: 5,left: 10, right: 10),
                                                  child:   Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextFontWidget(text: 'Published Date *', fontsize: 12.5),
                                                        GestureDetector(
                                                          onTap: () =>
                                                              noticeController.selectPublishedDate( context),
                                                          child: Container(
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius .circular(  05),
                                                                color:
                                                                    screenContainerbackgroundColor,
                                                                border: Border.all(
                                                                    color: cBlack  .withOpacity(0.4))),
                                                            width: double.infinity,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Obx(() => TextFontWidget(
                                                                  text: noticeController .noticePublishedDateController .value ==   ''
                                                                      ? 'DD/MM/YYYY *'
                                                                      : noticeController
                                                                          .noticePublishedDateController
                                                                          .value,
                                                                  fontsize: 12.5)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ), ////////////////////////////////////////////////////////2
                                                Padding(
                                                  padding:  const EdgeInsets.only(  top: 5, left: 10,right: 10),
                                                  child:  TextFormFiledWithoutColorEight(
                                                    width: 500,
                                                    validator: checkFieldEmpty,
                                                    controller: noticeController .noticeSubjectController,
                                                    title: 'Subject',
                                                    hintText: 'Subject',
                                                  ),
                                                ), ///////////////////////////////////////////////3
                                                Padding(
                                                  padding:  const EdgeInsets.only( top: 5,left: 10, right: 10),
                                                  child:   Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextFontWidget(text: 'Date of occasion*', fontsize: 12.5),
                                                        GestureDetector(
                                                          onTap: () =>
                                                              noticeController.selectOccasionDate( context),
                                                          child: Container(
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius .circular(  05),
                                                                color:
                                                                    screenContainerbackgroundColor,
                                                                border: Border.all(
                                                                    color: cBlack  .withOpacity(0.4))),
                                                            width: double.infinity,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Obx(() => TextFontWidget(
                                                                  text: noticeController .noticeOccasionDateController .value ==   ''
                                                                      ? 'DD/MM/YYYY *'
                                                                      : noticeController
                                                                          .noticeOccasionDateController
                                                                          .value,
                                                                  fontsize: 12.5)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ), ////////////////////////////////////4
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          left: 10,
                                                          right: 10),
                                                  child:
                                                      TextFormFiledWithoutColorEight(
                                                    width: 500,
                                                    validator: checkFieldEmpty,
                                                    controller: noticeController
                                                        .noticevenueController,
                                                    title: 'Venue',
                                                    hintText: 'Venue',
                                                  ),
                                                ), ////////////////////////////////////5
                                                 Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          left: 10,
                                                          right: 10),
                                                  child:TextFormFiledWithoutColorEight(
                                                    width: 500,
                                                    validator: checkFieldEmpty,
                                                    controller: noticeController .noticeSignedByController,
                                                    title: 'Signed by',
                                                    hintText: 'Signed by',
                                                  ),
                                                ), ////////////////////////////////////7
                                                Padding(
                                                  padding: const EdgeInsets.only( top: 5, left: 10,right: 10),
                                                  child:   Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextFontWidget(text: 'Date of submission*', fontsize: 12.5),
                                                        GestureDetector(
                                                          onTap: () =>
                                                              noticeController.selectSubmissionDate( context),
                                                          child: Container(
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius .circular(  05),
                                                                color:
                                                                    screenContainerbackgroundColor,
                                                                border: Border.all(
                                                                    color: cBlack  .withOpacity(0.4))),
                                                            width: double.infinity,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Obx(() => TextFontWidget(
                                                                  text: noticeController .noticeSubmissionDateController .value ==   ''
                                                                      ? 'DD/MM/YYYY *'
                                                                      : noticeController
                                                                          .noticeSubmissionDateController
                                                                          .value,
                                                                  fontsize: 12.5)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          left: 10,
                                                          right: 10),
                                                  child:
                                                      TextFormFiledWithoutColorEight(
                                                    width: 500,
                                                    validator: checkFieldEmpty,
                                                    controller: noticeController.noticeGuestController,
                                                    title: 'Cheif guest',
                                                    hintText: 'Cheif guest',
                                                  ),
                                                ), ////////////////////////////////////6
                                               
                                              ],
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only( top: 10, bottom: 10),
                                              child: Center(
                                                  child: 
                                                 Obx(() =>
                                                      ProgressButtonWidget(
                                                          function: () async {
                                                            if (noticeController
                                                                .formKey
                                                                .currentState!
                                                                .validate()) {
                                                              noticeController
                                                                  .createNotice();
                                                              print("object");
                                                            }
                                                          },
                                                          buttonstate: noticeController .buttonstate.value,
                                                          text: 'Create Notice'))
                                                      // NoticeButtonContainerWidget(
                                                      //           text: 'Submit',
                                                      //          width: 300,
                                                      //         height: 50,
                                                      //         fontSize: 18,
                                                      //         onTap: () {
                                                      //            if (noticeController
                                                      //         .formKey
                                                      //         .currentState!
                                                      //         .validate()) {
                                                      //       noticeController
                                                      //           .createNotice();
                                                      //       print("object");
                                                      //     }
                                                      //         },
                                                      //         color: adminePrimayColor,
                                                      //   ),
                                                  ),
                                            )
                                          ],
                                        ),
                                      ),
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
          ],
        ),
      ),
    );
  }
}
