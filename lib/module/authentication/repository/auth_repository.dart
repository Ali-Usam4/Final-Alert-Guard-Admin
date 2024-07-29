import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_alert_guard_admin/module/authentication/models/login_input.dart';
import 'package:final_alert_guard_admin/module/authentication/repository/session_repository.dart';
import 'package:final_alert_guard_admin/module/user/models/user_model.dart';

import '../../user/repository/user_account_repository.dart';

class AuthRepository {
  final FirebaseFirestore firestore;
  final UserAccountRepository _userAccountRepository;
  final SessionRepository _sessionRepository;

  AuthRepository({
    required this.firestore,
    required UserAccountRepository userAccountRepository,
    required SessionRepository sessionRepository,
  })  : _sessionRepository = sessionRepository,
        _userAccountRepository = userAccountRepository;

  final String adminDocId = "AP9fBvgSWPCkVKLPfEwe";

  Future<UserModel?> login(LoginInput loginInput) async {
    try {
      QuerySnapshot snapshot =
          await firestore.collection('Admin').where('email', isEqualTo: loginInput.email).where('password', isEqualTo: loginInput.password).get();

      if (snapshot.docs.isNotEmpty) {
        UserModel userModel = UserModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
        await _userAccountRepository.saveUserInDb(userModel);
        await _sessionRepository.setLoggedIn(true);
        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }

  Future<void> updateEditMode(bool isEditMode) async {
    try {
      await firestore.collection('Admin').doc(adminDocId).update({'editMode': isEditMode});
    } catch (e) {
      throw Exception('Error updating edit mode: $e');
    }
  }

  Future<void> updateUser() async {
    try {
      DocumentSnapshot snapshot = await firestore.collection('Admin').doc(adminDocId).get();
      if (snapshot.exists) {
        UserModel userModel = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        await _userAccountRepository.saveUserInDb(userModel);
        await _sessionRepository.setLoggedIn(true);
      }
    } catch (e) {
      throw Exception('Error fetching admin: $e');
    }
  }
}
