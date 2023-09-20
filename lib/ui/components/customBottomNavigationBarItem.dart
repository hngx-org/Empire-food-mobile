import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_pic.dart';

class CustomBottomNavItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  CustomBottomNavItem({
    required this.iconData,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

              ProfilePicture(
                imageUrl: 'images/dummy.png',
                outerRadius: 20, 
                innerRadius: 18, 
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: GoogleFonts.nunito(
                  color: isSelected ? Colors.black : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0.07,
                  letterSpacing: 0.18,
                ),


          ),
          // Icon(
          //   iconData,
          //   color: isSelected ? Colors.blue : Colors.grey,
          // ),
          // Text(
          //   label,
          //   style: TextStyle(
          //     color: isSelected ? Colors.blue : Colors.grey,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }
}
