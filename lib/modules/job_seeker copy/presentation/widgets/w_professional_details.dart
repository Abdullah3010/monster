import 'package:flutter/material.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_certifications_section.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_cv_section.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_education_section.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_project_section.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_references_section.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_skill_section.dart';

class WProfessionalDetails extends StatelessWidget {
  const WProfessionalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        /// [CV Section]
        WCvSection(),

        /// [Skills]
        WSkillSection(),

        /// [Certifications]
        WCertificationsSection(),

        /// [Education]
        WEducationSection(),

        /// [Projects]
        WProjectSection(),

        /// [References]
        WReferencesSection(),
      ],
    );
  }
}
