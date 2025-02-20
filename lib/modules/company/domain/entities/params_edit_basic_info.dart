class ParamsEditBasicInfo {
  final String? uid;
  final String? name;
  final String? description;
  final List<String>? industry;
  final String? location;
  final String? sizeFrom;
  final String? sizeTo;

  ParamsEditBasicInfo({
    this.uid,
    this.name,
    this.description,
    this.industry,
    this.location,
    this.sizeFrom,
    this.sizeTo,
  });

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
}
