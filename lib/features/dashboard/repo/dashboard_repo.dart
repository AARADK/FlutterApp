class DashboardRepository {
  Future<List<String>> fetchOfferImages() async {
    // Simulate a network call or local data fetching
    return Future.delayed(
      Duration(seconds: 1),
      () => [
        'assets/images/christmas.jpg',
        'assets/images/newyear.jpg',
        'assets/images/marriage.jpg',
        'assets/images/11142.jpg',
        'assets/images/planets.jpg',
      ],
    );
  }
}