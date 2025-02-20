class MEducation {
  final String? name;
  final String? from;
  final String? to;

  MEducation({
    this.name,
    this.from,
    this.to,
  });

  factory MEducation.fromJson(Map<String, dynamic>? json) {
    return MEducation(
      name: json?['name'],
      from: json?['from'],
      to: json?['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'from': from,
      'to': to,
    };
  }

  bool get isValid {
    return name?.isNotEmpty == true && from?.isNotEmpty == true && to?.isNotEmpty == true;
  }
}
