// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_button.dart';
import '../../components/success_bottomSheet.dart';
import '../../components/success_bottomsheet_login.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool _issecured = true;

  String? _validateEmail(String? email) {
    RegExp emailRegex =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    final isEmailvalid = emailRegex.hasMatch(email ?? '');
    if (!isEmailvalid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 20),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 23,
                          color: Color.fromRGBO(89, 51, 8, 1),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(89, 51, 8, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please ensure that you provide accurate information in this form to avoid any hiccups in this process. ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Work Email Address",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
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
                          color: Color.fromRGBO(0, 0, 0, 1), fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: _issecured,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordcontroller,
                    showCursor: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Please enter your password',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1), fontSize: 15),
                        suffixIcon: togglepassword(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) {
                      passwordcontroller.text = name!;
                      name.isEmpty ? 'Please enter your password' : null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        width: 150,
                        height: 45,
                        isTextBig: false,
                        color: AppColors.accentPurple5,
                        content: 'Sign In',
                        onTap: () {
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
                            builder: (context) => FullQuoteBottomSheetLogin(
                              toGo: "Go Home",
                              toast: 'Success!!!',
                              message:
                                  'You’ve successfully provided your accurate information. You can start gifting and receiving free lunches.',
                              bottomSheetImageUrl: 'images/btmSht2.png',
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        )),
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

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.ontap,
    required this.label,
  });
  final Function()? ontap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(235, 217, 252, 1),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
