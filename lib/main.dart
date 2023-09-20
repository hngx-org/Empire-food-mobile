import 'package:flutter/material.dart';
import 'package:free_lunch_app/helpers/locator.dart';
import 'package:free_lunch_app/helpers/router.dart';

import 'ui/screens/gift_lunch/gift_free_lunch_2.dart';
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
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: Home(),
      onGenerateRoute: RouteHelper().generateRoute,
    );
  }
}
