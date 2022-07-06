import 'package:flutter/material.dart';
import 'package:my_project/app/core/constants/color.dart';
import 'package:my_project/app/core/providers/init.dart';
import 'package:provider/provider.dart';

import 'app/core/routes/routes.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MyProvider.data,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyColor.theme,
        routes: MyRoute.data,
        initialRoute: MyRoute.home,
      ),
    );
  }
}
