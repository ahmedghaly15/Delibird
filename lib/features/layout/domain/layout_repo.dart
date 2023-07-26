import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LayoutRepo {
  Future<void> signOut();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String? uId);
}
