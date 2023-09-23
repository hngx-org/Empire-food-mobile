import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_lunch_app/helpers/router.dart';
import 'package:free_lunch_app/ui/components/cancel_button.dart';
import 'package:free_lunch_app/ui/components/next_button.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GiftFreeLunchScreen extends StatefulWidget {
  const GiftFreeLunchScreen({super.key});

  @override
  State<GiftFreeLunchScreen> createState() => _GiftFreeLunchScreenState();
}

class _GiftFreeLunchScreenState extends State<GiftFreeLunchScreen> {
  String selectedName = '';
  final TextEditingController searchRecipient = TextEditingController();

  final List<String> staffName = [
    'Phorlarjormey',
    'UduaKe',
    'Chinedu',
    'Dorcas',
    'Yetunde',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.text1,
              ),
            );
          },
        ),
        title: Text(
          'Gift Free Lunch',
          style: GoogleFonts.nunito(
            color: const Color(0xFF583208),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when the user taps on the screen
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: Column(
                children: [
                  // SizedBox(height: 20),
                  SizedBox(
                    width: 380,
                    child: Text(
                      'Please select or search for who you would like to give a free lunch to today.',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recipient Name",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        child: SearchBar(
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.all(Radius.circular(8)),
                              side: BorderSide(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                          controller: searchRecipient,
                          hintText: 'Name of free lunch recipient',
                          trailing: const [Icon(Icons.search)],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: List.generate(staffName.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedName = staffName[index];
                              });
                            },
                            child: SizedBox(
                              height: 63,
                              child: Card(
                                color: selectedName == staffName[index]
                                    ? const Color(0xFFEBD9FC)
                                    : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                           CircleAvatar(
                                            backgroundImage:
                                                AssetImage('images/dummy_$index.png'),
                                            radius: 20,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            staffName[index],
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Radio(
                                        value: index,
                                        groupValue:
                                            staffName.indexOf(selectedName),
                                        activeColor: Colors.black,
                                        onChanged: (int? value) {
                                          setState(() {
                                            selectedName = staffName[value ?? 0];
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).map((widget) {
                          return Column(
                            children: [
                              widget,
                              const SizedBox(height: 8),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CancelButton(),
                        const SizedBox(width: 25),
                        NextButton(onTap: () {
                          HapticFeedback.lightImpact();
                            Navigator.pushNamed(
                              context, RouteHelper.giftFreeLunchScreen2);
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
