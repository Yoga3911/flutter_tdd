import 'app/routes/routes.dart';
import 'app/routes/routes_import.dart';

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
