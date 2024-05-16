// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/requested_list/req_list_screen.dart';

// import '../widgets/buttonContainer.dart';
// import 'list_of_schools/list_of_schools_screen.dart';

// class LeptonHomePage extends StatelessWidget {
//   const LeptonHomePage({super.key});
//   static const String route = '/homePage';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               onTap: () {
//                             Get.off(const SchoolsListScreen());

//               },
//               child: ButtonContainerWidget(
//                 curving: 30,
//                 colorindex: 0,
//                 height: 200,
//                 width: 400,
//                 child: Center(
//                     child: Text(
//                   'List of Schools',
//                   style: GoogleFonts.montserrat(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 )),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//              Get.off(RequestedSchoolsListScreen());
//               },
//               child: ButtonContainerWidget(
//                 curving: 30,
//                 colorindex: 6,
//                 height: 200,
//                 width: 400,
//                 child: Center(
//                     child: Text(
//                   'Requested List',
//                   style: GoogleFonts.montserrat(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 )),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
// ignore_for_file: sort_child_properties_last, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/widgets/Iconbackbutton.dart';
import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/list_of_schools/list_of_schools_screen.dart';
import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/requested_list/req_list_screen.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class SuperAdminPage extends StatelessWidget {
  const SuperAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ResponsiveWebSite.isMobile(context)
              ? superAdminPageMobileView(screenSize: screenSize)
              : ////////////////////////////////////////////.................Mobile View
              superAdminPageWebView(
                  screenSize:
                      screenSize) ///////////////////////..............Web view
        ],
      )),
    );
  }
}

class superAdminPageMobileView extends StatelessWidget {
  const superAdminPageMobileView({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('webassets/images/70264.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButtonBackWidget(
                color: Colors.white,
              ),
            ],
          ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: screenSize.height / 9,
                  width: screenSize.width / 1.5,
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(() => const SchoolsListScreen());
                    },
                    child: const Text(
                      "List of Schools",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 52, 91)),
                    ),
                  )),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color.fromARGB(255, 133, 202, 211),
                            Color.fromARGB(255, 179, 252, 208),
                            Color.fromARGB(255, 149, 242, 226),
                            // Color.fromARGB(255, 202, 244, 203),
                            Color.fromARGB(255, 167, 234, 240),
                            Color.fromARGB(255, 238, 227, 231)
                          ])),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenSize.height / 9,
                width: screenSize.width / 1.5,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => RequestedSchoolsListScreen());
                  },
                  child: const Text(
                    "Requested Lists",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 52, 91)),
                  ),
                )),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromARGB(255, 135, 195, 244),
                          Color.fromARGB(255, 243, 215, 248),
                          Color.fromARGB(255, 202, 244, 203),
                          Color.fromARGB(255, 221, 216, 171),
                          Color.fromARGB(255, 241, 216, 225)
                        ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenSize.height / 9,
                width: screenSize.width / 1.5,
                child: const Center(
                    child: Text(
                  "ID Cards",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 52, 91)),
                )),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromARGB(255, 202, 230, 195),
                          Color.fromARGB(255, 195, 218, 238),
                          Color.fromARGB(255, 202, 244, 203),
                          Color.fromARGB(255, 133, 181, 207),
                          Color.fromARGB(255, 224, 165, 226)
                        ])),
              ),
            ],
          ),
        )
      ],
    );
  }
} //////////////////////////////////............................Mobile view

class superAdminPageWebView extends StatelessWidget {
  const superAdminPageWebView({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButtonBackWidget(
                color: const Color.fromARGB(255, 2, 71, 167),
              ),
            ],
          ),
          height: screenSize.height,
          width: screenSize.width / 2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('webassets/images/102029.jpg'),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: screenSize.height,
          width: screenSize.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height / 6,
                width: screenSize.width / 3,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(const SchoolsListScreen());
                  },
                  child: Text(
                    "List of Schools",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isTablet(context) ? 20 : 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 5, 52, 91)),
                  ),
                )),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromARGB(255, 133, 202, 211),
                          Color.fromARGB(255, 179, 252, 208),
                          Color.fromARGB(255, 149, 242, 226),
                          // Color.fromARGB(255, 202, 244, 203),
                          Color.fromARGB(255, 167, 234, 240),
                          Color.fromARGB(255, 238, 227, 231)
                        ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenSize.height / 6,
                width: screenSize.width / 3,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(RequestedSchoolsListScreen());
                  },
                  child: Text(
                    "Requested Lists",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isTablet(context) ? 20 : 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 5, 52, 91)),
                  ),
                )),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromARGB(255, 135, 195, 244),
                          Color.fromARGB(255, 243, 215, 248),
                          Color.fromARGB(255, 202, 244, 203),
                          Color.fromARGB(255, 221, 216, 171),
                          Color.fromARGB(255, 241, 216, 225)
                        ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenSize.height / 6,
                width: screenSize.width / 3,
                child: Center(
                    child: Text(
                  "ID Cards",
                  style: TextStyle(
                      fontSize: ResponsiveWebSite.isTablet(context) ? 20 : 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 5, 52, 91)),
                )),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromARGB(255, 202, 230, 195),
                          Color.fromARGB(255, 195, 218, 238),
                          Color.fromARGB(255, 202, 244, 203),
                          Color.fromARGB(255, 133, 181, 207),
                          Color.fromARGB(255, 224, 165, 226)
                        ])),
              ),
            ],
          ),
        ),
      ],
    );
  }
}//////////////////////////////////......................Web and Tab view
