// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminLoginDetailHistoryModel {
  String docid;
  String loginTime;
  String adminuser;
  String? logOutTime;
   String date;
    String month;

  AdminLoginDetailHistoryModel({
    required this.docid,
    required this.loginTime,
    required this.adminuser,
    this.logOutTime,
    required this.date,
    required this.month,
  });


  AdminLoginDetailHistoryModel copyWith({
    String? docid,
    String? loginTime,
    String? adminuser,
    String? logOutTime,
    String? date,
    String? month,
  }) {
    return AdminLoginDetailHistoryModel(
      docid: docid ?? this.docid,
      loginTime: loginTime ?? this.loginTime,
      adminuser: adminuser ?? this.adminuser,
      logOutTime: logOutTime ?? this.logOutTime,
      date: date ?? this.date,
      month: month ?? this.month,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'loginTime': loginTime,
      'adminuser': adminuser,
      'logOutTime': logOutTime,
      'date': date,
      'month': month,
    };
  }

  factory AdminLoginDetailHistoryModel.fromMap(Map<String, dynamic> map) {
    return AdminLoginDetailHistoryModel(
      docid: map['docid'] as String,
      loginTime: map['loginTime'] as String,
      adminuser: map['adminuser'] as String,
      logOutTime: map['logOutTime'] != null ? map['logOutTime'] as String : null,
      date: map['date'] as String,
      month: map['month'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminLoginDetailHistoryModel.fromJson(String source) => AdminLoginDetailHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminLoginDetailHistoryModel(docid: $docid, loginTime: $loginTime, adminuser: $adminuser, logOutTime: $logOutTime, date: $date, month: $month)';
  }

  @override
  bool operator ==(covariant AdminLoginDetailHistoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.loginTime == loginTime &&
      other.adminuser == adminuser &&
      other.logOutTime == logOutTime &&
      other.date == date &&
      other.month == month;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      loginTime.hashCode ^
      adminuser.hashCode ^
      logOutTime.hashCode ^
      date.hashCode ^
      month.hashCode;
  }
}


class LoginTimeIDSavingClass {
  static String id = '';
  static String date ='';
  static String emailId='';
}
