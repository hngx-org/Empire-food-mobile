import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 84,
        height: 51,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0XFFEBD9FC),
          borderRadius: BorderRadius.circular(12),
           border: Border.all(color: Colors.black)
        ),
        child:const Center(
          child: Text(
            'Next',
            style:TextStyle(
              fontFamily: 'Nunito',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
