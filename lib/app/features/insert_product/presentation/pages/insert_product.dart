import 'package:flutter/material.dart';
import 'package:my_project/app/features/insert_product/presentation/widgets/my_back_btn.dart';
import 'package:my_project/app/features/insert_product/presentation/widgets/my_insert_product.dart';
import 'package:my_project/app/features/insert_product/presentation/widgets/my_save_fab.dart';

class InsertProductPage extends StatelessWidget {
  const InsertProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        automaticallyImplyLeading: false,
        leading: const MyBackBtn(),
      ),
      floatingActionButton: const MySaveFAB(),
      body: const MyInsertProduct(),
    );
  }
}
