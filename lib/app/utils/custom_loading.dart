import 'package:flutter/material.dart';
import 'package:my_project/app/core/constants/color.dart';

class MyCustomLoading extends StatelessWidget {
  const MyCustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(
                color: MyColor.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
