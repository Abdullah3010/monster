import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:monster/app_bloc_observer.dart';
import 'package:monster/core/services/notification/notification_service.dart';
import 'package:monster/core/utils/box_app_config/box_app_config.dart';
import 'package:monster/core/utils/enums.dart';
import 'package:monster/firebase_options.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/core/presentation/screens/app_entry_point.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = AppBlocObserver();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await NotificationService.initialize();
      await LocalizeAndTranslate.init(
        assetLoader: const AssetLoaderRootBundleJson('assets/lang/'),
        defaultType: LocalizationDefaultType.asDefined,
        supportedLanguageCodes: ['en', 'ar', 'de'],
      );

      await Hive.initFlutter();

      Hive
        ..registerAdapter(MUserAdapter())
        ..registerAdapter(ENUserTypeAdapter());

      await BoxAppConfig.init();
      runApp(const AppEntryPoint());
    },
    (error, stackTrace) {},
  );
}
