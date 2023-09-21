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

          SizedBox(height: 10,),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Work Email Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Please enter your work email address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                TextFormField(
                  obscureText:
                  !_passwordVisible,
                  decoration: InputDecoration(
                      hintText: "Please enter your password",
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
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Confirm Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                TextFormField(
                  obscureText:
                  !_confirmPasswordVisible,
                  decoration: InputDecoration(
                      hintText: "Please re-enter your password",
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
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Verification Code", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Please enter your verification code",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          CustomButton(
              width: 150,
              height: 45,
              // using the property isTextBig make the text smaller(14) if it is false, but if it is true(which is the default), the text size will be 16
              isTextBig: false,
              color: AppColors.accentPurple5,
              content: 'Sign Up',
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft:
                      Radius.circular(sizer(true, 24, context)),
                      topRight:
                      Radius.circular(sizer(true, 24, context)),
                    ),
                  ),
                  builder: (context) => FullQuoteBottomSheet(
                    toGo: "Go Home",
                    toast:   '🎉 Success!!! 🎉',
                    message: 'You’ve successfully provided your accurate information. You can start gifting and receiving free lunches.! 🚀',
                    bottomSheetImageUrl: 'images/btmSht2.png',
                  ),
                );
              }
          ),
        ],
      ),
    );
  }}