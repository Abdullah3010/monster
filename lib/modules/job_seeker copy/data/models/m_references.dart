class MReferences {
  final String? name;
  final String? link;

  MReferences({
    this.name,
    this.link,
  });

  factory MReferences.fromJson(Map<String, dynamic>? json) {
    return MReferences(
      name: json?['name'],
      link: json?['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'link': link,
    };
  }

  bool get isValid {
    return name?.isNotEmpty == true && link?.isNotEmpty == true;
  }
}
