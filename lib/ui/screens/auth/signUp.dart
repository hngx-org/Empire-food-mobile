import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/screens/auth/staffSignUp.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/bottom_navigator.dart';
import '../../components/custom_button.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: backIcon(),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: GoogleFonts.nunito(
            color: Color(0xFF583208),
            fontSize: 24,
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
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
        
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      SizedBox(
                        height: 60,
                          width: 180,
                          child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  selected = !selected;
                                });
                              },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected ? AppColors.activeBackground : AppColors.inactiveBackground ,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10))
        
                              ),
                              child: Center(child: Text("Organisation")),),
                          )),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            selected = !selected;
                          });
                        }
                        ,
                        child: SizedBox(
                          height: 60, width: 180,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: selected ? AppColors.inactiveBackground : AppColors.activeBackground,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10))
        
                              ),
                              child: Center(child: Text("Staff")),)),
                      )
                    ],
                    ),
                  ),
        
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Please ensure that you provide accurate information in this form to avoid any hiccups in this process.",
                      style: TextStyle(fontSize: 17),),
                  ),
                  selected ? StaffSignUp() : OrganisationSignUp(),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





