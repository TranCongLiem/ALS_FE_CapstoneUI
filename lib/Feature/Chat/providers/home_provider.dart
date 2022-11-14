import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/firestore_constants.dart';

class HomeProvider {
  final FirebaseFirestore firebaseFirestore;

  HomeProvider({required this.firebaseFirestore});

  Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getStreamFireStore(
      String pathCollection, int limit, String? textSearch) {
    if (textSearch?.isNotEmpty == true) {
      if (textSearch.toString().contains(RegExp("^[0-9]*\$")) &&
          textSearch.toString().length > 2)
        return firebaseFirestore
            .collection(pathCollection)
            .limit(limit)
            .where(FirestoreConstants.phone, isEqualTo: textSearch)
            .snapshots();
      else {
        return firebaseFirestore
            .collection(pathCollection)
            .limit(limit)
            .where(FirestoreConstants.nickname, isEqualTo: textSearch)
            .snapshots();
      }
    } else {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .snapshots();
    }
  }
}
