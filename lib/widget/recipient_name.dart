import 'package:flutter/material.dart';

enum Lunch { single, double, triple }

class RecipientInfoSection extends StatefulWidget {
  const RecipientInfoSection({super.key});

  @override
  State<RecipientInfoSection> createState() => _RecipientInfoSectionState();
}

class _RecipientInfoSectionState extends State<RecipientInfoSection> {
  Lunch? _character = Lunch.single;
  bool lunch1 = false;
  bool lunch2 = false;
  bool lunch3 = false;
  Color color = const Color(0XFFEBD9FC);
  Color color2 = const Color(0XffF5FAFF);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recipient Name",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
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
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            rowHelper(
              '1 Free Lunch',
              lunch: Lunch.single,
              onChanged: (value) {
                setState(() {
                  _character = value;
                  lunch1 = true;
                  lunch2 = false;
                  lunch3 = false;
                });
              },
              myColor: lunch1 ? color : color2,
            ),
            rowHelper(
              'Double Free Lunch',
              lunch: Lunch.double,
              onChanged: (value) {
                setState(() {
                  _character = value;
                  lunch2 = true;
                  lunch1 = false;
                  lunch3 = false;
                });
              },
              myColor: lunch2 ? color : color2,
            ),
            rowHelper('Triple Free Lunch', lunch: Lunch.triple,
                onChanged: (value) {
              setState(() {
                _character = value;
                lunch2 = false;
                lunch1 = false;
                lunch3 = true;
              });
            }, myColor: lunch3 ? color : color2),
          ],
        ),
        const SizedBox(height: 24.0),
        const Text(
          "Free Lunch Message [Optional]",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0Xff000000),
              width: 12,
            )),
            hintText: "Type your free lunch message here",
          ),
          maxLines: 4,
        ),
      ],
    );
  }

  Widget rowHelper(String text,
      {Lunch? lunch, Function(Lunch?)? onChanged, Color? myColor}) {
    return Expanded(
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
          color: myColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<Lunch?>(
              groupValue: _character,
              activeColor: Colors.black,
              value: lunch,
              onChanged: onChanged,
            ),
            Center(
              child: SizedBox(
                // width: 80,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
