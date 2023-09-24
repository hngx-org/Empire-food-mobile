import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
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

  var EmailController = TextEditingController();
  var FirstnameController = TextEditingController();
  var LastnameController = TextEditingController();
  var PhoneController = TextEditingController();
  var PasswordController = TextEditingController();
  var _codeController = TextEditingController();

  bool isLoading = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  String? _validateEmail(String? email) {
    RegExp emailRegex =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    final isEmailvalid = emailRegex.hasMatch(email ?? '');
    if (!isEmailvalid || email == "") {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _submit(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      // Get the email and password from the input fields
      final email =
          EmailController.text; // Get the email from your TextFormField
      final password =
          PasswordController.text; // Get the password from your TextFormField
      final firstname = FirstnameController.text; // Get the first name
      final lastname = LastnameController.text; // Get the last name
      final phone = PhoneController.text; // Get the phone number
      final otp = _codeController.text; // Get the phone number

      // Call the signUp method from your provider
      await authProvider.signUp(email, password, firstname, lastname, phone, otp);
      setState(() {
        isLoading = false;
      });

      // Sign-up was successful, show a success message or navigate to the next screen
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(sizer(true, 24, context)),
            topRight: Radius.circular(sizer(true, 24, context)),
          ),
        ),
        builder: (context) => const FullQuoteBottomSheet(
          toGo: "Login",
          toast: 'Success!!!',
          message:
              'You’ve successfully provided your accurate information. You can start gifting and receiving free lunches.! 🚀',
          bottomSheetImageUrl: 'images/btmSht2.png',
        ),
      );
    } catch (error) {
      // Handle the error, e.g., show an error message
      print(error);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Something went wrong: $error'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(), // Display a spinner
          )
        : Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Enter the 6-Digit Code:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(

                        validator: (value) {
                          String? enteredCode = value;
                          if (enteredCode?.length == 6) {
                            // Handle the 6-digit code, e.g., submit it or validate it
                            print('Entered Code: $enteredCode');
                          } else {
                            // Code is not 6 digits long, show an error message
                            print('Invalid Code');
                          }
                          return null;
                        },

                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        maxLength: 6, // Limit to 6 characters
                        decoration: InputDecoration(
                          hintText: '123456',
                          counterText: '', // Hide the character counter
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Work Email Address",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: EmailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value'; // Error message to display
                              }
                              _validateEmail(value);
                              return null; // Return null if the input is valid
                            },
                            decoration: InputDecoration(
                                hintText:
                                    "Please enter your work email address",
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
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value'; // Error message to display
                              }
                              return null; // Return null if the input is valid
                            },
                            controller: FirstnameController,
                            decoration: InputDecoration(
                                hintText: "Please enter your Firstname",
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
                            "Last Name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value'; // Error message to display
                              }
                              return null; // Return null if the input is valid
                            },
                            controller: LastnameController,
                            decoration: InputDecoration(
                                hintText: "Please enter your last name",
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value'; // Error message to display
                              }
                              return null; // Return null if the input is valid
                            },
                            controller: PasswordController,
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value'; // Error message to display
                              }
                              if (value != PasswordController.text) {
                                return 'Passwords do not match';
                              }
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
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Phone number",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value'; // Error message to display
                              }
                              return null; // Return null if the input is valid
                            },
                            controller: PhoneController,
                            decoration: InputDecoration(
                                hintText: "Please enter your phone number",
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
                          print("Hello");

                          if (_formkey.currentState!.validate()) {
                            _submit(context);
                          }

                          // showModalBottomSheet(
                          //   context: context,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.only(
                          //       topLeft: Radius.circular(sizer(true, 24, context)),
                          //       topRight: Radius.circular(sizer(true, 24, context)),
                          //     ),
                          //   ),
                          //   builder: (context) => FullQuoteBottomSheet(
                          //     toGo: "Login",
                          //     toast: 'Success!!!',
                          //     message:
                          //         'You’ve successfully provided your accurate information. You can start gifting and receiving free lunches.! 🚀',
                          //     bottomSheetImageUrl: 'images/btmSht2.png',
                          //   ),
                          // );
                        }),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}