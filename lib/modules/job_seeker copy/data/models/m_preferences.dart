class MPreferences {
  final String? location;
  final String? jobType;
  final String? remotePreference;
  final String? industry;

  MPreferences({
    this.location,
    this.jobType,
    this.remotePreference,
    this.industry,
  });

  factory MPreferences.fromJson(Map<String, dynamic>? json) {
    return MPreferences(
      location: json?['location'],
      jobType: json?['jobType'],
      remotePreference: json?['remotePreference'],
      industry: json?['industry'],
    );
  }
}
