import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/widgets/Iconbackbutton.dart';
import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/list_of_schools/list_of_schools_screen.dart';
import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/requested_list/req_list_screen.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class IDCardsAdminPage extends StatelessWidget {
  const IDCardsAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ResponsiveWebSite.isMobile(context)
              ? IDCardsAdminPageMobileView(screenSize: screenSize)
              : ////////////////////////////////////////////.................Mobile View
              IDCardsAdminPageWebView(
                  screenSize:
                      screenSize) ///////////////////////..............Web view
        ],
      )),
    );
  }
}

class IDCardsAdminPageMobileView extends StatelessWidget {
  const IDCardsAdminPageMobileView({
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
                  image: AssetImage('webassets/images/id_card.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButtonBackWidget(
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 30,
                          width: 100,
                          child: Center(
                              child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          decoration: BoxDecoration(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height / 2.25),
                child: Container(
                  height: screenSize.height / 12,
                  width: screenSize.width / 1.5,
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(() => const SchoolsListScreen());
                    },
                    child: const Text(
                      "Students Cards",
                      style: TextStyle(
                          fontSize: 18,
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
                height: screenSize.height / 12,
                width: screenSize.width / 1.5,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(() => RequestedSchoolsListScreen());
                  },
                  child: const Text(
                    "Teachers Cards",
                    style: TextStyle(
                        fontSize: 18,
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
                height: screenSize.height / 12,
                width: screenSize.width / 1.5,
                child: const Center(
                    child: Text(
                  "Non Teaching Staffs Cards",
                  style: TextStyle(
                      fontSize: 18,
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

class IDCardsAdminPageWebView extends StatelessWidget {
  const IDCardsAdminPageWebView({
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
              IconButtonBackWidget(color: Colors.white),
            ],
          ),
          height: screenSize.height,
          width: screenSize.width / 2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('webassets/images/id_cards.jpg'),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: screenSize.height,
          width: screenSize.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      bottom: screenSize.height / 5,
                    ),
                    child: Container(
                      height: 40,
                      width: 120,
                      child: Center(
                          child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Container(
                height: screenSize.height / 6,
                width: screenSize.width / 3,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(const SchoolsListScreen());
                  },
                  child: Text(
                    "Students Cards",
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
                          Color.fromARGB(255, 28, 168, 207),
                          Color.fromARGB(255, 10, 144, 135),
                          Color.fromARGB(255, 140, 162, 232),
                          // Color.fromARGB(255, 202, 244, 203),
                          Color.fromARGB(255, 30, 214, 128),
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
                    "Teachers Cards",
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
                          Color.fromARGB(255, 67, 215, 171),
                          Color.fromARGB(255, 53, 164, 212),
                          Color.fromARGB(255, 201, 159, 235),
                          Color.fromARGB(255, 224, 216, 142),
                          Color.fromARGB(255, 156, 213, 229)
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
                  "Non Teaching Staffs Cards",
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
                          Color.fromARGB(255, 198, 242, 187),
                          Color.fromARGB(255, 182, 214, 242),
                          Color.fromARGB(255, 101, 196, 166),
                          Color.fromARGB(255, 155, 207, 236),
                          Color.fromARGB(255, 234, 155, 237)
                        ])),
              ),
            ],
          ),
        ),
      ],
    );
  }
}//////////////////////////////////......................Web and Tab view
