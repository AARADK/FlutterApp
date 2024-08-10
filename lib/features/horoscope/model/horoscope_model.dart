class Horoscope {
  final String description;

  Horoscope({required this.description});

  factory Horoscope.fromJson(Map<String, dynamic> json) {
    return Horoscope(
      description: json['description'] as String,
    );
  }
}
