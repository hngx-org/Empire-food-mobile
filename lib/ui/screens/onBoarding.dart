import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:free_lunch_app/helpers/router.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/size_calculator.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {Key? key,
      this.title,
      this.description,
      this.imageSrc,
      this.dataLength,
      this.currentIndex})
      : super(key: key);
  final String? title, imageSrc, description;
  final int? dataLength;
  final double? currentIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: height * 0.1,
              ),
              SvgPicture.asset(
                'images/pizza.svg',
                fit: BoxFit.contain,
                height: 220,
                width: currentIndex != 4 ? 220 : 300,
              ),
              SizedBox(
                height: sizer(false, 26, context),
              ),
              Text(
                'Start Spreading Appreciation Today!',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: sizer(true, 31, context),
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: Text(
                  'Rewarding someone in the office has never been this easy, create a more productive and compensating work space with free lunches.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: sizer(true, 16, context),
                    color: AppColors.text3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              CustomButton(
                  width: width * 0.8,
                  height: 51,
                  color: AppColors.accentPurple5,
                  content: 'Sign Up',
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteHelper.signUpRoute);
                  }),
              SizedBox(
                height: sizer(false, 26, context),
              ),
              CustomButton(
                  width: width * 0.8,
                  height: 51,
                  color: AppColors.accentPurple5,
                  content: 'Sign In',
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteHelper.loginRoute);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
