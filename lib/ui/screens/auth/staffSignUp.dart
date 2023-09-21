import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/home.dart';

import '../../../helpers/router.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_button.dart';
import '../../components/success_bottomSheet.dart';

class StaffSignUp extends StatefulWidget {
  const StaffSignUp({super.key});

  @override
  State<StaffSignUp> createState() => _StaffSignUpState();
}

class _StaffSignUpState extends State<StaffSignUp> {
  var _passwordVisible;
  var _confirmPasswordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Work Email Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Please enter your work email address",
                        hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      hintText: "Please enter your password",
                        hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: !_confirmPasswordVisible,
                  decoration: InputDecoration(
                      hintText: "Please re-enter your password",
                        hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification Code",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Please enter your verification code",
                        hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
              width: sizer(true, 213, context),
              height: 51,
              singleBigButton: true,
              isTextBig: false,
              color: AppColors.accentPurple5,
              content: 'Sign Up',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(sizer(true, 24, context)),
                      topRight: Radius.circular(sizer(true, 24, context)),
                    ),
                  ),
                  builder: (context) => FullQuoteBottomSheet(
                    toGo: "Login",
                    toast: 'Success!!!',
                    message:
                        'You’ve successfully provided your accurate information. You can start gifting and receiving free lunches.! 🚀',
                    bottomSheetImageUrl: 'images/btmSht2.png',
                  ),
                );
              }),
                 SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
