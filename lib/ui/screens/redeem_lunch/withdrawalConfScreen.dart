import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_button.dart';
import '../../components/success_bottomSheet.dart';
import '../../widget/withdrwal_details.dart';

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
              height: 20,
            ),
            Center(
              child: CustomButton(
                height: 59,
                width: 249,
                isTextBig: false,
                color: AppColors.accentPurple5,
                content: 'Withdraw Free Lunches',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(sizer(true, 24, context)),
                        topRight: Radius.circular(sizer(true, 24, context)),
                      ),
                    ),
                    builder: (context) => FullQuoteBottomSheet(
                      toast: '🎉 Bravo!🎉',
                      message:
                          'Your redemption request has been granted, and the rewards are on their way to you. Keep up the great work, superstar!"',
                      bottomSheetImageUrl: 'images/btmSht2.png',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
