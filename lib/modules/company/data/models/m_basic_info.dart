class MBasicInfo {
  final String? name;
  final String? description;
  final List<String>? industry;
  final String? location;
  final String? sizeFrom;
  final String? sizeTo;

  MBasicInfo({
    this.name,
    this.description,
    this.industry,
    this.location,
    this.sizeFrom,
    this.sizeTo,
  });

  factory MBasicInfo.fromJson(Map<String, dynamic>? json) {
    return MBasicInfo(
      name: json?['name'],
      description: json?['description'],
      industry: List<String>.from(json?['industry'] ?? []),
      location: json?['location'],
      sizeFrom: json?['sizeFrom'],
      sizeTo: json?['sizeTo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'industry': industry,
      'location': location,
      'sizeFrom': sizeFrom,
      'sizeTo': sizeTo,
    };
  }

  String? get size {
    if (sizeFrom == null && sizeTo == null) {
      return null;
    } else if (sizeFrom == null) {
      return 'Up to $sizeTo';
    } else if (sizeTo == null) {
      return 'From $sizeFrom';
    } else {
      return '$sizeFrom - $sizeTo';
    }
  }
}
