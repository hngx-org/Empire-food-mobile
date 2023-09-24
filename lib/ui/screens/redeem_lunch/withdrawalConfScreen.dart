import 'package:flutter/material.dart';
import 'package:free_lunch_app/providers/auth.dart';
import 'package:free_lunch_app/ui/components/bottom_navigator.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_calculator.dart';
import '../../components/custom_button.dart';
import '../../components/success_bottomSheet.dart';
import '../../widget/withdrwal_details.dart';

class WithdrawalConfirmation extends StatelessWidget {
  final String data; // Define a field to store the argument

  const WithdrawalConfirmation({required this.data});

  Future _submitWithdrawal(context) async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      await authProvider.getUserProfile();
      print(authProvider.name);
    } catch (error) {
      print('Error fetching usernames: $error');
    }
    try {
      if (int.parse(data) > 0) {
        await authProvider.requestWithdrawal(data);
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(sizer(true, 24, context)),
              topRight: Radius.circular(sizer(true, 24, context)),
            ),
          ),
          builder: (context) => const FullQuoteBottomSheet(
            toast: '🎉 Bravo!🎉',
            message:
                'Your redemption request has been granted, and the rewards are on their way to you. Keep up the great work, superstar!"',
            bottomSheetImageUrl: 'images/btmSht2.png',
          ),
        );
      } else {
        showSnackbar(context, Colors.red,
            'Invalid Amount: amount should be greater than 0.');
      }
    } catch (error) {
      showSnackbar(context, Colors.red, 'Something went wrong.');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 23, 23),
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
        title: Text(
          'Withdraw Free Lunches',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: sizer(true, 24, context),
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
            WithdrawalDetails(data: data),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CustomButton(
                height: 59,
                width: 249,
                singleBigButton: true,
                // isTextBig: false,
                color: AppColors.accentPurple5,
                content: 'Withdraw Free Lunches',
                onTap: () {
                  _submitWithdrawal(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
