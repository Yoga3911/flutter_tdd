import 'package:flutter/material.dart';
import 'package:my_project/app/features/product/presentation/providers/textfield_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/my_back_btn.dart';
import '../widgets/my_insert_product.dart';
import '../widgets/my_save_fab.dart';

class InsertProductPage extends StatelessWidget {
  const InsertProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextFieldProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Product"),
          automaticallyImplyLeading: false,
          leading: const MyBackBtn(),
        ),
        floatingActionButton: const MySaveFAB(),
        body: const MyInsertProduct(),
      ),
    );
  }
}
