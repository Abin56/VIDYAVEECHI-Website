import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/notice_controller/notice_controller.dart';
import 'package:vidyaveechi_website/model/notice_model/notice_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notice/notice_create.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notice/notice_data_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class NoticeEditRemove extends StatelessWidget {
  final NoticeController noticeController = Get.put(NoticeController());
  NoticeEditRemove({
    Key? key,
    // required this.schoolID
  }) : super(key: key);

  // String schoolID;

  //bool? valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: screenContainerbackgroundColor,
      height: 800,
      width: 1200,
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notice ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GooglePoppinsWidgets(
              text: 'Notice ',
              fontsize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          CreateNotice(),////////////////////////........................Notice Creation Page
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: CreateNotice(),
          ),
          Container(
            color: cWhite,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                color: cWhite,
                height: 40,
                child: const Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child:
                            CatrgoryTableHeaderWidget(headerTitle: 'Heading')),
                    SizedBox(
                      width: 01,
                    ),
                    Expanded(
                        flex: 3,
                        child:
                            CatrgoryTableHeaderWidget(headerTitle: 'Subject')),
                    SizedBox(
                      width: 02,
                    ),
                    Expanded(
                        flex: 2,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'Date')),
                    SizedBox(
                      width: 02,
                    ),
                    Expanded(
                        flex: 2,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'venue')),
                    SizedBox(
                      width: 02,
                    ),
                    Expanded(
                        flex: 2,
                        child: CatrgoryTableHeaderWidget(
                            headerTitle: 'Chief Guest')),
                    SizedBox(
                      width: 02,
                    ),
                    Expanded(
                      flex: 2,
                      child:
                          CatrgoryTableHeaderWidget(headerTitle: 'Signed by'),
                    ),
                    SizedBox(
                      width: 02,
                    ),
                    Expanded(
                      flex: 1,
                      child: CatrgoryTableHeaderWidget(headerTitle: 'Edit'),
                    ),
                    SizedBox(
                      width: 02,
                    ),
                    Expanded(
                      flex: 1,
                      child: CatrgoryTableHeaderWidget(headerTitle: 'Delete'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection(UserCredentialsController.batchId!)
                    .doc(UserCredentialsController.batchId!)
                    .collection('AdminNotices')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // ignore: prefer_is_empty
                  if (snapshot.data!.docs.length == 0) {
                    return Center(
                        child: Text(
                      'No Notices',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ));
                  }
                  return GridView.count(
                    crossAxisCount: ResponsiveWebSite.isMobile(context) ? 1 : 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children:
                        List.generate(snapshot.data!.docs.length, (index) {
                      NoticeModel data = NoticeModel.fromMap(
                          snapshot.data!.docs[index].data());
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 700,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cWhite,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 160,
                                  height: 60,
                                  color: screenContainerbackgroundColor,
                                  child: Center(
                                    child: TextFontWidget(
                                        text: 'Notice', fontsize: 18),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: AbsorbPointer(
                                        absorbing: true,

                                        child: DisplayingText(
                                          validator: checkFieldEmpty,

                                          text: '  ${data.heading}',
                                          title: "  Heading",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: DisplayingText(
                                          validator: checkFieldEmpty,
                                            text: '  ${data.subject}',
                                            title: "  Subject"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: DisplayingText(
                                          validator: checkFieldEmpty,
                                            text: '  ${data.dateofoccation}',
                                            title: "  Date of occation"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: DisplayingText(
                                          validator: checkFieldEmpty,
                                            text: '  ${data.venue}',
                                            title: "  Venue"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: DisplayingText(
                                          validator: checkFieldEmpty,
                                            text: '  ${data.chiefGuest}',
                                            title: "  Chief Guest"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: DisplayingText(
                                          validator: checkFieldEmpty,
                                            text: '  ${data.signedBy}',
                                            title: "  Signed By",
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(top: 10, left: 10),
                              //         child: GooglePoppinsWidgets(
                              //           text: data.heading,
                              //           // snapshot.data!.docs[index]['noticeheading'],
                              //           fontsize: 18,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(top:10,left: 10,right: 10,bottom: 5),
                              //         child: GooglePoppinsWidgets(
                              //           text: data.subject,
                              //           //snapshot.data!.docs[index]['noticesubject'],
                              //           fontsize: 14,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:10,left: 10,right: 10,bottom: 5),
                              //   child: GooglePoppinsWidgets(
                              //     text: data.dateofoccation,
                              //     //snapshot.data!.docs[index]['occcationDate'],
                              //     fontsize: 14,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:10,left: 10,right: 10,bottom: 5),
                              //   child: GooglePoppinsWidgets(
                              //     text: data.venue,
                              //     //snapshot.data!.docs[index]['heading']['noticeVenue'],
                              //     fontsize: 14,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:10,left: 10,right: 10,bottom: 5),
                              //   child: GooglePoppinsWidgets(
                              //     text: data.chiefGuest,
                              //     //snapshot.data!.docs[index]['Chiefguest'],
                              //     fontsize: 14,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top:10,left: 10,right: 10,bottom: 5),
                              //   child: GooglePoppinsWidgets(
                              //     text: data.signedBy,
                              //     //snapshot.data!.docs[index]['noticeSignedby'],
                              //     fontsize: 14,
                              //   ),
                              // ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: MaterialButton(
                                          onPressed: () {
                                            customShowDilogBox(
                                                context: context,
                                                title: 'Edit',
                                                children: [
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText: data.heading,
                                                    title: 'Heading',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText:
                                                        data.publishedDate,
                                                    title: 'Published Date',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText: data.subject,
                                                    title: 'Subject',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText:
                                                        data.dateofoccation,
                                                    title: 'Date Of Occation',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText: data.venue,
                                                    title: 'Venue',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText:
                                                        data.dateOfSubmission,
                                                    title: 'Date Of Submission',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText: data.chiefGuest,
                                                    title: 'Cheif guest',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                  TextFormFiledBlueContainerWidgetEvent(
                                                    hintText: data.signedBy,
                                                    title: 'Signed by',
                                                    validator: checkFieldEmpty,
                                                  ),
                                                ],
                                                doyouwantActionButton: true,
                                                actiononTapfuction: () {
                                                  noticeController.updateNotice(
                                                    data.noticeId,
                                                    context,
                                                  );
                                                },
                                                actiontext: 'Update');
                                          },
                                          color: cBlue,
                                          child: GooglePoppinsWidgets(
                                            text: 'Edit',
                                            fontsize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            customShowDilogBox(
                                                context: context,
                                                title: 'Delete',
                                                children: [
                                                  GooglePoppinsWidgets(
                                                      text:
                                                          'Are you sure to want delete',
                                                      fontsize:
                                                          ResponsiveWebSite
                                                                  .isMobile(
                                                                      context)
                                                              ? 12
                                                              : 15)
                                                ],
                                                actiononTapfuction: () {
                                                  print(data.noticeId);
                                                  noticeController.deleteNotice(
                                                    data.noticeId,
                                                    context,
                                                  );
                                                },
                                                doyouwantActionButton: true);
                                          },
                                          color: cred,
                                          child: GooglePoppinsWidgets(
                                            text: 'Delete',
                                            fontsize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }),
            child: Container(
              width: 1200,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: cWhite,
                border: Border.all(color: cWhite),
              ),
              child: StreamBuilder(
                  stream: server
                      .collection('SchoolListCollection')
                      .doc(UserCredentialsController.schoolId)
                      .collection(UserCredentialsController.batchId!)
                      .doc(UserCredentialsController.batchId!)
                      .collection('AdminNotices')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // ignore: prefer_is_empty
                    if (snapshot.data!.docs.length == 0) {
                      return const Center(
                          child: Text(
                        'No Notices',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ));
                    }
                    return ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        NoticeModel data = NoticeModel.fromMap(
                            snapshot.data!.docs[index].data());
                        return AllNoticeDataList(data: data, index: index);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 02,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiledBlueContainerWidgetEvent extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String title;
  final String hintText;
  final Widget? widget;
  Function(String)? onChanged;
  Iterable<String>? autofillHints;
  String? Function(String?)? validator;
  Function()? onTap;
  TextInputType? keyboardType;
  TextFormFiledBlueContainerWidgetEvent({
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
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextFontWidget(text: '$title *', fontsize: 12.5),
              widget == null ? const SizedBox() : widget!,
            ],
          ),
          const SizedBox(
            height: 05,
          ),
          Container(
            height: 60,
            width: 500,
            color: screenContainerbackgroundColor,
            child: Center(
              child: TextFormField(
                maxLines: 5,
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
