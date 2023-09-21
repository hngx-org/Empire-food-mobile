import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/screens/onBoarding.dart';
import 'helpers/locator.dart';
import 'helpers/router.dart';

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

      home: OnboardingContent(),
      onGenerateRoute: RouteHelper().generateRoute,
    );
  }
}
