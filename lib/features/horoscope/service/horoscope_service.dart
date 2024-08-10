import 'package:flutter_application_1/features/horoscope/repo/horoscope_repo.dart';

class HoroscopeService {
  final HoroscopeRepository _repository;

  HoroscopeService(this._repository);

  Future<String> getHoroscope() {
    return _repository.fetchHoroscopeData();
  }
}