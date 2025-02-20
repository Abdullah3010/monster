part of 'job_seeker_cubit.dart';

@immutable
sealed class JobSeekerState {}

final class JobSeekerInitial extends JobSeekerState {}

final class JobSeekerLoading extends JobSeekerState {}

final class EditJobSuccess extends JobSeekerState {}

final class GetJobSuccess extends JobSeekerState {}

final class EditPreferencesSuccess extends JobSeekerState {}

final class GetPreferencesSuccess extends JobSeekerState {}

final class EditSkillsSuccess extends JobSeekerState {}

final class GetSkillsSuccess extends JobSeekerState {}

final class EditEducationSuccess extends JobSeekerState {}

final class GetEducationSuccess extends JobSeekerState {}

final class EditProjectSuccess extends JobSeekerState {}

final class GetProjectSuccess extends JobSeekerState {}

final class EditReferencesSuccess extends JobSeekerState {}

final class GetReferencesSuccess extends JobSeekerState {}

final class JobSeekerError extends JobSeekerState {
  final String? message;

  JobSeekerError({this.message});
}
