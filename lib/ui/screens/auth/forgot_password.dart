import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../helpers/router.dart';
import '../../../providers/auth.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool _issecured = true;
  bool _isLoading = false;

  bool isLoading = false; // Track loading state

  String? _validateEmail(String? email) {
    RegExp emailRegex =
    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    final isEmailvalid = emailRegex.hasMatch(email ?? '');
    if (!isEmailvalid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _submit(BuildContext context) async {


    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      final email = emailcontroller.text;
      await authProvider.sendOtp(email);

      // Set isLoading back to false after the operation is complete
      setState(() {
        isLoading = false;
      });


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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return InkWell(
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
          'Send Otp',
          style: GoogleFonts.nunito(
            color: Color(0xFF583208),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: _isLoading ?
      Center(
        child: CircularProgressIndicator(),
      ) :
      SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please enter your email to get OTP to reset your password. ',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.35,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Work Email Address",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // search box
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      showCursor: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Please enter your work email address',
                        hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),



                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        width: 150,
                        height: 51,
                        singleBigButton: true,
                        isTextBig: false,
                        color: AppColors.accentPurple5,
                        content: 'Continue',
                        onTap: () {
                          setState(() {
                            _isLoading = true;
                          });
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pushNamed(RouteHelper.resetPasswordRoute);
                          // _submit(context);
                          setState(() {
                            _isLoading = false;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget togglepassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _issecured = !_issecured;
        });
      },
      icon: _issecured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Color.fromRGBO(0, 0, 0, 1),
    );
  }


}
