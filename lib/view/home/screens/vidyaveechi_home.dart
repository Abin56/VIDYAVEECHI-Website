import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/Registration/registrationpage.dart';
import 'package:vidyaveechi_website/view/home/screens/create_school/create_school.dart';
import 'package:vidyaveechi_website/view/home/screens/home_page_contents%20.dart';
import 'package:vidyaveechi_website/view/home/screens/lepton_logo_appbar.dart';
import 'package:vidyaveechi_website/view/home/screens/popup_menu_home_page.dart';
import 'package:vidyaveechi_website/view/home/screens/tree_part.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class VidhyaVeechiHomePageResponsive extends StatelessWidget {
  const VidhyaVeechiHomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: ResponsiveWebSite.isMobile(context)
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 80,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "webassets/images/logo5.png",
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //     left: screenSize.width / 70,
                              //   ),
                              //   child: Container(
                              //     height: screenSize.width / 15,
                              //     width: screenSize.width / 15,
                              //     color: Colors.transparent,
                              //     child: Image.asset(
                              //         "webassets/images/leptonlogo.png"),
                              //   ),
                              // ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Lepton",
                                      style: GoogleFonts.dmSerifDisplay(
                                          color: const Color.fromARGB(
                                              255, 38, 93, 15),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    "VidyaVeechi",
                                    style: GoogleFonts.dmSerifDisplay(
                                        color: const Color.fromARGB(
                                            255, 43, 97, 19),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: PopupMenuExample(),
                            ),
                          ), //////////////////////////////////////////...............menu button
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(width: 1, color: cgreen),
                                    borderRadius: BorderRadius.circular(10)),
                                height: 25,
                                width: 80,
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                ),
                              ),
                            ),
                          ), //////////////////////////////////.............Login
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          0.1,
                          0.4,
                          0.8,
                          0.9,
                        ],
                        colors: [
                          Color.fromARGB(255, 6, 152, 225),
                          Color.fromARGB(248, 3, 201, 231),
                          Color.fromARGB(255, 124, 196, 232),
                          Colors.white70
                        ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 5,
                          // top: screenSize.width / 15,
                        ),
                        child: Text(
                          "VIDYAVEECHI",
                          style: GoogleFonts.spectral(
                              fontSize: 30,
                              //fontSize: screenSize.width / 37,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Smart Pathways to the Parallel World",
                          style: GoogleFonts.spectral(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Container(
                                height: 200,
                                width: 300,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "webassets/images/book-removebg-preview.png"),
                                        fit: BoxFit.fitWidth)),
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Text("വിദ്യാവീചി",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(196, 150, 221, 215),
                            ),
                            onPressed: () {},
                            child: Text(
                              'What We Provide',
                              style: GoogleFonts.spectral(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "Tution Center Solutions",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          "At Vidyaveechi, we believe that education is not just about imparting knowledge; it's about creating an ecosystem where learning thrives. With our cutting-edge educational infrastructure app, we are redefining the way educational institutes operate, collaborate, and engage with students, parents, teachers, and administrators.",
                          style: GoogleFonts.spectral(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "For a demo, please register your school. Our team will contact you to onboard you to the Vidyaveechi app",
                          style: GoogleFonts.spectral(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50, left: 10, bottom: 40, right: 10),
                        child: Column(
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  print("object");
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return RegisrationPage();
                                    },
                                  ));
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: 270,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 75, 131, 252),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'STUDENT REGISTRATION',
                                      style: GoogleFonts.poppins(
                                          fontSize:screenSize.width / 30,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: SizedBox(
                                height: 40,
                                width: 270,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 102, 206, 169),
                                    // backgroundColor: const Color.fromARGB(255, 102, 206, 169),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const SchoolProfile();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    'SCHOOL REGISTRATION',
                                    style: GoogleFonts.poppins(
                                        fontSize: screenSize.width/30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : Column(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: ResponsiveWebSite.isTablet(context)
                                  ? 20
                                  : ResponsiveWebSite.isMobile(context)
                                      ? 10
                                      : 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 650,
                                width: screenSize.width,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [
                                        0.1,
                                        0.4,
                                        0.6,
                                        0.8,
                                      ],
                                      colors: [
                                        Color.fromARGB(255, 6, 152, 225),
                                        Color.fromARGB(248, 3, 201, 231),
                                        Color.fromARGB(255, 124, 196, 232),
                                        Colors.white70
                                      ]),
                                ),
                                child:
                                    const HomePageContents(), ////////////text
                              ),
                            ],
                          ),
                        ),
                        LeptonLogoVidyaveechi(
                            screenSize: screenSize), ///////////appbar
                        Positioned(
                          right: 50,
                          child: HomePageDesign(
                              screenSize: screenSize), /////////////////tree
                        ),
                      ],
                    ),
                    // GridViewNew(screenSize: screenSize),
                    // Container(
                    //   height: screenSize.width / 5,
                    //   width: screenSize.width,
                    //   color: Colors.lightBlueAccent,
                    // ),
                  ],
                )
              ],
            ),
    );
  }
}
