import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/pin_model.dart';
import 'i_repository.dart';

class CreatePinRepository implements PinRepositoryI {
  final FirebaseFirestore firestore;

  CreatePinRepository({required this.firestore});

  @override
  Future<void> addCompanyPin(CompanyPinModel companyPin) async {
    try {
      await firestore.collection('company_pins').add(companyPin.toJson());
    } catch (e) {
      throw Exception('Error adding company pin: $e');
    }
  }

  @override
  Future<void> addUserPin(UserPinModel userPin) async {
    try {
      await firestore.collection('user_pins').add(userPin.toJson());
    } catch (e) {
      throw Exception('Error adding user pin: $e');
    }
  }

  @override
  Stream<List<CompanyPinModel>> getCompanyPins() {
    return firestore.collection('company_pins').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CompanyPinModel.fromJson(doc.data())).toList();
    });
  }

  @override
  Stream<List<UserPinModel>> getUserPins() {
    return firestore.collection('user_pins').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserPinModel.fromJson(doc.data())).toList();
    });
  }

  Future<List<CompanyPinModel>> fetchCompanyPins() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('company_pins').get();
      return snapshot.docs.map((doc) => CompanyPinModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Error fetching company pins: $e');
    }
  }

  Future<List<UserPinModel>> fetchUserPins() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('user_pins').get();
      return snapshot.docs.map((doc) => UserPinModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Error fetching user pins: $e');
    }
  }
}
