part of 'company_cubit.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class CompanyLoading extends CompanyState {}

final class EditBasicInfoSuccess extends CompanyState {}

final class GetBasicInfoSuccess extends CompanyState {}

final class EditSocialLinksSuccess extends CompanyState {}

final class GetSocialLinksSuccess extends CompanyState {}

final class AddJobSuccess extends CompanyState {}

final class GetAllJobsSuccess extends CompanyState {}

final class CompanyError extends CompanyState {
  final String? message;

  CompanyError({this.message});
}
