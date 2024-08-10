// lib/features/auspicious_time/services/auspicious_time_service.dart
import 'package:flutter_application_1/features/auspicious_time/model/auspicious_time_model.dart';
import 'package:flutter_application_1/features/auspicious_time/repo/auspicious_time_repo.dart';

class AuspiciousTimeService {
  final AuspiciousTimeRepository repository;

  AuspiciousTimeService(this.repository);

  Future<AuspiciousTime> getAuspiciousTime() {
    return repository.fetchAuspiciousTime();
  }
}