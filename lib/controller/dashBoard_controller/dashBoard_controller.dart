import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class DashBoardController extends GetxController {
  RxList subjectID =[].obs;

   getSubjectID(
      String classID, String monthwise, String formatted) async {
    final result = await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(classID)
        .collection('Attendence')
        .doc(monthwise)
        .collection(monthwise)
        .doc(formatted)
        .collection('Subjects')
        .get();
    return result.docs[0].data()['docid'].toString();
  }
}
