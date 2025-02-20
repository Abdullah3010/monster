class MSkill {
  final String? name;
  final int? rate;

  MSkill({
    this.name,
    this.rate,
  });

  factory MSkill.fromJson(Map<String, dynamic>? json) {
    return MSkill(
      name: json?['name'],
      rate: json?['rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rate': rate,
    };
  }
}
