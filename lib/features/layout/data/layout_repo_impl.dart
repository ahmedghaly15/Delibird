import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexo_app/features/layout/domain/layout_repo.dart';

class LayoutRepoImpl extends LayoutRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String? uId,
  ) async {
    return await FirebaseFirestore.instance.collection('users').doc(uId).get();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
