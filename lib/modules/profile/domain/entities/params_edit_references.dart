import 'package:monster/core/constants/constants.dart';
import 'package:monster/modules/job_seeker/data/models/m_references.dart';

class ParamsEditReferences {
  final String? uid;
  final List<MReferences>? references;

  ParamsEditReferences({
    this.uid,
    this.references,
  });

  Map<String, dynamic> toJson() {
    references?.removeWhere((element) => element.isValid == false);

    return {
      Constants.collections.references: references?.map((e) => e.toJson()).toList(),
    };
  }
}
