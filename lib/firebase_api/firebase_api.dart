import 'package:firebase_messaging/firebase_messaging.dart';
Future <void> handlebackgroundMessage(RemoteMessage message)async{
print('Title:${message.notification?.title}');
print('Body:${message.notification?.body}');
print('PayLoad:${message.data}');
}

class FirebaseApi{
  final _firebaseMessaging= FirebaseMessaging.instance;
  Future <void> initNotifications()async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token:$fCMToken');

    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
  }
}