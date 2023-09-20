import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/size_calculator.dart';


class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.of(context).pop();
      },
      child: Container(
        width: 98.0,
        height: 51.0,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: AppColors.whiteButtonColor,
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
            'Cancel',
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: sizer(true, 18, context),
              fontWeight: FontWeight.w700,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
