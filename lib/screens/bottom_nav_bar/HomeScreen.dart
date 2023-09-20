import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_lunch_app/screens/gift_lunch/gift_free_lunch_2.dart';
import '../../widget/widget.dart';
import '../gift_lunch/gift_free_lunch_1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<String> staffName = [
      'Phorlarjormey',
      'UduaKe',
      'Chinedu',
      'Dorcas',
      'Yetunde'
    ];
    final List<String> roles = [
      'Product Designer',
      'Product Designer',
      'Fullstack Developer',
      'Product Designer',
      'Fullstack Developer'
    ];

    return Scaffold(
      body: Material(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    menuIcon(),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xFF583208),
                        fontSize: 24,
                        fontFamily: 'Tropiline',
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        letterSpacing: 0.24,
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/dummy.png'),
                      radius: 26,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, Alexandra',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Tropiline',
                            fontWeight: FontWeight.w700,
                            height: 0.07,
                            letterSpacing: 0.18,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Would you be giving or withdrawing?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                button(130, 45, const Color(0xFFEDDDFC), 'Your Coworkers'),
                SizedBox(height: 15),
                Column(
                  children: List.generate(staffName.length, (index) {
                    return Container(
                      height: 93,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/dummy.png'),
                                    radius: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        staffName[index],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        roles[index],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              buttonNext(133, 51, Color(0xFFF5FAFF),
                                  'Gift Lunch', context, GiftFreeLunchScreen()),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
