import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/cancel_button.dart';
import 'package:free_lunch_app/ui/components/next_button.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GiftFreeLunchScreen3 extends StatefulWidget {
  const GiftFreeLunchScreen3({Key? key}) : super(key: key);

  @override
  State<GiftFreeLunchScreen3> createState() => _GiftFreeLunchScreen3State();
}

class _GiftFreeLunchScreen3State extends State<GiftFreeLunchScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.text1,
              ),
            );
          },
        ),
        title: Text(
          'Gift Free Lunch',
          style: GoogleFonts.nunito(
            color: AppColors.text1,
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
            padding: const EdgeInsets.only(bottom: 70, left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  width: 380,
                  child: Text(
                    'Double-check, and let\'s make sure you are giving free lunch to the right person.',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 380,
                  height: 430,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDEECF6),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("images/dummy.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 2),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Recipient’s Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Opacity(
                                    opacity: 0.70,
                                    child: Text(
                                      'UduakE',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Number of Lunches',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Opacity(
                                    opacity: 0.70,
                                    child: Text(
                                      '20',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 340,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Free Lunch Message',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Opacity(
                              opacity: 0.70,
                              child: Text(
                                'Thank you for being an awesome mentor🙏🏾🎉🤩🚀🌷🥳. You just have a way of spreading peace and love when you send a message to the group chat.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CancelButton(),
                    const SizedBox(width: 25),
                    NextButton(onTap: () {}),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
