import 'package:monster/core/constants/constants.dart';
import 'package:monster/modules/company/data/models/m_social_links.dart';

class ParamsEditSocialLinks {
  final String? uid;
  final List<MSocialLinks>? socialLinks;

  ParamsEditSocialLinks({
    this.uid,
    this.socialLinks,
  });

  Map<String, dynamic> toJson() {
    socialLinks?.removeWhere((element) => element.isValid == false);

    return {
      Constants.collections.socialLinks: socialLinks?.map((e) => e.toJson()).toList(),
    };
  }
}
