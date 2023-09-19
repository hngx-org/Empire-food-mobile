import 'package:flutter/material.dart';
import 'package:free_lunch_app/widget/widget.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  menuIcon(),
                  SizedBox(width: 80),
                  Text(
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
                ],
              ),
              SizedBox(height:20),

              
             
            ],
          ),
        ),
      ),
    );
  }
}
