import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

abstract class LayoutRepo {
  Future<void> signOut();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String? uId);

  Future<Response> getProducts();
}
