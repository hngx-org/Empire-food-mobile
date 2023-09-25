import 'package:flutter/material.dart';
import 'package:free_lunch_app/helpers/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../components/bottom_navigator.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.text1,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.nunito(
            color: const Color(0xFF583208),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 120,
          child: Column(
            children: [
              Container(
                width: 373,
                height: 57,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 13,
                  right: 16,
                  bottom: 12,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 0,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          notifyIcon(),
                          const SizedBox(width: 10),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              color: Color(0xFF593308),
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 373,
                height: 57,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 13,
                  right: 16,
                  bottom: 12,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 0,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          paswordIcon(),
                          const SizedBox(width: 10),
                          Text(
                            'Change Password',
                            style: TextStyle(
                              color: Color(0xFF593308),
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 373,
                height: 57,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 13,
                  right: 16,
                  bottom: 12,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 0,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          securityIcon(),
                          const SizedBox(width: 10),
                          Text(
                            'Privacy',
                            style: TextStyle(
                              color: Color(0xFF593308),
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 373,
                height: 57,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 13,
                  right: 16,
                  bottom: 12,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 0,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          languageIcon(),
                          const SizedBox(width: 10),
                          Text(
                            'Language and Region',
                            style: TextStyle(
                              color: Color(0xFF593308),
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 373,
                height: 57,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 13,
                  right: 16,
                  bottom: 12,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 0,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          helpIcon(),
                          const SizedBox(width: 10),
                          Text(
                            'Help and Support',
                            style: TextStyle(
                              color: Color(0xFF593308),
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 373,
                height: 57,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 13,
                  right: 16,
                  bottom: 12,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 0,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          aboutIcon(),
                          const SizedBox(width: 10),
                          Text(
                            'About',
                            style: TextStyle(
                              color: Color(0xFF593308),
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteHelper.loginRoute,
                    (route) => false,
                  );
                },
                child: Container(
                  width: 373,
                  height: 57,
                  padding: const EdgeInsets.only(
                    top: 13,
                    left: 13,
                    right: 16,
                    bottom: 12,
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5FAFF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF000000),
                        blurRadius: 0,
                        offset: Offset(4, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            logoutIcon(),
                            const SizedBox(width: 10),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Color(0xFF593308),
                                fontSize: 18,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
