import 'package:flutter/material.dart';

void nextScreen(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void nextScreenReplace(context, screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

void showSnackbar(context, Color color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}

Widget button(double width, double height, Color color, String content) {
  return Container(
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
  );
}



Widget buttonPop(
    double width, double height, Color color, String content, context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
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


