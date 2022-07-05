import 'package:flutter/material.dart';

import 'app/core/routes/routes.dart';
import 'app/core/routes/routes_name.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: MyRouteInit.data,
      initialRoute: MyRoute.home,
    );
  }
}
