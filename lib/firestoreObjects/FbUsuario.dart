
import 'package:cloud_firestore/cloud_firestore.dart';

class FbUsuario{

  final String name;
  final int age;
  final String eyeColor;

  FbUsuario({
    required this.name,
    required this.age,
    required this.eyeColor
});

  factory FbUsuario.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data();
    return FbUsuario(
      name: data?['name'] ?? "",
      age: (data?['age'] ?? 0) is int ? data!['age'] as int : 0,
      eyeColor: data?['eyeColor'] ?? "",
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (age != null) "age": age,
      if (eyeColor != null) "eyeColor": eyeColor,
    };
  }

}