import 'package:flutter/material.dart';
import 'package:monster/core/config/models/m_country_code.dart';
import 'package:monster/core/constants/cst_colections_keys.dart';
import 'package:monster/core/constants/cst_config_keys.dart';

class Constants {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static CSTConfigKeys get configKeys => CSTConfigKeys();
  static CSTColectionsKeys get collections => CSTColectionsKeys();

  static final List<MCountryCode> countries = [
    MCountryCode(code: '+20', name: 'EG'),
    MCountryCode(code: '+971', name: 'AE'),
    MCountryCode(code: '+49', name: 'DE'),
  ];
}
