import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/controller/login_histroy_controller/login_histroy_controller.dart';
import 'package:vidyaveechi_website/model/loginHistory_model/login_history_model.dart';




class SelectMonthWiseDropdown extends StatelessWidget {
  SelectMonthWiseDropdown({
    Key? key,
    required this.date,
    required this.month,
    required this.docId
  }) : super(key: key);

  final classCtrl = Get.put(AdminLoginHistroyController());
  final String docId;
   final String date;
    final String month;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownSearch<AdminLoginDetailHistoryModel>(
      validator: (item) {
        if (item == null) {
          return "Required field";
        } else {
          return null;
        }
      },

      // autoValidateMode: AutovalidateMode.always,

      asyncItems: (value) {
        classCtrl.loginHistorylistMonth.clear();

        return classCtrl.fetchTeacher(docId,date,month);
      },
      itemAsString: (value) => value.loginTime!,
      onChanged: (value) async {
        if (value != null) {
          classCtrl.loginTime = value.loginTime!;
        //  classCtrl.teacherId = value.docid!;
        }
      },
      popupProps: const PopupProps.menu(
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  hintText: "Search Class", border: OutlineInputBorder())),
          showSearchBox: true,
          searchDelay: Duration(microseconds: 10)),
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black.withOpacity(0.7))),
    ));
  }
}

