import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/ui/components/profile_pic.dart';
import 'package:free_lunch_app/ui/widget/widget.dart';
import 'package:free_lunch_app/utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: () {}),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 142,
                margin: EdgeInsets.all(20),
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
                      imageUrl: 'images/dummy.png',
                      innerRadius: 24,
                      outerRadius: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lateef gifted you 3 free lunches.",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Today, 14:02",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                            width: 126,
                            height: 51,
                            isTextBig: true,
                            color: AppColors.accentPurple5,
                            content: 'Redeem Now',
                            onTap: () {}),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 142,
                margin: EdgeInsets.all(20),
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
                      imageUrl: 'images/dummy.png',
                      innerRadius: 24,
                      outerRadius: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You successfully redeemed 20 free lunches. You currently have 100 free lunches left.",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Yesterday, 14:02",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 142,
                margin: EdgeInsets.all(20),
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
                      imageUrl: 'images/dummy.png',
                      innerRadius: 24,
                      outerRadius: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You gifted UduakE 20 free lunches. You currently have 100 free lunches left.",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Yesterday, 14:02",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 142,
                margin: EdgeInsets.all(20),
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
                      imageUrl: 'images/dummy.png',
                      innerRadius: 24,
                      outerRadius: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Tola gifted you 3 free lunches.",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Friday, 14:02",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                  width: 126,
                                  height: 51,
                                  isTextBig: true,
                                  color: AppColors.accentPurple5,
                                  content: 'Redeemed',
                                  onTap: () {}),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
