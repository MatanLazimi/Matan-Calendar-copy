// Define route name by using the screen class name.

enum RoutesNames {
  // splash
  SplashScreen,
  // home
  HomeScreen,
  CalendarScreen,
  AddScreen,
}

extension RoutesNamesEx on RoutesNames {
  String get name => this.toString().split('.').last;
}
