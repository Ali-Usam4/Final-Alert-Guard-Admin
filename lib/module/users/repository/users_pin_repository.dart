import 'package:cloud_firestore/cloud_firestore.dart';

import '../../dashboard/model/pin_model.dart';

class UsersPinRepository {
  final FirebaseFirestore firestore;

  UsersPinRepository(this.firestore);

  Stream<List<UserPinModel>> getUsersPins() {
    return firestore.collection('user_pins').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserPinModel.fromJson(doc.data())).toList();
    });
  }
}
