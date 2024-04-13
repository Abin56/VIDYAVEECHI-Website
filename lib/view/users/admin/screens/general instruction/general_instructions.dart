import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/general%20instruction/general_instruction.dart';
import 'package:vidyaveechi_website/model/general_instruction_model/general_instruction.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/general%20instruction/add_general_instruction.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showdialouge/custom_showdialouge.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

class GeneralInsructions extends StatelessWidget {
  final GeneralInsructionController generalInsructionController =
      Get.put(GeneralInsructionController());
  GeneralInsructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: screenContainerbackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Row(
                  children: [
                    const TextFontWidget(
                      text: 'General Instructions',
                      fontsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                            addFunctionGenernalInstruction(context ) ;},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: adminePrimayColor),
                          height: 38,
                          width: 100,
                          child: Center(
                              child: GooglePoppinsWidgets(
                            text: 'Add',
                            fontsize: 14,
                            fontWeight: FontWeight.w500,color: cWhite,
                          )),
                        )
                        )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 25,
                    left: ResponsiveWebSite.isMobile(context) ? 05 : 10),
              ),
              // Obx(() {
              //   return generalInsructionController.isLoading.value
              //       ? const Center(
              //           child: CircularProgressIndicator(),
              //         )
                //    :
                     SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: cWhite,
                          border: Border.all(color: cBlue)),
                          height: 700,
                          width: double.infinity,
                          child: StreamBuilder(
                            stream:  server
                    .collection('SchoolListCollection')
                    .doc(UserCredentialsController.schoolId)
                    .collection(UserCredentialsController.batchId!)
                    .doc(UserCredentialsController.batchId!)
                    .collection('Admin_general_instructions')
                    .snapshots(),
                            builder: (context, snapshot) {
                               if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // ignore: prefer_is_empty
                  if (snapshot.data!.docs.length == 0) {
                    return Center(
                        child: Text(
                      'No General_instructions',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ));
                  }
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 650,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                         GeneralInstructionsModel data = GeneralInstructionsModel.fromMap(
                                snapshot.data!.docs[index].data() );
                                       return  Padding(
                                         padding: const EdgeInsets.all(8.0),
                                        //  child: Container(
                                        //   height: 50,
                                        //   width: double.infinity,
                                        //   decoration: BoxDecoration(border: Border.all(color: adminePrimayColor)),
                                        //   alignment: Alignment.centerLeft,
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextFontWidget(text:'⋇ ${data.instruction}', fontsize: 14,fontWeight: FontWeight.w500,),
                                              Row(children: [
                                               GestureDetector(
                                          onTap: () {
                                            customShowDilogBox(
                                                context: context,
                                                title: 'Edit',
                                                children: [
                                                  TextFormFiledBlueContainerWidgetWithOutColor(
                                                      hintText: generalInsructionController.instructionController.text,
                                                      title:
                                                          'General Instruction')
                                                ],actiononTapfuction: () {
                                                   generalInsructionController.updateInstructions(data.instructionId,generalInsructionController.instructionController.text.trim() );

                                                },
                                                doyouwantActionButton: true,
                                                actiontext: 'Update');
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: cgreen.withOpacity(1),
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.delete,
                                          color: cred.withOpacity(1),
                                        ),
                                        onTap: () {
                                          customShowDilogBox(
                                              context: context,
                                              title: 'Delete',
                                              children: [
                                                GooglePoppinsWidgets(
                                                    text:
                                                        'Are you sure to want delete',
                                                    fontsize: ResponsiveWebSite
                                                            .isMobile(context)
                                                        ? 12
                                                        : 15)
                                              ],
                                              doyouwantActionButton: true,
                                              actiononTapfuction: () {
                                                generalInsructionController.removeInstruction();
                                              },
                                              );
                                        },
                                      )
                                      ],),
                                            ],
                                          ),
                                         //  ),
                                       );
                                      },
                                      separatorBuilder: (context, index) => SizedBox(height: 2,),
                                      itemCount: snapshot.data!.docs.length,
                                     // child:
                                    ),
                                  )
                                ],
                              );
                            }
                          ),
                        ),
                      ),
                        // child: SizedBox(
                        //   // height: 800,
                        //   width: 1000,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //       horizontal: 100,
                        //       vertical: 30,
                        //     ),
                        //     child: Container(
                        //       margin: const EdgeInsets.only(top: 10),
                        //       child: StreamBuilder(
                        //         stream: server
                        //       .collection('SchoolListCollection')
                        //       .doc(UserCredentialsController.schoolId)
                        //       .collection(UserCredentialsController.batchId!)
                        //       .doc(UserCredentialsController.batchId!)
                        //       .collection('Admin_general_instructions')
                        //       .snapshots(),
                        //         builder: (context, snapshot) {
                        //            if (snapshot.connectionState ==
                        //         ConnectionState.waiting) {
                        //       return const Center(
                        //           child: CircularProgressIndicator());
                        //     }
                        //     // ignore: prefer_is_empty
                        //     if (snapshot.data!.docs.length == 0) {
                        //       return Center(
                        //           child: Text(
                        //         'No General_instructions',
                        //         style: GoogleFonts.poppins(
                        //             fontSize: 20, fontWeight: FontWeight.w500),
                        //       ));
                        //     }
                        //           return Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               Container(
                        //                 width: 1000,
                        //                 decoration: BoxDecoration(
                        //                     color: cWhite,
                        //                     borderRadius: BorderRadius.circular(5)),
                        //                 child: Column(
                        //                   children: [
                        //                     Center(
                        //                         child: Padding(
                        //                       padding:
                        //                           const EdgeInsets.only(top: 20),
                        //                       child: GooglePoppinsWidgets(
                        //                         text: 'General Instructions',
                        //                         fontsize: 18,
                        //                         fontWeight: FontWeight.bold,
                        //                       ),
                        //                     )),
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(
                        //                           left: 40, top: 20),
                        //                       child: ListView.separated(
                        //                           shrinkWrap: true,
                        //                           itemBuilder: (context, index) {
                        //                             final data = GeneralInstructionsModel.fromMap(
                        //                                     snapshot.data!.docs[index].data());
                        //                             // if (index ==
                        //                             //     (generalInstructionsController
                        //                             //         .listOfGeneralIModel.length))
                        //                             {
                        //                               return Padding(
                        //                                 padding:
                        //                                     const EdgeInsets.only(
                        //                                         right: 20),
                        //                                 child: Column(
                        //                                   crossAxisAlignment:
                        //                                       CrossAxisAlignment
                        //                                           .end,
                        //                                   children: [
                        //                                     const SizedBox(
                        //                                       height: 10,
                        //                                     ),
                        //                                     Row(
                        //                                         mainAxisAlignment: MainAxisAlignment  .start,
                        //                                         children: [
                        //                                           Flexible(
                        //                                             child: Text(
                        //                                               data.instruction,
                        //                                               style: GoogleFonts.roboto(
                        //                                                   fontSize: ResponsiveWebSite.isMobile(
                        //                                                           context)
                        //                                                       ? 12
                        //                                                       : 15),
                        //                                               softWrap:
                        //                                                   true,
                        //                                             ),
                        //                                           ),
                        //                                         ]),
                        //                                   ],
                        //                                 ),
                        //                               );
                        //                             }
                        //                             // return InstructionTextWidget(
                        //                             //   count: (index + 1).toString(),
                        //                             //   text: generalInstructionsController
                        //                             //       .listOfGeneralIModel[index].instruction,
                        //                             // );
                        //                           },
                        //                           separatorBuilder:
                        //                               (context, index) {
                        //                             return const SizedBox(
                        //                               height: 20,
                        //                             );
                        //                           },
                        //                           itemCount: snapshot.data!.docs.length
                        //                           // generalInstructionsController.listOfGeneralIModel.length +1
                        //                           ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               )
                                  
                        //               // sizedBoxH20,
                                  
                        //               // Expanded(
                        //               //   child: ListView.builder(
                        //               //       itemCount: generalInsructionController
                        //               //           .instructionList.length,
                        //               //       itemBuilder: (context, index) {
                        //               //         return Text(
                        //               //             '•  ${generalInsructionController.instructionList[index]}');
                        //               //       }),
                        //               // ),
                        //             ],
                        //           );
                        //         }
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      )
             // })
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

