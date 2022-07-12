import 'routes_import.dart';

class MyRoute {
  MyRoute._();

  static const home = "/home";
  static const actionProduct = "/product/action";

  static final data = <String, WidgetBuilder>{
    home: (_) => const HomePage(),
    actionProduct: (_) => const ActionProductPage(),
  };
}
