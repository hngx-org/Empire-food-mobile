import 'package:flutter/material.dart';
import 'package:free_lunch_app/screens/bottom_nav_bar/gift_free_launch_screen2.dart';
import 'package:free_lunch_app/screens/bottom_nav_bar/gift_free_launch_screen3.dart';

import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const Home(),
      routes: {
        GiftFreeLunchScreen3.routeName:(context) =>const GiftFreeLunchScreen3(),
        GiftFreeLunchScreen2.routeName:(context) => const GiftFreeLunchScreen2()
      },
    );
  }
}
