import 'package:flutter/material.dart';
import 'package:free_lunch_app/helpers/router.dart';
import 'package:free_lunch_app/providers/auth.dart';
import 'package:free_lunch_app/ui/components/bottom_navigator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  var OrganisationNameController = TextEditingController();
  var LunchPriceController = TextEditingController();
  var FirstnameController = TextEditingController();
  var LastnameController = TextEditingController();
  var PhoneController = TextEditingController();
  var PasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future _signUp() async {
    final authProvider = Provider.of<Auth>(context, listen: false);
    try {
     final responseData =  await authProvider.adminSignUp(
        EmailController.text,
        PasswordController.text,
        FirstnameController.text,
        LastnameController.text,
        PhoneController.text,
      );

      final data = await authProvider.adminLogin(
        EmailController.text,
        PasswordController.text,
      );

      final response = await authProvider.createOrganization(
          OrganisationNameController.text,
          LunchPriceController.text,
          data['access_token']);

      return response;
      // await authProvider.
    } catch (error) {
      print('Error signing up: $error');
    }
  }

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
                    controller: OrganisationNameController,
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
                    "Organisation Lunch price",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: LunchPriceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }

                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                        hintText: "Please enter organisation Lunch price",
                        hintStyle: TextStyle(
                            fontSize: sizer(true, 16, context),
                            fontWeight: FontWeight.w500),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                  Text(
                    "Lunch Price in #1000, #2000, #3000...",
                     style: GoogleFonts.nunito(
                            fontSize: sizer(true, 16, context),
                           color: AppColors.activeBackground,
                            fontWeight: FontWeight.w500),
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
                    "First Name (Admin)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: FirstnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }

                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                        hintText: "Please enter your first name",
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
                    "Last Name (Admin)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: LastnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }

                      return null; // Return null if the input is valid
                    },
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
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " Phone Number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: PhoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value'; // Error message to display
                      }

                      return null; // Return null if the input is valid
                    },
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
                    controller: EmailController,
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
                    controller: PasswordController,
                    validator: (value) {
                      
                     final passwordPattern = r'^(?=.*[0-9])(?=.*[\W_]).{8,}$';
                      final passwordRegex = RegExp(passwordPattern);

                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (!passwordRegex.hasMatch(value)) {
                        return 
                        'Password must match requirement.';
                      }
                      return null; // Return null// Return null if the input is valid
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Password must be at least 8 characters long, contain at least one number and one special character',
                    style: GoogleFonts.nunito(
                        fontSize: sizer(true, 13, context),
                        color: const Color.fromARGB(255, 119, 42, 196),
                        fontWeight: FontWeight.w500)
                  )
                  
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
                    // controller: PasswordController,
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
              height: 50,
            ),
            CustomButton(
                width: sizer(true, 213, context),
                height: 51,
                isTextBig: false,
                singleBigButton: true,
                color: AppColors.accentPurple5,
                content: 'Sign Up',
                onTap: () async{
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    final response = await _signUp();
                    print(response);
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(sizer(true, 24, context)),
                          topRight: Radius.circular(sizer(true, 24, context)),
                        ),
                      ),
                      builder: (context) =>  FullQuoteBottomSheetAdmin(
                        toGo: "Login",
                        userData: response,
                        toast: 'Success!!!',
                        message: response['detail'] == 'Organization name already exists' || response['detail'] == null ? 'Organization name already exists':
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