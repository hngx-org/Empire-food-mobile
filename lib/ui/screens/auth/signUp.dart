import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/screens/auth/staffSignUp.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/size_calculator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/router.dart';
import '../../components/bottom_navigator.dart';
import 'organisationSignUp.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 23,
                  color: Color.fromRGBO(89, 51, 8, 1),
                ),
              );
          },
        ),
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: GoogleFonts.nunito(
            color: const Color(0xFF583208),
            fontSize: sizer(true, 24, context),
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Dismiss the keyboard when the user taps on the screen
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = true;
                            });
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppColors.activeBackground
                                  : AppColors.inactiveBackground,
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Center(child: Text(
                              "ORGANISATION",
                              style: GoogleFonts.nunito(
                                fontSize: sizer(true, 16, context),
                                fontWeight: FontWeight.w600,
                                color: selected
                                    ? AppColors.black
                                    : AppColors.greyColor,
                                height: 1.0,
                                letterSpacing: 0.24,
                              ),
                            )),
                          ),
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = false;
                            });
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppColors.inactiveBackground
                                  : AppColors.activeBackground,
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(child: Text("STAFF",
                            style: GoogleFonts.nunito(
                                fontSize: sizer(true, 16, context),
                                fontWeight: FontWeight.w600,
                                color: selected
                                    ? AppColors.greyColor
                                    : AppColors.black,
                                height: 1.0,
                                letterSpacing: 0.24,
                              ),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Please ensure that you provide accurate information in this form to avoid any hiccups in this process.",
                      style: GoogleFonts.nunito(fontSize: sizer(true, 18, context), fontWeight: FontWeight.w400, color: AppColors.black),
                    ),
                  ),
                  selected ?  const OrganisationSignUp() : const StaffSignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
