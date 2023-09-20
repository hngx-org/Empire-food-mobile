import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/bottom_navigator.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonStatistics extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String content;
  final String title;
  final VoidCallback onTap;
  final bool isTextBig;
  const CustomButtonStatistics({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.content,
    required this.title,
    required this.onTap,
    this.isTextBig = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
        child:  Row(
          children: [
            pizzaIcon(),
            SizedBox(width: 3,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      content,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        // if isTextBig is true(which is the default), textSize is 16 else it will be 14
                        fontSize: isTextBig ? 16 : 14,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  SizedBox(
                    child: Text(
                      title,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        // if isTextBig is true(which is the default), textSize is 16 else it will be 14
                        fontSize: isTextBig ? 16 : 14,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

