import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_lunch_app/ui/components/bottom_navigator.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/ui/components/success_bottom_invite_sheet.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
import '../../../utils/size_calculator.dart';

class InviteCoworkerScreen extends StatefulWidget {
  const InviteCoworkerScreen({super.key});

  @override
  State<InviteCoworkerScreen> createState() => _InviteCoworkerScreenState();
}

class _InviteCoworkerScreenState extends State<InviteCoworkerScreen> {
  String selectedName = '';

  var EmailController = TextEditingController();
  var workerNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers(); // Call the async function from initState
  }

  List<Map<String, dynamic>> usersData = [];

  Future<void> _fetchUsers() async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      final List<Map<String, dynamic>> userData =
          (await authProvider.allUsers()) as List<Map<String, dynamic>>;
      setState(() {
        usersData = userData;
      });
    } catch (error) {
      showSnackbar(context, Colors.red, error);
      print('Error fetching users: $error');
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.text1,
              ),
            );
          },
        ),
        title: Text(
          'Your Coworkers',
          style: GoogleFonts.nunito(
            color: const Color(0xFF583208),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when the user taps on the screen
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: Column(
                children: [
                  // SizedBox(height: 20),
                  SizedBox(
                    width: 380,
                    child: Text(
                      'Please ensure that you provide accurate information in this form to avoid any hiccups in this process.',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Co-worker’s Name",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: workerNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a value'; // Error message to display
                                }

                                return null; // Return null if the input is valid
                              },
                              decoration: InputDecoration(
                                  hintText:
                                      "Please enter your Co-worker’s Name",
                                  hintStyle: TextStyle(
                                      fontSize: sizer(true, 16, context),
                                      fontWeight: FontWeight.w500),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
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
                              "Co-worker’s Email Address",
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
                                      "Please enter your Co-worker’s email address",
                                  hintStyle: TextStyle(
                                      fontSize: sizer(true, 16, context),
                                      fontWeight: FontWeight.w500),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                          width: 213,
                          height: 59,
                          color: AppColors.pinkLightColor,
                          content: 'Add Coworker',
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
                              builder: (context) =>
                                  const FullQuoteBottomSheetInvite(
                                toGo: 'Go Home',
                                toast: 'Success!!!',
                                message:
                                    'You have successfully added a new coworker. Here’s the code for the coworker: ',
                                code: '1234567',
                              ),
                            );
                          })
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
