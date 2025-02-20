import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/services/forms/f_edit_education.dart';
import 'package:monster/core/services/forms/f_edit_job.dart';
import 'package:monster/core/services/forms/f_edit_preferences.dart';
import 'package:monster/core/services/forms/f_edit_project.dart';
import 'package:monster/core/services/forms/f_edit_references.dart';
import 'package:monster/core/services/forms/f_edit_skils.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';
import 'package:monster/modules/job_seeker/data/models/m_education.dart';
import 'package:monster/modules/job_seeker/data/models/m_job.dart';
import 'package:monster/modules/job_seeker/data/models/m_preferences.dart';
import 'package:monster/modules/job_seeker/data/models/m_project.dart';
import 'package:monster/modules/job_seeker/data/models/m_references.dart';
import 'package:monster/modules/job_seeker/data/models/m_skill.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_education.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_jobs.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_preferences.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_project.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_references.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_skills.dart';
import 'package:monster/modules/job_seeker/domain/repos/r_job_seeker.dart';

part 'job_seeker_state.dart';

class JobSeekerCubit extends Cubit<JobSeekerState> {
  JobSeekerCubit(this.repo) : super(JobSeekerInitial());
  final RJobSeeker repo;

  /// [Profile Preferences -> Job]
  FEditJob fEditJob = FEditJob();
  MJob? job;
  Future<void> editJob() async {
    try {
      emit(JobSeekerLoading());

      final result = await repo.editJob(
        ParamsEditJobs(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          currentJob: fEditJob.currentJobField.controller.text,
          yearsOfExperience: fEditJob.yearsOfExperienceField.controller.text,
          desiredJob: fEditJob.desiredJobField.controller.text,
          salaryRangeFrom: fEditJob.salaryRangeFromField.controller.text,
          salaryRangeTo: fEditJob.salaryRangeToField.controller.text,
          currency: fEditJob.currencyField.controller.text,
        ),
      );
      if (result) {
        emit(EditJobSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to edit job'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to edit job'));
    }
  }

  Future<void> getJob() async {
    try {
      emit(JobSeekerLoading());
      job = await repo.getJob();
      if (job != null) {
        emit(GetJobSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to get job'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to get job'));
    }
  }

  void fillEditJobForm() {
    fEditJob.currentJobField.controller.text = job?.currentJob ?? '';
    fEditJob.yearsOfExperienceField.controller.text = job?.yearsOfExperience ?? '';
    fEditJob.desiredJobField.controller.text = job?.desiredJob ?? '';
    fEditJob.salaryRangeFromField.controller.text = job?.salaryRangeFrom ?? '';
    fEditJob.salaryRangeToField.controller.text = job?.salaryRangeTo ?? '';
    fEditJob.currencyField.controller.text = job?.currency ?? '';
  }

  /// [Profile Preferences -> Preferences]
  FEditPreferences fEditPreferences = FEditPreferences();
  MPreferences? preferences;

  Future<void> editPreferences() async {
    try {
      emit(JobSeekerLoading());
      final result = await repo.editPreferences(
        ParamsEditPreferences(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          location: fEditPreferences.preferredLocationsField.controller.text,
          jobType: fEditPreferences.jobTypeField.controller.text,
          remotePreference: fEditPreferences.remotePreferencesField.controller.text,
          industry: fEditPreferences.industryField.controller.text,
        ),
      );
      if (result) {
        emit(EditPreferencesSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to edit preferences'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to edit preferences'));
    }
  }

  Future<void> getPreferences() async {
    try {
      emit(JobSeekerLoading());
      preferences = await repo.getPreferences();
      if (preferences != null) {
        emit(GetPreferencesSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to get preferences'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to get preferences'));
    }
  }

  void fillEditPreferencesForm() {
    fEditPreferences.preferredLocationsField.controller.text = preferences?.location ?? '';
    fEditPreferences.jobTypeField.controller.text = preferences?.jobType ?? '';
    fEditPreferences.remotePreferencesField.controller.text = preferences?.remotePreference ?? '';
    fEditPreferences.industryField.controller.text = preferences?.industry ?? '';
  }

  /// [Profissional Details -> Skills]
  FEditSkils fEditSkils = FEditSkils();
  List<MSkill>? skills;

  Future<void> editSkills() async {
    try {
      emit(JobSeekerLoading());
      final result = await repo.editSkills(
        ParamsEditSkills(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          skills: fEditSkils.skillField.values.map((e) => MSkill(name: e)).toList(),
        ),
      );
      if (result) {
        emit(EditSkillsSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to edit skills'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to edit skills'));
    }
  }

  Future<void> getSkills() async {
    try {
      emit(JobSeekerLoading());
      skills = await repo.getSkills();
      if (skills != null) {
        emit(GetSkillsSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to get skills'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to get skills'));
    }
  }

  /// [Profissional Details -> Education]
  FEditEducation fEditEducation = FEditEducation();
  List<FEditEducation> educationsForms = [];
  List<MEducation>? education;

  Future<void> editEducation() async {
    try {
      emit(JobSeekerLoading());
      final result = await repo.editEducation(
        ParamsEditEducation(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          educations: educationsForms
              .map(
                (e) => MEducation(
                  name: e.nameField.controller.text,
                  from: e.yearFromField.controller.text,
                  to: e.yearToField.controller.text,
                ),
              )
              .toList(),
        ),
      );
      if (result) {
        emit(EditEducationSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to edit education'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to edit education'));
    }
  }

  Future<void> getEducation() async {
    try {
      emit(JobSeekerLoading());

      education = await repo.getEducation();
      if (education != null) {
        emit(GetEducationSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to get education'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to get education'));
    }
  }

  void fillEducationForms() {
    educationsForms.clear();
    for (var element in education ?? []) {
      educationsForms.add(
        FEditEducation()
          ..init()
          ..nameField.controller.text = element.name ?? ''
          ..yearFromField.controller.text = element.from ?? ''
          ..yearToField.controller.text = element.to ?? '',
      );
    }
  }

  /// [Profissional Details -> Projects]
  FEditProject fEditProject = FEditProject();
  List<FEditProject> projectForms = [];
  List<MProject>? projects;

  Future<void> editProject() async {
    try {
      emit(JobSeekerLoading());
      final result = await repo.editProject(
        ParamsEditProject(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          projects: projectForms
              .map(
                (e) => MProject(
                  name: e.nameField.controller.text,
                  from: e.yearFromField.controller.text,
                  to: e.yearToField.controller.text,
                  link: e.linkField.controller.text,
                ),
              )
              .toList(),
        ),
      );
      if (result) {
        emit(EditProjectSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to edit project'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to edit project'));
    }
  }

  Future<void> getProject() async {
    try {
      emit(JobSeekerLoading());
      projects = await repo.getProject();
      if (projects != null) {
        emit(GetProjectSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to get project'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to get project'));
    }
  }

  void fillProjectsForms() {
    projectForms.clear();
    for (var element in projects ?? []) {
      projectForms.add(
        FEditProject()
          ..init()
          ..nameField.controller.text = element.name ?? ''
          ..yearFromField.controller.text = element.from ?? ''
          ..yearToField.controller.text = element.to ?? ''
          ..linkField.controller.text = element.link ?? '',
      );
    }
  }

  /// [Profissional Details -> References]
  FEditReferences fEditReference = FEditReferences();
  List<FEditReferences> referenceForms = [];
  List<MReferences>? references;

  Future<void> editReferences() async {
    try {
      emit(JobSeekerLoading());
      final result = await repo.editReferences(
        ParamsEditReferences(
          uid: Modular.get<RAuth>().getActiveUser()?.uid,
          references: referenceForms
              .map(
                (e) => MReferences(
                  name: e.nameField.controller.text,
                  link: e.linkField.controller.text,
                ),
              )
              .toList(),
        ),
      );
      if (result) {
        emit(EditReferencesSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to edit references'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to edit references'));
    }
  }

  Future<void> getReferences() async {
    try {
      emit(JobSeekerLoading());
      references = await repo.getReferences();
      if (references != null) {
        emit(GetReferencesSuccess());
      } else {
        emit(JobSeekerError(message: 'Failed to get references'));
      }
    } catch (e) {
      emit(JobSeekerError(message: 'Failed to get references'));
    }
  }

  void fillReferencesForms() {
    referenceForms.clear();
    for (var element in references ?? []) {
      referenceForms.add(
        FEditReferences()
          ..init()
          ..nameField.controller.text = element.name ?? ''
          ..linkField.controller.text = element.link ?? '',
      );
    }
  }
}
