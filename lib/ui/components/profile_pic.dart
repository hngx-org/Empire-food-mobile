import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final double outerRadius;
  final double innerRadius;

  const ProfilePicture({super.key, 
    required this.imageUrl,
    this.outerRadius = 22.0,
    this.innerRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: outerRadius,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: innerRadius,
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }
}
