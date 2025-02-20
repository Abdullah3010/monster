class RoutesNames {
  static String get baseUrl => '/';

  static CoreRoutes core = CoreRoutes();
  static AuthRoutes auth = AuthRoutes();
  static HomeRoutes home = HomeRoutes();
}

class CoreRoutes {
  static String get baseUrl => RoutesNames.baseUrl;

  String get splash => baseUrl;
  String get onboarding => '${baseUrl}onboarding';
}

class AuthRoutes {
  static String get baseUrl => RoutesNames.baseUrl;

  String get login => '${baseUrl}login';
  String get register => '${baseUrl}register';
}

class HomeRoutes {
  static String get baseUrl => RoutesNames.baseUrl;

  String get homeMain => '${baseUrl}home';
  String get addJob => '${baseUrl}add-job';
}
