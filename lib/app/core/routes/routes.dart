import 'routes_import.dart';

class MyRoute {
  MyRoute._();

  static const home = "/home";
  static const insertProduct = "/product/insert";

  static final data = <String, WidgetBuilder>{
    home: (_) => const HomePage(),
    insertProduct: (_) => const InsertProductPage(),
  };
}
