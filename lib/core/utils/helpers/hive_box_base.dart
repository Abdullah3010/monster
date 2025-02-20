import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:developer' as developer;

abstract class HiveBoxBase<T> {
  HiveBoxBase(this.boxName, [this.adapter]);

  final String boxName;
  final TypeAdapter<T>? adapter;

  Future<bool> init() async {
    try {
      if (adapter != null && !Hive.isAdapterRegistered(adapter!.typeId)) {
        Hive.registerAdapter(adapter!);
      }
      await Hive.openBox<T>(boxName);
    } catch (e) {
      try {
        await Hive.deleteBoxFromDisk(boxName);
      } catch (deleteError) {
        developer.log('Error deleting box $boxName: $deleteError');
      }

      try {
        await Hive.openBox<T>(boxName);
      } catch (openBoxError2) {
        developer.log('Error opening box $boxName: $openBoxError2');

        return false;
      }
    }

    developer.log('HiveBoxBase: $boxName initialized - count: ${Hive.box<T>(boxName).length}');
    return true;
  }

  String get getBoxName => boxName;

  Box<T> get box => Hive.box<T>(boxName);

  // get listenable()
  ValueListenable<Box<T>> get listenable => Hive.box<T>(boxName).listenable();
}
