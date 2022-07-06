import 'package:flutter/material.dart';

class InsertProductPage extends StatelessWidget {
  const InsertProductPage({Key? key}) : super(key: key);

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
      body: const Center(
        child: Text("Insert Page"),
      ),
    );
  }
}
