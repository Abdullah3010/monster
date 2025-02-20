class MJob {
  final String? currentJob;
  final String? yearsOfExperience;
  final String? desiredJob;
  final String? salaryRangeFrom;
  final String? salaryRangeTo;
  final String? currency;

  MJob({
    this.currentJob,
    this.yearsOfExperience,
    this.desiredJob,
    this.salaryRangeFrom,
    this.salaryRangeTo,
    this.currency,
  });

  factory MJob.fromJson(Map<String, dynamic>? json) {
    return MJob(
      currentJob: json?['currentJob'],
      yearsOfExperience: json?['yearsOfExperience'],
      desiredJob: json?['desiredJob'],
      salaryRangeFrom: json?['salaryRangeFrom'],
      salaryRangeTo: json?['salaryRangeTo'],
      currency: json?['currency'],
    );
  }

  String? get salaryRange {
    if (salaryRangeFrom != null && salaryRangeTo != null) {
      return '$salaryRangeFrom - $salaryRangeTo ($currency)';
    }
    return null;
  }
}
