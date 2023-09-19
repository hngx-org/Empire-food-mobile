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
        const Text(
          "John Doe", // Replace with the actual recipient's name
          style: TextStyle(fontSize: 16.0),
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
              )
            ),
            hintText: "Enter the number of free lunches",
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          "20 = 2000",
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
              )
            ),
            hintText: "Type your free lunch message here",
          ),
          maxLines: 7, 
        ),
      ],
    );
  }
}


