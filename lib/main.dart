import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/screens/auth/signUp.dart';

import 'helpers/locator.dart';
import 'helpers/router.dart';
import 'ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: SignUp(),
      onGenerateRoute: RouteHelper().generateRoute,
    );
  }
}
