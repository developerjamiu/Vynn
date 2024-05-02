class ContentModel {
  final List<String> twitter;
  final List<String> facebook;
  final List<String> whatsApp;

  ContentModel({
    required this.twitter,
    required this.facebook,
    required this.whatsApp,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      twitter: json['twitter'].cast<String>(),
      facebook: json['facebook'].cast<String>(),
      whatsApp: json['whatsapp'].cast<String>(),
    );
  }
}
