import 'package:flutter/material.dart';
import 'package:my_project/app/features/product/presentation/providers/products_provider.dart';
import 'package:my_project/app/features/product/presentation/providers/textfield_provider.dart';
import 'package:my_project/app/utils/custom_loading.dart';
import 'package:provider/provider.dart';

class MySaveFAB extends StatelessWidget {
  const MySaveFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<TextFieldProvider>();
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const MyCustomLoading(),
        );
        context
            .read<ProductProvider>()
            .insertProduct(
              productName: product.productName.text,
              price: int.parse(product.price.text),
              quantity: int.parse(product.quantity.text),
              description: product.description.text,
            )
            .whenComplete(
          () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
      child: const Icon(
        Icons.save_rounded,
      ),
    );
  }
}
