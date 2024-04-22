// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminDetailsModel {
  String adminId;
  String username;
  String email;
  String phoneNumber;
  bool active;

  AdminDetailsModel({
    required this.adminId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.active,
  });

  AdminDetailsModel copyWith({
    String? adminId,
    String? username,
    String? email,
    String? phoneNumber,
    bool? active,
  }) {
    return AdminDetailsModel(
      adminId: adminId ?? this.adminId,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adminId': adminId,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'active': active,
    };
  }

  factory AdminDetailsModel.fromMap(Map<String, dynamic> map) {
    return AdminDetailsModel(
      adminId: map['adminId'] ??'',
      username: map['username'] ??'',
      email: map['email'] ??'',
      phoneNumber: map['phoneNumber'] ??'',
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminDetailsModel.fromJson(String source) => AdminDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminDetailsModel(adminId: $adminId, username: $username, email: $email, phoneNumber: $phoneNumber, active: $active)';
  }

  @override
  bool operator ==(covariant AdminDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.adminId == adminId &&
      other.username == username &&
      other.email == email &&
      other.phoneNumber == phoneNumber &&
      other.active == active;
  }

  @override
  int get hashCode {
    return adminId.hashCode ^
      username.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      active.hashCode;
  }
}
