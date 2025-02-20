class MProject {
  final String? name;
  final String? from;
  final String? to;
  final String? link;

  MProject({
    this.name,
    this.from,
    this.to,
    this.link,
  });

  factory MProject.fromJson(Map<String, dynamic>? json) {
    return MProject(
      name: json?['name'],
      from: json?['from'],
      to: json?['to'],
      link: json?['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'from': from,
      'to': to,
      'link': link,
    };
  }

  bool get isValid {
    return name?.isNotEmpty == true && from?.isNotEmpty == true && to?.isNotEmpty == true && link?.isNotEmpty == true;
  }
}
