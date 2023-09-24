import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/screens/onBoarding.dart';
import 'package:provider/provider.dart';
import 'helpers/locator.dart';
import 'helpers/router.dart';
import 'providers/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const OnboardingContent(),
        onGenerateRoute: RouteHelper().generateRoute,
      ),
    );
  }
}
