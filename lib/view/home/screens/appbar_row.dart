import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class ContentsHomePage1 extends StatelessWidget {
  const ContentsHomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "About",
      style: GoogleFonts.roboto(
          fontSize: ResponsiveWebSite.isDesktop(context) ? 18 : 14,
          fontWeight: ResponsiveWebSite.isDesktop(context)
              ? FontWeight.w500
              : FontWeight.w400,
          color: Colors.black),
    );
  }
}

class ContentsHomePage2 extends StatelessWidget {
  const ContentsHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        "Tution Center",
        style: GoogleFonts.roboto(
            fontSize: ResponsiveWebSite.isDesktop(context) ? 18 : 14,
            fontWeight: ResponsiveWebSite.isDesktop(context)
                ? FontWeight.w500
                : FontWeight.w400,
            color: Colors.black),
      ),
    );
  }
}

class ContentsHomePage3 extends StatelessWidget {
  const ContentsHomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Syllabus",
      style: GoogleFonts.roboto(
          fontSize: ResponsiveWebSite.isDesktop(context) ? 18 : 14,
          fontWeight: ResponsiveWebSite.isDesktop(context)
              ? FontWeight.w500
              : FontWeight.w400,
          color: Colors.black),
    );
  }
}

class ContentsHomePage4 extends StatelessWidget {
  const ContentsHomePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Mock Test",
      style: GoogleFonts.roboto(
          fontSize: ResponsiveWebSite.isDesktop(context) ? 18 : 14,
          fontWeight: ResponsiveWebSite.isDesktop(context)
              ? FontWeight.w500
              : FontWeight.w400,
          color: Colors.black),
    );
  }
}

class ContentsHomePage5 extends StatelessWidget {
  const ContentsHomePage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Previous Qn",
      style: GoogleFonts.roboto(
          fontSize: ResponsiveWebSite.isDesktop(context) ? 18 : 14,
          fontWeight: ResponsiveWebSite.isDesktop(context)
              ? FontWeight.w500
              : FontWeight.w400,
          color: Colors.black),
    );
  }
}
