import 'package:flutter/material.dart';

import '../widgets/my_insert_fab.dart';
import '../widgets/my_refresh_btn.dart';
import '../widgets/my_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TDD"),
        actions: const [
          MyRefreshBtn(),
        ],
      ),
      floatingActionButton: const MyInsertFAB(),
      body: const MyListView(),
    );
  }
}
