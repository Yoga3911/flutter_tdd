import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/textfield_provider.dart';
import 'my_text_field.dart';

class MyInsertProduct extends StatelessWidget {
  const MyInsertProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TextFieldProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Column(
        children: [
          MyTextField(
            controller: controller.productName,
            label: "Product Name",
          ),
          MyTextField(
            controller: controller.price,
            label: "Price",
          ),
          MyTextField(
            controller: controller.quantity,
            label: "Quantity",
          ),
          MyTextField(
            controller: controller.description,
            label: "Description",
          ),
        ],
      ),
    );
  }
}
