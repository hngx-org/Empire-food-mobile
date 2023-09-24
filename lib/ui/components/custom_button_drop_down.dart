import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/size_calculator.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonDrop extends StatefulWidget {
  final double width;
  final double height;
  final List<String> items;
  final String selectedValue;
  final void Function(String?)? onChanged;
  final bool isTextBig;
  final bool singleBigButton;

  CustomButtonDrop({
    Key? key,
    required this.width,
    required this.height,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.isTextBig = true,
    this.singleBigButton = false,
  }) : super(key: key);

  @override
  _CustomButtonDropState createState() => _CustomButtonDropState();
}

class _CustomButtonDropState extends State<CustomButtonDrop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width + 25,
      height: widget.height,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
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
      child: DropdownButton<String>(
        value: widget.selectedValue,
        onChanged: widget.onChanged,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(
              child: Text(
                value,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: widget.isTextBig
                      ? 15
                      : widget.singleBigButton
                          ? sizer(true, 16, context)
                          : 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
