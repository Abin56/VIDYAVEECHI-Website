import 'package:flutter/material.dart';

class AdminDetailsModel {
  String adminId;
  String adminName;
  String? email;
  String? phoneNumber;
  String? activeDeacitve;

  AdminDetailsModel({
   required this.adminId,
   required this.adminName,
   this.email,
   this.phoneNumber,
   this.activeDeacitve
  });
}
