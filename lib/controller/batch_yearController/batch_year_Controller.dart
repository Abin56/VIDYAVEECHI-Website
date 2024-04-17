import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/splash_screen/splash_screen.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class BatchYearController extends GetxController {
  List<String> allbatchList = [];
  RxString batchyearValue = ''.obs;
  Future<List<String>> fetchBatchyear() async {
    final firebase = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection("BatchYear")
        .get();

    for (var i = 0; i < firebase.docs.length; i++) {
      final list = firebase.docs[i].data()['id'];
      allbatchList.add(list[i]);
    }
    return allbatchList;
  }
  

  Future<void> setBatchYear() async {
    await SharedPreferencesHelper.setString(
            SharedPreferencesHelper.batchIdKey, batchyearValue.value)
        .then((value) async {
      Get.offAll(() => SplashScreen());
    });
  }
}
