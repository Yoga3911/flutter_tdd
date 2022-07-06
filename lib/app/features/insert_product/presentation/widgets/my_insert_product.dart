import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/textfield_provider.dart';
import 'my_text_field.dart';

class MyInsertProduct extends StatelessWidget {
  const MyInsertProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextFieldProvider(),
      builder: (ctx, _) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Column(
          children: [
            MyTextField(
              controller: ctx.read<TextFieldProvider>().productName,
              label: "Product Name",
            ),
            MyTextField(
              controller: ctx.read<TextFieldProvider>().price,
              label: "Price",
            ),
            MyTextField(
              controller: ctx.read<TextFieldProvider>().quantity,
              label: "Quantity",
            ),
            MyTextField(
              controller: ctx.read<TextFieldProvider>().description,
              label: "Description",
            ),
          ],
        ),
      ),
    );
  }
}
