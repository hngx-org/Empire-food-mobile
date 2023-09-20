import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/ui/components/profile_pic.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/size_calculator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  final String staffName;
  final String roles;
  final String imageUrl;
  final VoidCallback onTap;
  const HomeCard(
      {super.key,
      required this.staffName,
      required this.roles,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ProfilePicture(
                    imageUrl: 'images/dummy.png',
                    outerRadius: 22,
                    innerRadius: 20,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        staffName,
                        style: GoogleFonts.nunito(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        roles,
                        style: GoogleFonts.nunito(
                          fontSize: 14.0,
                          color: AppColors.text2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CustomButton(
                  width: sizer(true, 133, context),
                  height: 51,
                  color: AppColors.whiteButtonColor,
                  content: 'Gift Launch',
                  onTap: onTap)
            ],
          ),
        ),
      ),
    );
  }
}
