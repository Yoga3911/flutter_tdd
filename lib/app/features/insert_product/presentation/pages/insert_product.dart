import 'package:flutter/material.dart';
import 'package:my_project/app/features/insert_product/presentation/providers/textfield_provider.dart';
import 'package:my_project/app/features/insert_product/presentation/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class InsertProductPage extends StatelessWidget {
  const InsertProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: ChangeNotifierProvider(
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
      ),
    );
  }
}
