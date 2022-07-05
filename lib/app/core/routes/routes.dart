
import 'routes_import.dart';

class MyRouteInit {
  MyRouteInit._();

  static final data = <String, WidgetBuilder>{
    MyRoute.home: (context) => const HomePage()
  };
}
