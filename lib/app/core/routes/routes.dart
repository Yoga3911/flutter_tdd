
import 'routes_import.dart';

class MyRoute {
  MyRoute._();

  static const home = "/home";

  static final data = <String, WidgetBuilder>{
    home: (context) => const HomePage()
  };
}
