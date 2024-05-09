// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardModel {
  String cardId;
  String deviceId;
  String time;
  
  CardModel({
    required this.cardId,
    required this.deviceId,
    required this.time,
    
  });

  CardModel copyWith({
    String? cardId,
    String? deviceId,
    String? time,
    
  }) {
    return CardModel(
      cardId: cardId ?? this.cardId,
      deviceId: deviceId ?? this.deviceId,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardId': cardId,
      'deviceId': deviceId,
      'time': time,
      
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardId: map['docid'] as String,
      deviceId: map['userName'] as String,
      time: map['userClass'] as String,
      
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(docid: $cardId, userName: $deviceId, userClass: $time,)';
  }

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cardId == cardId &&
      other.deviceId == deviceId &&
      other.time == time;
  }

  @override
  int get hashCode {
    return cardId.hashCode ^
      deviceId.hashCode ^
      time.hashCode;
  }
}