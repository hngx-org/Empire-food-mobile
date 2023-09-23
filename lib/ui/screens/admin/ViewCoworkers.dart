import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_lunch_app/helpers/router.dart';
import 'package:free_lunch_app/ui/components/bottom_navigator.dart';
import 'package:free_lunch_app/ui/components/cancel_button.dart';
import 'package:free_lunch_app/ui/components/next_button.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
import '../../components/admin_home_card.dart';

class ViewCoworkerScreen extends StatefulWidget {
  const ViewCoworkerScreen({super.key});

  @override
  State<ViewCoworkerScreen> createState() => _ViewCoworkerScreenState();
}

class _ViewCoworkerScreenState extends State<ViewCoworkerScreen> {
  String selectedName = '';
  final TextEditingController searchRecipient = TextEditingController();

  final List<String> staffName = [
    'Phorlarjormey',
    'UduaKe',
    'Chinedu',
    'Dorcas',
    'Yetunde',
  ];

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
                      'Please select or search for who you would like to give a free lunch to today, or add a new co-worker.',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recipient Name",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        child: SearchBar(
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(8)),
                              side: BorderSide(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                          controller: searchRecipient,
                          hintText: 'Name of free lunch recipient',
                          trailing: const [Icon(Icons.search)],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: List.generate(usersData.length, (index) {
                          final user = usersData[index];
                          return AdminHomeCard(
                            staffName:
                                '${user['first_name']} ${user['last_name']}',
                            roles: 'User Role',
                            imageUrl: 'images/dummy_$index.png',
                            onTap: (selectedItem) {
                              if (selectedItem == 'Gift Lunch') {
                                Navigator.pushNamed(
                                    context, RouteHelper.giftFreeLunchScreen);
                              } else if (selectedItem == 'Delete Profile') {
                                // Handle 'Delete Profile' action
                              }
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.pinkLightColor,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: () {
          Navigator.pushNamed(context, RouteHelper.inviteWorkerRoute);
        },
        child: Icon(
          Icons.add,
          color: AppColors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
