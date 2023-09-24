import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/custom_button_drop_down.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/size_calculator.dart';
import 'profile_pic.dart';

class AdminHomeCard extends StatelessWidget {
  final String staffName;
  final String roles;
  final String imageUrl;
  final Function(String) onTap;
  const AdminHomeCard(
      {super.key,
      required this.staffName,
      required this.roles,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  const ProfilePicture(
                    imageUrl: 'images/dummy_6.png',
                    outerRadius: 22,
                    innerRadius: 20,
                  ),
                  const SizedBox(width: 10),
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: CustomButtonDrop(
                  width: sizer(true, 133, context),
                  height: 51,
                  items: ['Gift Lunch', 'Delete Profile'],
                  onChanged: (selectedItem) {
                    if (selectedItem == 'Gift Lunch' || selectedItem == 'Delete Profile') {
                      onTap(selectedItem!);
                    }
                  },
                  selectedValue: 'Gift Lunch',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
