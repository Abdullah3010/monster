import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/services/forms/f_add_job.dart';
import 'package:monster/core/services/forms/f_edit_basic_info.dart';
import 'package:monster/core/services/forms/f_edit_social_links.dart';
import 'package:monster/core/utils/enums.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';
import 'package:monster/modules/company/data/models/m_basic_info.dart';
import 'package:monster/modules/company/data/models/m_job_post.dart';
import 'package:monster/modules/company/data/models/m_social_links.dart';
import 'package:monster/modules/company/domain/entities/params_add_jop.dart';
import 'package:monster/modules/company/domain/entities/params_edit_basic_info.dart';
import 'package:monster/modules/company/domain/entities/params_edit_social_links.dart';
import 'package:monster/modules/company/domain/repos/r_company.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.repo) : super(CompanyInitial());

  final RCompany repo;

  /// [Profile -> Basic Info]
  FEditBasicInfo fEditBasicInfo = FEditBasicInfo();
  MBasicInfo? basicInfo;
  Future<void> editBasicInfo() async {
    try {
      emit(CompanyLoading());

      final result = await repo.editBasicInfo(
        ParamsEditBasicInfo(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          name: fEditBasicInfo.nameField.controller.text,
          description: fEditBasicInfo.descriptionField.controller.text,
          industry: fEditBasicInfo.industryField.values,
          location: fEditBasicInfo.locationField.controller.text,
          sizeFrom: fEditBasicInfo.sizeFromField.controller.text,
          sizeTo: fEditBasicInfo.sizeToField.controller.text,
        ),
      );
      if (result) {
        emit(EditBasicInfoSuccess());
      } else {
        emit(CompanyError(message: 'Failed to edit basicInfo'));
      }
    } catch (e) {
      emit(CompanyError(message: 'Failed to edit basicInfo'));
    }
  }

  Future<void> getBasicInfo() async {
    try {
      emit(CompanyLoading());
      basicInfo = await repo.getBasicInfo();
      if (basicInfo != null) {
        emit(GetBasicInfoSuccess());
      } else {
        emit(CompanyError(message: 'Failed to get basicInfo'));
      }
    } catch (e) {
      emit(CompanyError(message: 'Failed to get basicInfo'));
    }
  }

  void fillEditBasicInfo() {
    fEditBasicInfo.nameField.controller.text = basicInfo?.name ?? '';
    fEditBasicInfo.descriptionField.controller.text = basicInfo?.description ?? '';

    fEditBasicInfo.locationField.controller.text = basicInfo?.location ?? '';
    fEditBasicInfo.sizeFromField.controller.text = basicInfo?.sizeFrom ?? '';
    fEditBasicInfo.sizeToField.controller.text = basicInfo?.sizeTo ?? '';
  }

  /// [Profile -> Socila Links]
  FEditSocialLinks fEditSocialLinks = FEditSocialLinks();
  List<FEditSocialLinks> socialLinkForms = [];
  List<MSocialLinks>? socialLinks;

  Future<void> editSocialLinks() async {
    try {
      emit(CompanyLoading());
      final result = await repo.editSocialLinks(
        ParamsEditSocialLinks(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          socialLinks: socialLinkForms
              .map(
                (e) => MSocialLinks(
                  name: e.nameField.controller.text,
                  link: e.linkField.controller.text,
                ),
              )
              .toList(),
        ),
      );
      if (result) {
        emit(EditSocialLinksSuccess());
      } else {
        emit(CompanyError(message: 'Failed to edit socialLinks'));
      }
    } catch (e) {
      emit(CompanyError(message: 'Failed to edit socialLinks'));
    }
  }

  Future<void> getSocialLinks() async {
    try {
      emit(CompanyLoading());
      socialLinks = await repo.getSocialLinks();
      if (socialLinks != null) {
        emit(GetSocialLinksSuccess());
      } else {
        emit(CompanyError(message: 'Failed to get socialLinks'));
      }
    } catch (e) {
      emit(CompanyError(message: 'Failed to get socialLinks'));
    }
  }

  void fillReferencesForms() {
    socialLinkForms.clear();
    for (var element in socialLinks ?? []) {
      socialLinkForms.add(
        FEditSocialLinks()
          ..init()
          ..nameField.controller.text = element.name ?? ''
          ..linkField.controller.text = element.link ?? '',
      );
    }
  }

  ///[Jobs -> Add Job]
  FAddJob fAddJob = FAddJob();
  List<MJobPost>? jobPosts;

  Future<void> addNewJobDraft() async {
    try {
      emit(CompanyLoading());
      final result = await repo.addNewJob(
        ParamsAddJop(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          title: fAddJob.titleField.controller.text,
          description: fAddJob.descriptionField.controller.text,
          skills: fAddJob.skillsField.values,
          experience: fAddJob.experienceField.controller.text,
          qualification: fAddJob.qualificationField.controller.text,
          location: fAddJob.locationField.controller.text,
          fromSalary: fAddJob.fromSalaryField.controller.text,
          toSalary: fAddJob.toSalaryField.controller.text,
          jobType: fAddJob.jobTypeField.values,
          applicationDeadline: fAddJob.applicationDeadlineField.controller.text,
          status: ENJobStatus.Draft,
        ),
      );
      if (result) {
        emit(AddJobSuccess());
      } else {
        emit(CompanyError(message: 'Failed to add new job'));
      }
    } catch (e) {
      emit(CompanyError(message: 'Failed to add new job'));
    }
  }

  Future<void> addNewJob() async {
    try {
      emit(CompanyLoading());
      final result = await repo.addNewJob(
        ParamsAddJop(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          title: fAddJob.titleField.controller.text,
          description: fAddJob.descriptionField.controller.text,
          skills: fAddJob.skillsField.values,
          experience: fAddJob.experienceField.controller.text,
          qualification: fAddJob.qualificationField.controller.text,
          location: fAddJob.locationField.controller.text,
          fromSalary: fAddJob.fromSalaryField.controller.text,
          toSalary: fAddJob.toSalaryField.controller.text,
          jobType: fAddJob.jobTypeField.values,
          applicationDeadline: fAddJob.applicationDeadlineField.controller.text,
          status: ENJobStatus.Open,
        ),
      );
      if (result) {
        emit(AddJobSuccess());
      } else {
        emit(CompanyError(message: 'Failed to add new job'));
      }
    } catch (e) {
      emit(CompanyError(message: 'Failed to add new job'));
    }
  }

  Future<void> getAllJobs() async {
    try {
      emit(CompanyLoading());
      jobPosts = await repo.getAllJobs();
      if (jobPosts?.isNotEmpty ?? false) {
        emit(GetAllJobsSuccess());
      } else {
        emit(CompanyError(message: 'Failed to get all jobs'));
      }
    } catch (e) {
      emit(CompanyError(message: 'Failed to get all jobs'));
    }
  }

  void fillJobData(MJobPost? mJobPost) {
    fAddJob.titleField.controller.text = mJobPost?.title ?? '';
    fAddJob.descriptionField.controller.text = mJobPost?.description ?? '';
    fAddJob.skillsField.values.addAll(mJobPost?.skills ?? []);
    fAddJob.experienceField.controller.text = mJobPost?.experience ?? '';
    fAddJob.qualificationField.controller.text = mJobPost?.qualification ?? '';
    fAddJob.locationField.controller.text = mJobPost?.location ?? '';
    fAddJob.fromSalaryField.controller.text = mJobPost?.fromSalary ?? '';
    fAddJob.toSalaryField.controller.text = mJobPost?.toSalary ?? '';
    fAddJob.jobTypeField.values.addAll(mJobPost?.jobType ?? []);
    fAddJob.applicationDeadlineField.controller.text = mJobPost?.applicationDeadline ?? '';
  }
}
