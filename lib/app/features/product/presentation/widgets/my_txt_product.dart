import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/product_entity.dart';
import '../providers/textfield_provider.dart';
import 'my_text_field.dart';

class MyTextProduct extends StatelessWidget {
  const MyTextProduct({super.key});

  void initController(Map<String, dynamic> args, TextFieldProvider controller) {
    if (args["product"] != null) {
      ProductEntity product = args["product"] as ProductEntity;
      controller.productName.text = product.name;
      controller.price.text = product.price.toString();
      controller.quantity.text = product.quantity.toString();
      controller.description.text = product.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TextFieldProvider>();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    initController(args, controller);
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
