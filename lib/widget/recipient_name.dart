import 'package:flutter/material.dart';

class Resipient extends StatelessWidget {
  const Resipient({super.key, required this.staffName});
  final String staffName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset('images/Rectangle14.png'),
          ),
          const SizedBox(width: 5),
          Text(
            staffName,
            style:const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
