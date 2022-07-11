import 'package:my_project/app/features/product/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MyProvider {
  MyProvider._();

  static final List<SingleChildWidget> data = [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ];
}
