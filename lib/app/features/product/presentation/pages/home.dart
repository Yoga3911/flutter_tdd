import 'package:flutter/material.dart';
import 'package:my_project/app/features/product/presentation/widgets/my_refresh_btn.dart';

import '../../../../core/constants/color.dart';
import '../widgets/my_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TDD"),
        backgroundColor: MyColor.red,
        actions: const [MyRefreshBtn()],
      ),
      body: const MyListView(),
    );
  }
}
