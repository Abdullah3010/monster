class ParamsEditPreferences {
  final String? uid;
  final String? location;
  final String? jobType;
  final String? remotePreference;
  final String? industry;

  ParamsEditPreferences({
    this.uid,
    this.location,
    this.jobType,
    this.remotePreference,
    this.industry,
  });

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'jobType': jobType,
      'remotePreference': remotePreference,
      'industry': industry,
    };
  }
}
