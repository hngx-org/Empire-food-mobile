import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:free_lunch_app/providers/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../helpers/router.dart';
import '../../utils/colors.dart';
import '../components/bottom_navigator.dart';
import '../components/custom_button.dart';
import '../components/home_card.dart';
import '../components/profile_pic.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key, Key? key});
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print('ENTERING THE HOME NOWW!!>>>>>>');
    _fetchUsers(); // Call the async function from initState
  }

  List usersData = [];

  Future _fetchUsers() async {
    final authProvider = Provider.of<Auth>(context, listen: false);
  

    try {
      final userData = await authProvider.allUsers();
      setState(() {
         usersData = userData['data'];
      });
    } catch (error) {
      // Handle any exceptions here.
      print('Error fetching users: $error');
    }
  }

  // Future<void> _fetchUsers() async {
  //   final authProvider = Provider.of<Auth>(context, listen: false);

  //   try {
  //     await authProvider.allUsers();
  //     // Do something after the call to allUsers() if needed.
  //   } catch (error) {
  //     // Handle any exceptions here.
  //     print('Error fetching users: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final List<String> staffName = [
      'Phorlarjormey',
      'UduaKe',
      'Chinedu',
      'Dorcas',
      'Yetunde'
    ];
    final List<String> roles = [
      'Product Designer',
      'Product Designer',
      'Fullstack Developer',
      'Product Designer',
      'Fullstack Developer'
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: menuIcon(),
              onPressed: () {
                _fetchUsers();
               print('name from provider>>>>>>>>>>>>: ${ Provider.of<Auth>(context, listen: true).name}');
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.nunito(
            color: const Color(0xFF583208),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
        actions: [
          IconButton(
            icon: searchIcon(),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfilePicture(
                    imageUrl: 'images/dummy.png',
                    outerRadius: 26,
                    innerRadius: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Welcome, ${Provider.of<Auth>(context, listen: true).name ?? 'Alex'}',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                      letterSpacing: 0.18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomButton(
                  width: 160,
                  height: 45,
                  isTextBig: false,
                  color: AppColors.accentPurple5,
                  content: 'YOUR COWORKERS',
                  onTap: () {}),
              const SizedBox(height: 15),
              Column(
                children: List.generate(usersData.length, (index) {
              final user = usersData[index];
              return HomeCard(
                staffName: '${user['first_name']} ${user['last_name']}',
                roles:
                    'User Role', // You can replace this with the actual role data
                imageUrl:
                    'images/dummy.png', // Replace with the actual image URL from the user data
                onTap: () {
                  Navigator.pushNamed(context, RouteHelper.giftFreeLunchScreen);
                },
              );
            }),
         
              ),
              SizedBox(
                height: 20,
              ),

            ]
             
          ),
        ),
      ),
    );
  }
}
