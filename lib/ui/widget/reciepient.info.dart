import 'package:flutter/material.dart';

import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

enum Lunch { single, double, triple }

class RecipientInfoSection extends StatefulWidget {
  const RecipientInfoSection({super.key});

  @override
  State<RecipientInfoSection> createState() => _RecipientInfoSectionState();
}

class _RecipientInfoSectionState extends State<RecipientInfoSection> {
  Lunch _category = Lunch.single;
  // bool isSelected = true;
  bool lunch1 = true;
  bool lunch2 = false;
  bool lunch3 = false;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recipient Name",
          style: GoogleFonts.nunito(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/dummy.png'),
              ),
              const SizedBox(width: 10),
              Text(
                'UduakE',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 0.06,

                ),
                SizedBox(width: 10),
                Text(
                  'UduakE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: lunchNumbers.map((number) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLunch = number;
                    });
                  },
                  child: Container(
                    width: 114.67,
                    height: 78,
                    padding: EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: selectedLunch == number
                          ? Color(0xFFEBD9FC)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadows: [
                        selectedLunch == number
                            ? BoxShadow(
                                color: Color(0xFF000000),
                                blurRadius: 0,
                                offset: Offset(2, 4),
                                spreadRadius: 0,
                              )
                            : BoxShadow()
                      ],
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            number,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -15,
                          right: -15,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Radio(
                              value: number,
                              groupValue: selectedLunch,
                              activeColor: Colors.black,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedLunch = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).map((widget) {
                return Row(
                  children: [
                    widget,
                    SizedBox(width: 8),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          "Number of Free Lunches",
          style: GoogleFonts.nunito(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            _buildLunch(
              lunch: Lunch.single,
              onChanged: (value) {
                setState(() {
                  _category = value!;
                  lunch1 = true;
                  lunch2 = false;
                  lunch3 = false;
                });
              },
              myColor: lunch1 ? AppColors.accentPurple5 : null,
              text: '1 Free\n Lunch',
            ),
            _buildLunch(
              lunch: Lunch.double,
              onChanged: (value) {
                setState(() {
                  _category = value!;
                  lunch1 = false;
                  lunch2 = true;
                  lunch3 = false;
                });
              },
              myColor: lunch2 ? AppColors.accentPurple5 : null,
              text: 'Double Free Lunch',
            ),
            _buildLunch(
              lunch: Lunch.triple,
              onChanged: (value) {
                setState(() {
                  _category = value!;
                  lunch1 = false;
                  lunch2 = false;
                  lunch3 = true;
                });
              },
              myColor: lunch3 ? AppColors.accentPurple5 : null,
              text: 'Tripple Free Lunch',
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        const Text(
          "Free Lunch Message (Optional)",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.brown,
                width: 12,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 3,
              ), // Set the border color to pink
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 3,
              ), // Set the border color to pink
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "Type your free lunch message here",
          ),
        ],
      ),
    );
  }

  Widget _buildLunch(
      {Lunch? lunch,
      Function(Lunch?)? onChanged,
      String? text,
      Color? myColor}) {
    return Expanded(
      child: Container(
          height: 120,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: myColor,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Radio<Lunch?>(
                activeColor: AppColors.black,
                value: lunch,
                groupValue: _category,
                onChanged: onChanged,
              ),
              SizedBox(
                // width: 90,
                child: Center(
                  child: Text(
                    text!,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
