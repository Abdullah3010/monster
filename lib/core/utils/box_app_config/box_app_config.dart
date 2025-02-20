import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:monster/core/utils/helpers/helper_hive.dart';

class BoxAppConfig {
  static late Box<String> _box;

  static const String _boxName = 'app_config';

  /// [box] is the box for the app ids.
  static Box<String> get box => _box;

  /// [init] initializes the box for the app ids.
  static Future<void> init() async {
    _box = await HelperHive.tryInitBox<String>(_boxName);
    debugPrint('Hive.Box.open: $_boxName -- Length: ${_box.length}');
  }
}
