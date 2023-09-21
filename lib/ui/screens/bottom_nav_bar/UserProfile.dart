import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/router.dart';
import '../../../utils/colors.dart';
import '../../components/bottom_navigator.dart';
import '../../components/custom_button.dart';
import '../../components/custom_button_statistics.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Profile',
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
            icon: settingsIcon(),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/dummy_profile.png'),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Alexandra Bennett",
                        style: TextStyle(
                            fontSize: 23,
                            color: AppColors.pinkColor,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700),
                      ),
                      editIcon()
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Product Design Team",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito'),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text("Product Team",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Nunito')),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text("ABOUT ME",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito')),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text("🎨 Design enthusiast by day, pixel magician by night.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Nunito')),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    child: Column(
                      children: [pizzaIcon()],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "🌟 You've hit the free lunch jackpot! Ready to redeem or spread "
                          "the love with more free lunches? Your call! 🎁😊",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 45,
                                isTextBig: false,
                                color: AppColors.accentPurple5,
                                content: 'Reedeem Now',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteHelper.withdrawalRoute);
                                }),
                            const SizedBox(width: 10),
                            CustomButton(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 45,
                                isTextBig: false,
                                color: AppColors.accentPurple5,
                                content: 'Gift Lunch',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteHelper.giftFreeLunchScreen);
                                }),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("STATISTICS",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito')),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButtonStatistics(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: 55,
                          isTextBig: false,
                          color: AppColors.white,
                          content: '1000',
                          title: "Received & Reedemable",
                          onTap: () {}),
                      CustomButtonStatistics(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 55,
                          isTextBig: false,
                          color: AppColors.white,
                          content: '1000',
                          title: "Given",
                          onTap: () {}),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
