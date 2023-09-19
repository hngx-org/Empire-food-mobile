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
        const SizedBox(height: 5.0),
         Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown,
              style: BorderStyle.solid,
              width: 2.0
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child:const Text(
          "John Doe", 
          style: TextStyle(fontSize: 16.0),
        ),
         ),
        const SizedBox(height: 15.0),
        const Text(
          "Number of Free Lunches",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4.0),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown,
              style: BorderStyle.solid,
              width: 2.0
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            initialValue: "20",
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                gapPadding: 24,
                borderSide: BorderSide.none,
              ),
              hintText: "Enter the number of free lunches",
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        const Text(
          "20 = 2000",
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 15.0),
        const Text(
          "Free Lunch Message (Optional)",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4.0),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown,
              style: BorderStyle.solid,
              width: 2.0
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                gapPadding: 24,
                borderSide: BorderSide.none,
              ),
              hintText: "Type your free lunch message here",
            ),
            maxLines: 7,
          ),
        ),
      ],
    );
  }
}
