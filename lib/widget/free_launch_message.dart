import 'package:flutter/material.dart';

class FreeLaunchMessage extends StatefulWidget {
  const FreeLaunchMessage({super.key});

  @override
  State<FreeLaunchMessage> createState() => _FreeLaunchMessageState();
}

class _FreeLaunchMessageState extends State<FreeLaunchMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Free Lunch Message [Optional]',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            child: TextFormField(
              maxLines: 5,
              decoration:const InputDecoration(
                border:InputBorder.none
              ),
            ),
          ),
        ),
      ],
    );
  }
}
