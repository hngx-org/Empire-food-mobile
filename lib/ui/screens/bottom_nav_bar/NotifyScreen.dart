import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/custom_button.dart';
import 'package:free_lunch_app/ui/components/profile_pic.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth.dart';
import '../../components/bottom_navigator.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    print('ENTERING THE LUNCHES NOWW!!>>>>>>');

    _fetchLunches(); // Call the async function from initState
  }

  List lunchesData = [];

  Future _fetchLunches() async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      final lunchData = await authProvider.allLunches();
      setState(() {
        lunchesData = lunchData['data'];
      });
    } catch (error) {
      // Handle any exceptions here.
      print('Error fetching users: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context, listen: false);

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
        title: const Text(
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
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
              Column(
                children: List.generate(lunchesData.length, (index) {
                  final user = lunchesData[index];
                  return buildNotificationContainer(
                    sender: "${user["receiver_id"]}" == authProvider.userId.toString()
                        ? true : false,
                    color: "${user["receiver_id"]}" == authProvider.userId.toString()
                        ? AppColors.lightGrey : AppColors.cardBackground,
                    imageUrl: 'images/dummy_6.png',
                    message: '${user["note"]}',
                    time: "${user["created_at"]}",
                    redeemed: "${user["redeemed"]}" == "true" ? false : true,
                  );
                }),
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
    required Color color,
    required bool sender ,
    bool redeemed = false,
  }) { return
     Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 142,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !sender ? ProfilePicture(
            imageUrl: imageUrl,
            innerRadius: 24,
            outerRadius: 24,
          ): SizedBox(),
          const SizedBox(width: 10),
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
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    time,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 5),
                  CustomButton(
                    width: 126,
                    height: 51,
                    isTextBig: true,
                    color: AppColors.accentPurple5,
                    content: redeemed ? 'Redeem' : "Redeemed",
                    onTap: () {},
                  ),
              ],
            ),
          ),
          sender ? ProfilePicture(
            imageUrl: imageUrl,
            innerRadius: 24,
            outerRadius: 24,
          ): SizedBox(),
        ],
      ),
    );
  }
}
