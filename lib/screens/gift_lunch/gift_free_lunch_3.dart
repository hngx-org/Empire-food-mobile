import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/widget.dart';

class GiftFreeLunchScreen3 extends StatefulWidget {
  const GiftFreeLunchScreen3({Key? key}) : super(key: key);

  @override
  State<GiftFreeLunchScreen3> createState() => _GiftFreeLunchScreen3State();
}

class _GiftFreeLunchScreen3State extends State<GiftFreeLunchScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(width: 50),
                  Text(
                    'Gift Free Lunches',
                    style: GoogleFonts.nunito(
                      color: Color(0xFF583208),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 380,
                child: Text(
                  'Double-check, and let\'s make sure you are giving free lunch to the right person.',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 380,
                height: 430,
                decoration: BoxDecoration(
                  color: Color(0xFFDEECF6),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 2),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/dummy.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recipient’s Name',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Opacity(
                                  opacity: 0.70,
                                  child: Text(
                                    'UduakE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Number of Lunches',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Opacity(
                                  opacity: 0.70,
                                  child: Text(
                                    '20',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 340,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Free Lunch Message',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Opacity(
                            opacity: 0.70,
                            child: Text(
                              'Thank you for being an awesome mentor🙏🏾🎉🤩🚀🌷🥳. You just have a way of spreading peace and love when you send a message to the group chat.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonPop(
                    98,
                    51,
                    Color(0xFFF5FAFF),
                    'Cancel',
                    context,
                  ),
                  buttonNext(
                    161,
                    51,
                    Color(0xFFEAD9FC),
                    'Gift Free Lunch',
                    context,
                    GiftFreeLunchScreen3(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
