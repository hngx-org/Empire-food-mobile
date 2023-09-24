import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void nextScreen(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void nextScreenReplace(context, screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

void showSnackbar(context, Color color, String message) {

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


Widget buttonNext(
    double width, double height, Color color, String content, context, screen) {
  return GestureDetector(
    onTap: () {
      nextScreen(context, screen);
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

Widget menuIcon() {
  const String assetName = 'images/svg/ham_icon.svg';
  return SvgPicture.asset(
    assetName, semanticsLabel: 'Menu');
}
Widget searchIcon() {
  const String assetName = 'images/svg/search_icon.svg';
  return SvgPicture.asset(
    assetName, semanticsLabel: 'Menu');
}
Widget settingsIcon() {
  const String assetName = 'images/svg/settings_icon.svg';
  return SvgPicture.asset(
      assetName, semanticsLabel: 'Settings');
}
Widget editIcon() {
  const String assetName = 'images/svg/edit_icon.svg';
  return InkWell(
    onTap: (){},
    child: SvgPicture.asset(
        assetName, semanticsLabel: 'Edit'),
  );
}
Widget pizzaIcon() {
  const String assetName = 'images/svg/pizza_icon.svg';
  return SvgPicture.asset(
      assetName, semanticsLabel: 'Pizza');
}
Widget backIcon() {
  const String assetName = 'images/svg/back_icon.svg';
  return InkWell(
    onTap: (){},
    child: SvgPicture.asset(
        assetName, semanticsLabel: 'Back'),
  );
}