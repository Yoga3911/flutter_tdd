import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/providers/textfield_provider.dart';
import '../widgets/my_back_btn.dart';
import '../widgets/my_txt_product.dart';
import '../widgets/my_save_fab.dart';

class ActionProductPage extends StatelessWidget {
  const ActionProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return ChangeNotifierProvider(
      create: (_) => TextFieldProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args["title"]),
          leading: const MyBackBtn(),
        ),
        floatingActionButton: const MySaveFAB(),
        body: const MyTextProduct(),
      ),
    );
  }
}
