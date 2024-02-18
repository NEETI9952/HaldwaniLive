class EmbeddedModel {
  String featuredmedia;

  EmbeddedModel({required this.featuredmedia});

  factory EmbeddedModel.fromJson(Map<String, dynamic> json) {
    return EmbeddedModel(
      featuredmedia: json['featuredmedia'],
    );
  }
}