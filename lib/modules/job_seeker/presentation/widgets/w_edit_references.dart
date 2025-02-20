import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/forms/f_edit_references.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_remove_icon.dart';

class WEditReferences extends StatefulWidget {
  const WEditReferences({super.key});

  @override
  State<WEditReferences> createState() => _WEditReferencesState();
}

class _WEditReferencesState extends State<WEditReferences> {
  late JobSeekerCubit jobSeekerCubit;

  @override
  void initState() {
    super.initState();
    jobSeekerCubit = Modular.get<JobSeekerCubit>();
    jobSeekerCubit.fillReferencesForms();
    jobSeekerCubit.fEditReference.init();
    jobSeekerCubit.referenceForms.add(jobSeekerCubit.fEditReference);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: jobSeekerCubit.referenceForms.length > 1
            ? MediaQuery.of(context).viewInsets.bottom < 30
                ? 600.h
                : 330.h
            : 250.h,
        minHeight: 10,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 4.h,
        ),
        children: [
          ...jobSeekerCubit.referenceForms.map(
            (reference) {
              return Column(
                spacing: 16.h,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: reference.nameField.buildField(context),
                      ),
                      12.horizontalSpace,
                      InkWell(
                        onTap: () {
                          setState(() {
                            jobSeekerCubit.referenceForms.remove(reference);
                          });
                        },
                        child: const WRemoveIcon(),
                      ),
                    ],
                  ),
                  reference.linkField.buildField(context),
                  28.verticalSpace,
                ],
              );
            },
          ),
          WAppButton(
            title: 'Add New',
            isFilled: false,
            width: context.width,
            onTap: () {
              setState(() {
                jobSeekerCubit.referenceForms.add(FEditReferences()..init());
              });
            },
          ),
        ],
      ),
    );
  }
}
