// lib/features/sign_up/service/sign_up_service.dart
import '../model/user_model.dart';
import '../repo/sign_up_repo.dart';

class SignUpService {
  final SignUpRepo _repo = SignUpRepo();

  Future<void> signUpUser({
    required String name,
    required String location,
    required String birthDate,
    required String birthTime,
    required String email,
  }) async {
    if (_validateEmail(email) && _validateDetails(name, location, birthDate, birthTime)) {
      UserModel user = UserModel(
        name: name,
        location: location,
        birthDate: birthDate,
        birthTime: birthTime,
        email: email,
      );
      await _repo.signUp(user);
    } else {
      // Handle validation error
    }
  }

  bool _validateEmail(String email) {
    return email.contains('@');
  }

  bool _validateDetails(String name, String location, String birthDate, String birthTime) {
    return name.isNotEmpty && location.isNotEmpty && birthDate.isNotEmpty && birthTime.isNotEmpty;
  }
}