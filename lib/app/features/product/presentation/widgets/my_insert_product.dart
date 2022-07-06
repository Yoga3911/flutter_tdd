import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/textfield_provider.dart';
import 'my_text_field.dart';

class MyInsertProduct extends StatelessWidget {
  const MyInsertProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Column(
        children: [
          MyTextField(
            controller: context.read<TextFieldProvider>().productName,
            label: "Product Name",
          ),
          MyTextField(
            controller: context.read<TextFieldProvider>().price,
            label: "Price",
          ),
          MyTextField(
            controller: context.read<TextFieldProvider>().quantity,
            label: "Quantity",
          ),
          MyTextField(
            controller: context.read<TextFieldProvider>().description,
            label: "Description",
          ),
        ],
      ),
    );
  }
}
