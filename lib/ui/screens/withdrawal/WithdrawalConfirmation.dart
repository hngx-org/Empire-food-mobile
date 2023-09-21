import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/widget/withdrawal_details.dart';

import '../../../utils/colors.dart';
import '../../components/custom_button.dart';

class WithdrawalConfirmation extends StatelessWidget {
  const WithdrawalConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
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
        title: const Text(
          'Withdraw Free Lunches',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.text1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Double-check, and let\'s make sure your rewards land in the right place',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const WithdrawalDetails(),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CustomButton(
                height: 59,
                width: 249,
                isTextBig: false,
                color: AppColors.accentPurple5,
                content: 'Withdraw Free Lunches',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
