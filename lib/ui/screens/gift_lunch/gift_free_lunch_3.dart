import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_lunch_app/ui/components/cancel_button.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/ui/components/success_bottomSheet.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/size_calculator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
import '../../components/success_bottomsheet_login.dart';

class GiftFreeLunchScreen3 extends StatefulWidget {
  const GiftFreeLunchScreen3({
    Key? key,
    required this.user,
    required Map<String, Object> this.data,
  }) : super(key: key);
  final data, user;
  @override
  State<GiftFreeLunchScreen3> createState() => _GiftFreeLunchScreen3State();
}

class _GiftFreeLunchScreen3State extends State<GiftFreeLunchScreen3> {
  bool isLoading = false;
  Future<void> _submit(BuildContext context) async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      await authProvider.sendLunch(widget.user["id"],
          widget.data["lunchNumber"], widget.data["giftMessage"]);

      // Set isLoading back to false after the operation is complete
      setState(() {
        isLoading = true;
      });
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(sizer(true, 24, context)),
            topRight: Radius.circular(sizer(true, 24, context)),
          ),
        ),
        builder: (context) => FullQuoteBottomSheetLogin(
          toGo: "Go Home",
          toast: 'Success!!!',
          message:
              'You’ve successfully gifted ${widget.user["first_name"]} ${widget.user["last_name"]} ${widget.data["lunchNumber"]} lunches.',
          bottomSheetImageUrl: 'images/btmSht2.png',
        ),
      );
    } catch (error) {
      String errorMessage = "An error occurred.";

      if (error is Exception) {
        final errorDetail = error.toString();
        final match = RegExp(r'msg: ([^\]]*)').firstMatch(errorDetail);
        final detail = match?.group(1);

        if (detail != null) {
          final cleanDetail = detail.replaceAll(RegExp(r',\s*ctx:.*}$'), '');
          errorMessage = "Invalid credentials. $cleanDetail";
        }
      }

      // Set isLoading back to false in case of an error
      setState(() {
        isLoading = false;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

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
                            image: AssetImage("images/dummy_6.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 2),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
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
                                      '${widget.user["first_name"]}',
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
                                      '${widget.data["lunchNumber"]}',
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
                        child: Column(
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
                                '${widget.data["giftMessage"]}',
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
                    CustomButton(
                        width: 175,
                        height: 51,
                        color: AppColors.accentPurple5,
                        content: 'Gift Free Launch',
                        onTap: () {
                          print("heeeeeeeeeeeeeeeeeeee");
                          _submit(context);
                          // showModalBottomSheet(
                          //   context: context,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.only(
                          //       topLeft:
                          //           Radius.circular(sizer(true, 24, context)),
                          //       topRight:
                          //           Radius.circular(sizer(true, 24, context)),
                          //     ),
                          //   ),
                          //   builder: (context) => const FullQuoteBottomSheet(
                          //     toast: '🎉 Hooray!!! 🎉',
                          //     message:
                          //         'UduakE has received your free lunch. Keep the positive vibes coming! 🚀',
                          //     bottomSheetImageUrl: 'images/btmSht.png',
                          //   ),
                          // );
                        })
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
