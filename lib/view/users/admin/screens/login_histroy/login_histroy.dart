import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/login_histroy_controller/login_histroy_controller.dart';
import 'package:vidyaveechi_website/model/loginHistory_model/login_history_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/login_histroy/login_histroy_datalist.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/create_parent/create_parent.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

import '../../../../drop_down/login_history/select_date.dart';
import '../../../../drop_down/login_history/select_month.dart';

class LoginHistroyContainer extends StatelessWidget {
  final AdminLoginHistroyController adminLoginHistroyController =
      Get.put(AdminLoginHistroyController());
  
  LoginHistroyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => adminLoginHistroyController.loginHistroyontapped.value == true
        ? CreateParent()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: screenContainerbackgroundColor,
              height: 1000,
              width: 1150,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding: EdgeInsets.only(left: 25, top: 25),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: TextFontWidget(
                          text: 'Login List',
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 05),
                            child: RouteSelectedTextContainer(title: 'Login Histroy'),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 250,
                              height: 70,
                              //  color: cWhite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   TextFontWidget(text: 'Month *', fontsize: 12.5),
                                  const SizedBox(
                                    height: 05,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: SelectLoginMonthDropDown(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 70,
                              // color: cWhite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFontWidget(text: 'Date *', fontsize: 12.5),
                                  const SizedBox(
                                    height: 05,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: SelectLoginDateDropDown(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
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
                                    flex: 1, child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
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
                                    flex: 4, child: CatrgoryTableHeaderWidget(headerTitle: 'Name')),
                                SizedBox(
                                  width: 02,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: CatrgoryTableHeaderWidget(headerTitle: 'E mail')),
                                SizedBox(
                                  width: 02,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: CatrgoryTableHeaderWidget(headerTitle: 'Login Time')),
                                SizedBox(
                                  width: 02,
                                ),

                                Expanded(
                                    flex: 3,
                                    child: CatrgoryTableHeaderWidget(headerTitle: 'Logout Time')),
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 1150,
                          decoration: BoxDecoration(
                            color: cWhite,
                            border: Border.all(color: cWhite),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: SizedBox(
                              // width: 1100,
                              child: StreamBuilder(
                                stream: server
                                    .collection('SchoolListCollection')
                                    .doc(UserCredentialsController.schoolId)
                                    .collection('LoginHistroy')
                                    .snapshots(),
                                builder: (context, snaPS) {
                                  if (snaPS.hasData) {
                                    return ListView.separated(
                                        itemBuilder: (context, index) {
                                          final data = AdminLoginDetailHistoryModel.fromMap(
                                              snaPS.data!.docs[index].data());
                                          return GestureDetector(
                                            onTap: () {
                                              // adminLoginHistroyController
                                              //     .parentModelData
                                              //     .value = data;
                                              // adminLoginHistroyController
                                              //     .loginHistroyontapped
                                              //     .value = true;
                                            },
                                            child: AllLoginLogoutDataList(
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
                                        itemCount:
                                            //  100);
                                            snaPS.data!.docs.length);
                                    //           //////////
                                  } else {
                                    return const LoadingWidget();
                                  }
                                },
                              ), ////////
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
  }
}
