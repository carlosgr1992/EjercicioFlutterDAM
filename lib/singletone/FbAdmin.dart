import 'package:cloud_firestore/cloud_firestore.dart';
import '../firestoreObjects/FbPost.dart';

class FbAdmin {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<List<FbPost>> descargarPosts() async {
    CollectionReference<FbPost> reference = db.collection("Posts").withConverter(
      fromFirestore: (snapshot, _) => FbPost.fromFirestore(snapshot, null),
      toFirestore: (post, _) => post.toFirestore(),
    );

    QuerySnapshot<FbPost> querySnapshot = await reference.get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
