import 'package:flutter/material.dart';
import 'package:free_lunch_app/screens/bottom_nav_bar/gift_free_launch_screen3.dart';
import 'package:free_lunch_app/widget/cancel_button.dart';
import 'package:free_lunch_app/widget/next_button.dart';

import '../../widget/recipient_name.dart';

class GiftFreeLunchScreen2 extends StatefulWidget {
  const GiftFreeLunchScreen2({super.key});
  static const routeName = 'gift-free-lauch-screen2';
  @override
  State<GiftFreeLunchScreen2> createState() => _GiftFreeLunchScreen2State();
}

class _GiftFreeLunchScreen2State extends State<GiftFreeLunchScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XffF5FAFF),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0XffF5FAFF),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              );
            },
          ),
          title: const Text(
            'Gift Free Lunch',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.0,
              letterSpacing: 0.24,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            // Dismiss the keyboard when the user taps on the screen
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Please ensure that you provide accurate information in this form to avoid any hiccups in this process.',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  const RecipientInfoSection(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CancelButton(),
                      const SizedBox(width: 25),
                      NextButton(onTap: () {
                        Navigator.pushNamed(
                          context,
                          GiftFreeLunchScreen3.routeName,
                        );
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
