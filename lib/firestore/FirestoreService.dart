import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:foodie/Firestore/Utilities.dart';

enum Collections { users }

class FirestoreService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
      Collections colEnum) async {
    final String colName = colEnum.name;
    final col = firestore.collection(colName);
    final QuerySnapshot<Map<String, dynamic>> colQuery = await col.get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> colDocs =
        colQuery.docs;

    return colDocs;
  }
}