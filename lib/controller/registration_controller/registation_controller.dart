import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:vidyaveechi_website/model/class_model/class_model.dart';
import 'package:vidyaveechi_website/model/registation_student_count_model.dart/registration_studentCount_model.dart';
import 'package:vidyaveechi_website/model/student_model/student_model.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/custom_showdilog.dart';
import 'package:vidyaveechi_website/view/widgets/drop_DownList/schoolDropDownList.dart';

class RegistrationController extends GetxController {
  int notifierCounter = 0;
  RxBool ontapRegiStudentList = false.obs;
  List<ClassModel> allclassList = [];
  RxString batchYear = ''.obs;
  RxString className = ''.obs;
  RxString classDocID = ''.obs;
  Rx<ButtonState> buttonstate = ButtonState.idle.obs;
   final formKey = GlobalKey<FormState>();
  Future<List<ClassModel>> fetchClass() async {
    await server
        .collection('SchoolListCollection')
        .doc(schoolListValue?['docid'])
        .get()
        .then((value) async {
      batchYear.value = value.data()!['batchYear'];
      log("message............... ${batchYear.value}");
    }).then((value) async {
      await server
          .collection('SchoolListCollection')
          .doc(schoolListValue?['docid'])
          .collection(batchYear.value)
          .doc(batchYear.value)
          .collection('classes')
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          final list = value.docs.map((e) => ClassModel.fromMap(e.data())).toList();
          allclassList.add(list[i]);
        }
        allclassList.sort((a, b) => a.className.compareTo(b.className));
      });
    });

    return allclassList;
  }

  Future<void> addAllRegStudentToClass(String? classID) async {
    try {
      buttonstate.value = ButtonState.loading;
      await server
          .collection('SchoolListCollection')
          .doc(UserCredentialsController.schoolId)
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(classID)
          .collection('RegTemp_Students')
          .get()
          .then((value) async {
        for (var i = 0; i < value.docs.length; i++) {
          final list = value.docs.map((e) => StudentModel.fromMap(e.data())).toList();
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('classes')
              .doc(classID)
              .collection('Temp_Students')
              .doc(list[i].docid)
              .set(list[i].toMap())
              .then((value) async {
            await server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId!)
                .collection('classes')
                .doc(classID)
                .collection('RegTemp_Students')
                .doc(list[i].docid)
                .delete()
                .then((value) {
              showToast(msg: "${list[i].studentName} Student Account Added");
            });
          });
        }
        showToast(msg: "Task Completed");
        buttonstate.value = ButtonState.success;
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  Future<void> removeRegiStudent(BuildContext context, String classID, String studentDocID) async {
    customShowDilogBox2(
        context: context,
        title: "Alert",
        children: [
          const TextFontWidget(text: "Do you want remove this student now?", fontsize: 12)
        ],
        actiononTapfuction: () async {
          await server
              .collection('SchoolListCollection')
              .doc(UserCredentialsController.schoolId)
              .collection(UserCredentialsController.batchId!)
              .doc(UserCredentialsController.batchId!)
              .collection('classes')
              .doc(classID)
              .collection('RegTemp_Students')
              .doc(studentDocID)
              .delete()
              .then((value) => Navigator.pop(context));
        },
        doyouwantActionButton: true);
  }

  final TextEditingController stNameController = TextEditingController();
  final TextEditingController stEmailController = TextEditingController();
  final TextEditingController stPhoneController = TextEditingController();

  Future<void> classWiseStudentCreation() async {
    buttonstate.value = ButtonState.loading;
    try {
      final uid = uuid.v1();
      final studentDetail = StudentModel(
          admissionNumber: '',
          alPhoneNumber: '',
          bloodgroup: '',
          classId: classDocID.value,
          createDate: '',
          dateofBirth: '',
          district: '',
          docid: uid,
          gender: '',
          guardianId: '',
          houseName: '',
          parentId: '',
          parentPhoneNumber: stPhoneController.text.trim(),
          place: '',
          profileImageId: '',
          profileImageUrl: '',
          studentName: stNameController.text.trim(),
          password: '123456',
          studentemail: stEmailController.text.trim(),
          userRole: 'student');
      await server
          .collection('SchoolListCollection')
          .doc(schoolListValue?['docid'])
          .collection(batchYear.value)
          .doc(batchYear.value)
          .collection('classes')
          .doc(classDocID.value)
          .collection('RegTemp_Students')
          .doc(uid)
          .set(studentDetail.toMap())
          .then((value) async {
        await notificationCounter();
        stNameController.clear();
        stPhoneController.clear();
        stEmailController.clear();
        buttonstate.value = ButtonState.success;
        showToast(msg: "Account requested to Tuition Center");
        await Future.delayed(const Duration(seconds: 2)).then((vazlue) {
          buttonstate.value = ButtonState.idle;
        });
      });
    } catch (e) {
      buttonstate.value = ButtonState.fail;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        buttonstate.value = ButtonState.idle;
      });
      log("Error .... $e");
    }
  }

  Future<void> notificationCounter() async {
    await server
        .collection('SchoolListCollection')
        .doc(schoolListValue?['docid'])
        .collection(batchYear.value)
        .doc(batchYear.value)
        .collection('RegStudentsNotifierCounter')
        .doc('count')
        .get()
        .then((value) async {
      if (value.data() == null) {
        await server
            .collection('SchoolListCollection')
            .doc(schoolListValue?['docid'])
            .collection(batchYear.value)
            .doc(batchYear.value)
            .collection('RegStudentsNotifierCounter')
            .doc('count')
            .set(
          {'counter': 1},
        );
      } else {
        notifierCounter = value.data()!['counter'] + 1;
        await server
            .collection('SchoolListCollection')
            .doc(schoolListValue?['docid'])
            .collection(batchYear.value)
            .doc(batchYear.value)
            .collection('RegStudentsNotifierCounter')
            .doc('count')
            .update({'counter': notifierCounter});
      }
    });
  }

  List<RegistrationStudentCountModel> allClasswiseRegStudents = [];
  RxString classRegClassID = 'dds'.obs;
  RxString classRegClassName = ''.obs;
  RxInt classRegClassCount = 0.obs;
  Future<List<RegistrationStudentCountModel>> fetchClassStudent() async {
    await server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes')
        .get()
        .then((value) async {
      for (var i = 0; i < value.docs.length; i++) {
        final regiStudent = await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(value.docs[i].data()['docid'])
            .collection('RegTemp_Students')
            .get();
        final RegistrationStudentCountModel detail = RegistrationStudentCountModel(
            className: value.docs[i].data()['className'],
            classID: value.docs[i].data()['docid'],
            studentCount: regiStudent.docs.length);
        allClasswiseRegStudents.add(detail);
      }
    });

    return allClasswiseRegStudents;
  }
}
