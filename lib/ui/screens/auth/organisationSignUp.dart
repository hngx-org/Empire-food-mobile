import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_button.dart';
import '../../components/success_bottom_sheet_admin.dart';

class OrganisationSignUp extends StatefulWidget {
  const OrganisationSignUp({super.key});

  @override
  State<OrganisationSignUp> createState() => _OrganisationSignUpState();
}

class _OrganisationSignUpState extends State<OrganisationSignUp> {
  var _passwordVisible;
  var _confirmPasswordVisible;
  var EmailController = TextEditingController();
  var FirstnameController = TextEditingController();
  var LastnameController = TextEditingController();
  var PhoneController = TextEditingController();
  var PasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Organisation Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }

                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                        hintText:
                            "Please enter your registered organisation name",
                        hintStyle: TextStyle(
                            fontSize: sizer(true, 16, context),
                            fontWeight: FontWeight.w500),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }

                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                        hintText: "Please enter your work email address",
                        hintStyle: TextStyle(
                            fontSize: sizer(true, 16, context),
                            fontWeight: FontWeight.w500),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }
                      return null; // Return null if the input is valid
                    },
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
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }
                      // if (value != PasswordController.text) {
                      //   return 'Passwords do not match';
                      // }
                      return null; // Return null if the input is valid
                    },
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
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                width: sizer(true, 213, context),
                height: 51,
                isTextBig: false,
                singleBigButton: true,
                color: AppColors.accentPurple5,
                content: 'Sign Up',
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    // _submit(context);

                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(sizer(true, 24, context)),
                          topRight: Radius.circular(sizer(true, 24, context)),
                        ),
                      ),
                      builder: (context) => const FullQuoteBottomSheetAdmin(
                        toGo: "Login",
                        toast: 'Success!!!',
                        message:
                            '“HNG” Organization has been created successfully. You can start gifting and receiving free lunches.',
                      ),
                    );
                  }
                }),
            const SizedBox(
              height: 35,
            )
          ],
        ),
      ),
    );
  }
}
