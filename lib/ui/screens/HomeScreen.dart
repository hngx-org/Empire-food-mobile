import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/router.dart';
import '../../utils/colors.dart';
import '../components/bottom_navigator.dart';
import '../components/custom_button.dart';
import '../components/home_card.dart';
import '../components/profile_pic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

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
              onPressed: () {},
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.nunito(
            color: Color(0xFF583208),
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
                  ProfilePicture(
                    imageUrl: 'images/dummy.png',
                    outerRadius: 26,
                    innerRadius: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Welcome, Alexandra',
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
                children: List.generate(staffName.length, (index) {
                  return HomeCard(
                    staffName: staffName[index],
                    roles: roles[index],
                    imageUrl: 'images/dummy.png',
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteHelper.giftFreeLunchScreen);
                    },
                  );
                }),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
