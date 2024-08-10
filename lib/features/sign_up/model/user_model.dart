// lib/features/sign_up/model/user_model.dart
class UserModel {
  String name;
  String location;
  String birthDate;
  String birthTime;
  String email;

  UserModel({
    required this.name,
    required this.location,
    required this.birthDate,
    required this.birthTime,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'birthDate': birthDate,
      'birthTime': birthTime,
      'email': email,
    };
  }
}