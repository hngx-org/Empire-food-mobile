import 'package:flutter/material.dart';
import 'package:free_lunch_app/screens/reciepient.info.dart';
import 'package:google_fonts/google_fonts.dart';

class GiftFreeLunchScreen extends StatefulWidget {
  @override
  _GiftFreeLunchScreenState createState() => _GiftFreeLunchScreenState();
}

class _GiftFreeLunchScreenState extends State<GiftFreeLunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
          "Gift Free Lunch",
          style: GoogleFonts.nunito(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.brown,
            letterSpacing: 0.01,
            height: 40.0,
          ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 380.0,
          height: 920.0,
          margin: const EdgeInsets.only(top: 8.0, left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please ensure that you provide accurate information in this form to avoid any hiccups in this process.",
                style: GoogleFonts.nunito(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  letterSpacing: 0.01,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              const RecipientInfoSection(),
              const SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Cancel button press
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84.0, 51.0),
                      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.black,
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Next button press
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84.0, 51.0),
                      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                      backgroundColor: Color.fromARGB(200, 238, 101, 227),
                      shadowColor: Colors.black,
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
