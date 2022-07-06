import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  late TextEditingController productName;
  late TextEditingController price;
  late TextEditingController quantity;
  late TextEditingController description;

  TextFieldProvider() {
    productName = TextEditingController();
    price = TextEditingController();
    quantity = TextEditingController();
    description = TextEditingController();
  }

  @override
  void dispose() {
    productName.dispose();
    price.dispose();
    quantity.dispose();
    description.dispose();
    super.dispose();
  }
}
