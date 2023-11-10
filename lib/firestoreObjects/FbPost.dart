
import 'package:cloud_firestore/cloud_firestore.dart';

class FbPost{

  final String title;
  final String body;
  final String urlImg;

  FbPost({
    required this.title,
    required this.body,
    required this.urlImg,
  });

  factory FbPost.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return FbPost(
      title: data?['title'],
      body: data?['body'],
      urlImg: data?['urlImg'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (body != null) "body": body,
      if (urlImg != null) "urlImg": urlImg,
    };
  }

}