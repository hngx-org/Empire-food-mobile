// import 'package:flutter/material.dart';
// import 'package:free_lunch_app/ui/components/profile_pic.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomBottomNavItem extends StatelessWidget {
//   final IconData icon;
//   final bool isSelected;
//   final VoidCallback onPressed;
//   final String label;

//   CustomBottomNavItem({
//     required this.icon,
//     required this.isSelected,
//     required this.onPressed,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Column(
//         children:[
//            Container(
//           padding: EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.white : Colors.transparent,
//             borderRadius: BorderRadius.circular(10.0),
//             boxShadow: isSelected
//                 ? [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 5.0,
//                       spreadRadius: 2.0,
//                     ),
//                   ]
//                 : [],
//           ),
//           child:Column(
//             children: [
//               ProfilePicture(
//                 imageUrl: 'images/dummy.png',
//                 outerRadius: 32, // Customize the size if needed
//                 innerRadius: 30, // Customize the border width if needed
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 label,
//                 style: GoogleFonts.nunito(
//                   color: isSelected ? Colors.black : Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   height: 0.07,
//                   letterSpacing: 0.18,
//                 ),

//           //     Icon(
//           //   icon,
//           //   color: isSelected ? Colors.white : Colors.transparent,
//           ),
//             ],

//           ),
//         ),
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/profile_pic.dart';
import 'package:google_fonts/google_fonts.dart';

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
                outerRadius: 20, // Customize the size if needed
                innerRadius: 18, // Customize the border width if needed
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
