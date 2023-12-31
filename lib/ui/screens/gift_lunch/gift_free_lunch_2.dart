import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_lunch_app/helpers/router.dart';
import 'package:free_lunch_app/ui/components/cancel_button.dart';
import 'package:free_lunch_app/ui/components/next_button.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
import '../../widget/reciepient.info.dart';
import 'gift_free_lunch_3.dart';

class GiftFreeLunchScreen2 extends StatefulWidget {
  const GiftFreeLunchScreen2({super.key, required this.user});
  final user;
  @override
  State<GiftFreeLunchScreen2> createState() => _GiftFreeLunchScreen2State();
}

class _GiftFreeLunchScreen2State extends State<GiftFreeLunchScreen2> {
  int lunchNumber = 1;
  String giftMessage = "hi";
  bool isLoading = false;
  void onDataReceived(dynamic receiveData) {
    setState(() {
      lunchNumber = receiveData["lunchNumber"];
      giftMessage = receiveData["message"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0XFFF5FAFF),
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
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
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
                  const SizedBox(height: 20),
                  RecipientInfoSection(
                    user: widget.user,
                    callback: onDataReceived,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CancelButton(),
                      const SizedBox(width: 25),
                      NextButton(onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GiftFreeLunchScreen3(
                                    user: widget.user,
                                    data: {
                                      "lunchNumber": lunchNumber,
                                      "giftMessage": giftMessage
                                    })));

                        // _submit(context);
                        //   Navigator.pushNamed(
                        //       context, RouteHelper.giftFreeLunchScreen3);
                        //
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
