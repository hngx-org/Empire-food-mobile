import 'package:flutter/material.dart';
import 'package:free_lunch_app/screens/home.dart';
import 'package:free_lunch_app/widget/widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/reciepient.info.dart';
import 'gift_free_lunch_3.dart';

class GiftFreeLunchScreen2 extends StatefulWidget {
  @override
  _GiftFreeLunchScreen2State createState() => _GiftFreeLunchScreen2State();
}

class _GiftFreeLunchScreen2State extends State<GiftFreeLunchScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(width: 60),
                Text(
                  'Gift Free Lunch',
                  style: TextStyle(
                    color: Color(0xFF583208),
                    fontSize: 24,
                    fontFamily: 'Tropiline',
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: 0.24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 380,
              child: Text(
                'Please ensure that you provide accurate information in this form to avoid any hiccups in this process.',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            RecipientInfoSection(),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonPop(
                  98,
                  51,
                  Color(0xFFF5FAFF),
                  'Cancel',
                  context,
                ),
                buttonNext(
                  84,
                  51,
                  Color(0xFFEAD9FC),
                  'Next',
                  context,
                  GiftFreeLunchScreen3(),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
