import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/product/presentation/providers/products_provider.dart';
class MyProvider {
  MyProvider._();

  static final List<SingleChildWidget> data = [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ];
}
