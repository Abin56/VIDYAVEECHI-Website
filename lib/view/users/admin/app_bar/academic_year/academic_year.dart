import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/app_bar/academic_year/add_academic.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

academicYearSettingFunction(BuildContext context) {
  final academicYearListWidegt = [
    GestureDetector(
      onTap: () {
        addAcademicYearFunction(context);
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: themeColorBlue,
            border: Border.all(color: themeColorBlue),
            borderRadius: BorderRadius.circular(05)),
        child: const Center(
          child: TextFontWidget(
            text: "Add Academic Year",
            fontsize: 14,
            // fontWeight: FontWeight.w600,
            color: cWhite,
          ),
        ),
      ),
    ), ///////////////////////.......0
    GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: themeColorBlue,
            border: Border.all(color: themeColorBlue),
            borderRadius: BorderRadius.circular(05)),
        child: const Center(
          child: TextFontWidget(
            text: "Set Academic Year",
            fontsize: 14,
            // fontWeight: FontWeight.w600,
            color: cWhite,
          ),
        ),
      ),
    ), ////////////////...............1
    GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: themeColorBlue,
            border: Border.all(color: themeColorBlue),
            borderRadius: BorderRadius.circular(05)),
        child: const Center(
          child: TextFontWidget(
            text: "Cancel",
            fontsize: 14,
            // fontWeight: FontWeight.w600,
            color: cWhite,
          ),
        ),
      ),
    ), //////////////////.............2
  ];
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const TextFontWidget(text: "Change Academic Year", fontsize: 15),
        backgroundColor: cWhite,
        content: SizedBox(
          height: ResponsiveWebSite.isMobile(context)? 220: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 70,
                // color: cWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFontWidget(
                        text: 'Select Academic Year*', fontsize: 12.5),
                    const SizedBox(
                      height: 05,
                    ),
                    SizedBox(
                      height: 40,
                      child: DropdownSearch(
                        selectedItem: '2024-2025',
                        items: const ['2024-2025', '2023-2024'],
                      ),
                    ),
                  ],
                ),
              ),
              ResponsiveWebSite.isMobile(context)
                  ? Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: academicYearListWidegt[
                                0] ///////////////............add year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                                academicYearListWidegt[1] //////........set year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: academicYearListWidegt[
                                2] ///////////////////.............cancel
                            ),
                      ],
                    )
                  : Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: academicYearListWidegt[
                                0] ///////////////............add year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                academicYearListWidegt[1] //////........set year
                            ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: academicYearListWidegt[
                                2] ///////////////////.............cancel
                            ),
                      ],
                    ),
            ],
          ),
        ),
      );
    },
  );
}
