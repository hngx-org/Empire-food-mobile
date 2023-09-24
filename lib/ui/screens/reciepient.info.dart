import 'package:flutter/material.dart';

class RecipientInfoSection extends StatelessWidget {
  const RecipientInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recipient Name",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/dummy.png'),
              ),
              SizedBox(width: 10),
              Text(
                'UduakE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  height: 0.06,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        const Text(
          "Number of Free Lunches",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          initialValue: "20",
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                gapPadding: 24,
                borderSide: BorderSide(
                  color: Colors.brown,
                  width: 12,
                )),
            hintText: "Enter the number of free lunches",
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          "10 🍕 = ₦1,000",
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 24.0),
        const Text(
          "Free Lunch Message (Optional)",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.brown,
              // width: 12,
            )),
            hintText: "Type your free lunch message here",
          ),
          maxLines: 4,
        ),
      ],
    );
  }
}
