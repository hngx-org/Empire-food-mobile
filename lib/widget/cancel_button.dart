import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 98.0,
        height: 51.0,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color:const Color(0XFFF5FAFF),
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
        child: const Center(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}