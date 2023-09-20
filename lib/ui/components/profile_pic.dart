import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final double outerRadius;
  final double innerRadius;

  ProfilePicture({
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
                backgroundImage: AssetImage('${imageUrl}'),
              ),
            );
    // Container(
    //   width: size + borderWidth * 2,
    //   height: size + borderWidth * 2,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     border: Border.all(
    //       color: Colors.black,
    //       width: borderWidth,
    //     ),
    //   ),
    //   child: CircleAvatar(
    //     radius: size / 2,
    //     backgroundColor: Colors.transparent,
    //     backgroundImage: AssetImage('assets/images/dummy.png'),
    //   ),
    // );

  }
}
