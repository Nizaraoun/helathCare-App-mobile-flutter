class Document {
  final String? name;
  final int? number;
  final int? id;

  Document({
    required this.name,
    required this.number,
    required this.id,
  });

  factory Document.fromJson(Map<String?, dynamic> json) {
    return Document(
      name: json['description'] ?? '0',
      number: json['number'] ?? '0',
      id: json['id'] ?? '0',
    );
  }
}
