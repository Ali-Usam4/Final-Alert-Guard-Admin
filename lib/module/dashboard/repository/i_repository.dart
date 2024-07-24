import '../model/response_model.dart';

abstract class PinRepositoryI {
  Future<void> addCompanyPin(CompanyPinModel companyPin);
  Future<void> addUserPin(UserPinModel userPin);
  Stream<List<CompanyPinModel>> getCompanyPins();
  Stream<List<UserPinModel>> getUserPins();
}
