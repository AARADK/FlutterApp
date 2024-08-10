import 'package:flutter_application_1/features/dashboard/repo/dashboard_repo.dart';

class DashboardService {
  final DashboardRepository _repository = DashboardRepository();

  Future<List<String>> getOfferImages() {
    return _repository.fetchOfferImages();
  }
}