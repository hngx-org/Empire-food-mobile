import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/ui/components/profile_pic.dart';
import 'package:free_lunch_app/utils/colors.dart';

import '../../components/bottom_navigator.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              icon: menuIcon(),
              onPressed: () {},
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF583208),
            fontSize: 24,
            fontFamily: 'Tropiline',
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomButton(
                  width: 115,
                  height: 44,
                  isTextBig: true,
                  color: AppColors.accentPurple5,
                  content: 'This Week',
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 15),
              buildNotificationContainer(
                imageUrl: 'images/dummy.png',
                message: "Lateef gifted you 3 free lunches.",
                time: "Today, 14:02",
                redeemed: true,
              ),
              buildNotificationContainer(
                imageUrl: 'images/dummy.png',
                message:
                    "You successfully redeemed 20 free lunches. You currently have 100 free lunches left.",
                time: "Yesterday, 14:02",
              ),
              buildNotificationContainer(
                imageUrl: 'images/dummy.png',
                message:
                    "You gifted UduakE 20 free lunches. You currently have 100 free lunches left.",
                time: "Yesterday, 14:02",
                redeemed: true,
              ),
              buildNotificationContainer(
                imageUrl: 'images/dummy.png',
                message: "Tola gifted you 3 free lunches.",
                time: "Friday, 14:02",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationContainer({
    required String imageUrl,
    required String message,
    required String time,
    bool redeemed = false,
  }) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 142,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePicture(
            imageUrl: imageUrl,
            innerRadius: 24,
            outerRadius: 24,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 80,
                    child: Text(
                      message,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Flexible(
                  child: Text(
                    time,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(height: 5),
                if (redeemed)
                  CustomButton(
                    width: 126,
                    height: 51,
                    isTextBig: true,
                    color: AppColors.accentPurple5,
                    content: 'Redeemed',
                    onTap: () {},
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
