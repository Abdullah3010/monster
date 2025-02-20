import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/utils/enums.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/core/widgets/w_shared_app_bar.dart';
import 'package:monster/core/widgets/w_shared_scaffold.dart';
import 'package:monster/modules/company/data/models/m_job_post.dart';
import 'package:monster/modules/company/presentation/cubit/company_cubit.dart';

class SnAddJob extends StatefulWidget {
  const SnAddJob({super.key, this.job});

  final MJobPost? job;

  @override
  State<SnAddJob> createState() => _SnAddJobState();
}

class _SnAddJobState extends State<SnAddJob> {
  final CompanyCubit companyCubit = Modular.get<CompanyCubit>();

  @override
  void initState() {
    super.initState();
    companyCubit.fAddJob.init();
    if (widget.job != null) {
      companyCubit.fillJobData(widget.job);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      resizeToAvoidBottomInset: true,
      appBar: const WSharedAppBar(
        title: 'New Job',
        withBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: companyCubit.fAddJob.formKey,
            child: Column(
              spacing: 32.h,
              children: [
                companyCubit.fAddJob.titleField.buildField(context),
                companyCubit.fAddJob.descriptionField.buildField(context),
                companyCubit.fAddJob.skillsField.buildField(context),
                companyCubit.fAddJob.experienceField.buildField(context),
                companyCubit.fAddJob.qualificationField.buildField(context),
                companyCubit.fAddJob.locationField.buildField(context),
                Row(
                  children: [
                    Expanded(child: companyCubit.fAddJob.fromSalaryField.buildField(context)),
                    48.horizontalSpace,
                    Expanded(child: companyCubit.fAddJob.toSalaryField.buildField(context)),
                  ],
                ),
                companyCubit.fAddJob.jobTypeField.buildField(context),
                companyCubit.fAddJob.applicationDeadlineField.buildField(context),
                130.verticalSpace,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        width: context.width,
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: 16.h,
          bottom: 30.h,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.job?.status == ENJobStatus.Draft)
              WAppButton(
                title: 'Save as Draft',
                width: context.width,
                isFilled: false,
                onTap: () async {
                  if (companyCubit.fAddJob.validate()) {
                    await companyCubit.addNewJobDraft();
                    await companyCubit.getAllJobs();
                    Modular.to.pop();
                  }
                },
              ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: WAppButton(
                    title: 'Save',
                    onTap: () async {
                      if (companyCubit.fAddJob.validate()) {
                        await companyCubit.addNewJob();
                        await companyCubit.getAllJobs();
                        Modular.to.pop();
                      }
                    },
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: WAppButton(
                    title: 'Cancel',
                    isFilled: false,
                    onTap: () {
                      companyCubit.fAddJob.clear();
                      Modular.to.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
