import 'package:flutter/material.dart';

import 'my_list_tile.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, index) {
        return const MyListTile();
      },
    );
  }
}
