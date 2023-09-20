import 'package:flutter/material.dart';
import 'package:free_lunch_app/widget/widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
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
               const   SizedBox(width: 80),
               const   Text(
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

              
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ListTile(
                      title: const Text('Lateef gifted you 3 free lunches.'),
                      subtitle: const Text('Today, 14:02'),
                      trailing: IconButton(
                        icon: const Icon(Icons.redeem),
                        onPressed: () {},
                      ),
                    );
                  } else if (index == 1) {
                    return const ListTile(
                      title: Text(
                          'You successfully redeemed 20 free lunches. You currently have 100 free lunches left.'),
                      subtitle: Text('Yesterday, 14:02'),
                    );
                  } else if (index == 2) {
                    return const ListTile(
                      title: Text(
                          'You gifted UduakE 20 free lunches. You currently have 100 free lunches left.'),
                      subtitle: Text('Yesterday, 14:02'),
                    );
                  } else {
                    return const ListTile(
                      title: Text('Tola gifted you 3 free lunches.'),
                      subtitle: Text('Friday, 14:02'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
