import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';

class WEditSkills extends StatefulWidget {
  const WEditSkills({super.key});

  @override
  State<WEditSkills> createState() => _WEditSkillsState();
}

class _WEditSkillsState extends State<WEditSkills> {
  late JobSeekerCubit jobSeekerCubit;

  @override
  void initState() {
    super.initState();
    jobSeekerCubit = Modular.get<JobSeekerCubit>();
    jobSeekerCubit.fEditSkils.init();
  }

  @override
  Widget build(BuildContext context) {
    return jobSeekerCubit.fEditSkils.skillField.buildField(
      context,
      param: ParamsCustomInput(
        values: jobSeekerCubit.skills?.map((e) => e.name ?? '').toList() ?? [],
        listItemWidget: (value) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.orange,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              value,
              style: context.textTheme.white14w600,
            ),
          );
        },
      ),
    );
  }
}
