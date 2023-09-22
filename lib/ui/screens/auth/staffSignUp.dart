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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  Future<void> _submit(BuildContext context) async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      
      final email =
          EmailController.text;
      final password =
          PasswordController.text; 

      final firstname =
          FirstnameController.text; 

      final lastname =
          LastnameController.text; 

      final phone =
          PhoneController.text; 

      // Call the signUp method from your provider
      var responseJson = await authProvider.signUp(email, password, firstname, lastname, phone);

    print('responseJson>>>>>: $responseJson');

     
      await authProvider.setEmail(responseJson['data']['email']);
      await authProvider.setName(responseJson['data']['first_name']);

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
    return Container(
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
                  "Work Email Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: EmailController,
                  decoration: InputDecoration(
                      hintText: "Please enter your work email address",
                      hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                  "First Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: FirstnameController,
                  decoration: InputDecoration(
                      hintText: "Please enter your Firstname",
                      hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: LastnameController,
                  decoration: InputDecoration(
                      hintText: "Please enter your last name",
                      hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: PhoneController,
                  decoration: InputDecoration(
                      hintText: "Please enter your phone number",
                      hintStyle: TextStyle(
                          fontSize: sizer(true, 16, context),
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
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
                _submit(context);
              
              }),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
