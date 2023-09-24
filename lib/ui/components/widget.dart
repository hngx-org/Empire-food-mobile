import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'custom_button.dart';
import 'profile_pic.dart';


Widget button(double width, double height, Color color, String content) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          content,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Tropiline',
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
        ),
      ),
    ),
  );
}


Widget CardWidget (staffs, roles,){
  return  
  SizedBox(
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
                  imageUrl: 'images/dummy.png',
                  outerRadius: 22,
                  innerRadius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      staffs,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                    roles,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CustomButton(
                width: 133,
                height: 51,
                color: AppColors.whiteButtonColor,
                content: 'Gift Launch',
                onTap: () {})
          ],
        ),
      ),
    ),
  );
             
}
