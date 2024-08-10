// compatibility_service.dart
import 'package:flutter_application_1/features/compatibility/repo/compatibility_repo.dart';

class CompatibilityService {
  final CompatibilityRepository _repository = CompatibilityRepository();

  Future<Map<String, String>> getCompatibilityData() {
    return _repository.fetchCompatibilityData();
  }
}