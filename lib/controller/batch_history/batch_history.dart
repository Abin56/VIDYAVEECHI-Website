import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/model/batch_history_model/batch_history_model.dart';

class BatchHistoryController extends GetxController {
  CollectionReference collection =
      FirebaseFirestore.instance.collection("SchoolListCollection");

  Stream<List<BatchHistoryModel>> batchHistoryStream() {
    return collection.snapshots().asyncMap((querySnapshot) async {
      if (querySnapshot.docs.isNotEmpty) {
        // Get the reference to the document
        DocumentReference schoolDocument = querySnapshot.docs.first.reference;

        // Reference to the subcollections
        CollectionReference subcollectionReference =
            schoolDocument.collection("batchYear");
        QuerySnapshot subcollectionQuery = await subcollectionReference.get();
        List<BatchHistoryModel> batchHistory = subcollectionQuery.docs
            .map((document) => BatchHistoryModel.fromJson(
                document.data() as Map<String, dynamic>))
            .toList();
        return batchHistory;
      } else {
        print('Document not found.');
        return [];
      }
    });
  }
}
