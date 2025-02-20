class MSocialLinks {
  final String? name;
  final String? link;

  MSocialLinks({
    this.name,
    this.link,
  });

  factory MSocialLinks.fromJson(Map<String, dynamic>? json) {
    return MSocialLinks(
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
