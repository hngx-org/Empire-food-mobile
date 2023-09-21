import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_lunch_app/helpers/router.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/ui/components/full_button.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/size_calculator.dart';
import 'package:google_fonts/google_fonts.dart';

class FullQuoteBottomSheet extends StatelessWidget {
  const FullQuoteBottomSheet({
    Key? key,
    required this.toast,
    required this.message,
    // required this.bgColor,
    required this.bottomSheetImageUrl
  }) : super(key: key);
  final String toast, message, bottomSheetImageUrl ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      padding: EdgeInsets.symmetric(
        horizontal: sizer(true, 60, context),
        vertical: sizer(true, 21, context),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bottomSheetImageUrl),
          fit: BoxFit.cover,
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sizer(true, 24, context)),
          topRight: Radius.circular(sizer(true, 24, context)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            toast,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                fontSize: sizer(true, 40, context),
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1),
          ),
          SizedBox(
            height: sizer(false, 35, context),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: sizer(true, 16, context),
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(
            height: 67,
          ),

          CustomButton(
              width: 172,
              height: 51,
              color: AppColors.accentPurple5,
              content: 'Go Back Home',
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
                Navigator.of(context).pushNamed(RouteHelper.homeRoute);
              })
        ],
      ),
    );
  }
}
