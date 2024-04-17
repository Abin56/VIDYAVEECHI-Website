import 'package:get/get.dart';

import '../../model/loginHistory_model/login_history_model.dart';
import '../../view/utils/firebase/firebase.dart';
import '../../view/utils/shared_pref/user_auth/user_credentials.dart';

class AdminLoginHistroyController extends GetxController {
  // RxList <AdminLoginDetailHistoryModel> loginHistorylistMonth =RxList([]);
  List<AdminLoginDetailHistoryModel> loginHistorylistMonth = [];
  String loginTime = '';
  String month = '';
  String date = '';
  String docid = '';
  Rxn<AdminLoginDetailHistoryModel> loginhistoryModelData =
      Rxn<AdminLoginDetailHistoryModel>();

  RxBool loginHistroyontapped = false.obs;
  Future<void> getLoginHistory(String date, String month) async {
    final loginData = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection("LoginHistory")
        .doc(month)
        .collection(month)
        .doc(date)
        .collection(date)
        .get();
    print(date);

    loginHistorylistMonth = loginData.docs
        .map((e) => AdminLoginDetailHistoryModel.fromMap(e.data()))
        .toList();
    print(loginHistorylistMonth);
  }

  Future<List<AdminLoginDetailHistoryModel>> fetchTeacher(
      String date, String month, String docid) async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection("LoginHistory")
        .doc(month)
        .collection(month)
        .doc(date)
        .collection(date)
        .get();
    print(month);
    print(month);
    loginHistorylistMonth = firebase.docs
        .map((e) => AdminLoginDetailHistoryModel.fromMap(e.data()))
        .toList();

    return loginHistorylistMonth;
  }

  /////////////////////////////////////////\
  List<String> allLoginMonthList = [];
  RxString loginHMonthValue = ''.obs;
  Future<List<String>> fetchLoginHMonth() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('LoginHistory')
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['docid'];
      allLoginMonthList.add(list[i]);
    }
    return allLoginMonthList;
  }

  List<String> allLoginDayList = [];
  RxString loginHDayValue = ''.obs;
  Future<List<String>> fetchLoginHDay() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('LoginHistory')
        .doc(loginHMonthValue.value)
        .collection(loginHMonthValue.value)
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['docid'];
      allLoginDayList.add(list[i]);
    }
    return allLoginDayList;
  }
}
