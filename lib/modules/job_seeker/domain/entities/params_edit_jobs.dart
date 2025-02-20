class ParamsEditJobs {
  final String? uid;
  final String? currentJob;
  final String? yearsOfExperience;
  final String? desiredJob;
  final String? salaryRangeFrom;
  final String? salaryRangeTo;
  final String? currency;

  ParamsEditJobs({
    this.uid,
    this.currentJob,
    this.yearsOfExperience,
    this.desiredJob,
    this.salaryRangeFrom,
    this.salaryRangeTo,
    this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'currentJob': currentJob,
      'yearsOfExperience': yearsOfExperience,
      'desiredJob': desiredJob,
      'salaryRangeFrom': salaryRangeFrom,
      'salaryRangeTo': salaryRangeTo,
      'currency': currency,
    };
  }
}
