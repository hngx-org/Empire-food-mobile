import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/full_button.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/size_calculator.dart';

displayAlert(
    {String title = '',
    String content = '',
    String callToAction = '',
    bool success = true,
    required BuildContext context,
    Widget? nairaContent,
    bool useNairaContent = false}) {
  // set up the AlertDialog
//  AlertDialog alert = ;

  return showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(

        insetPadding: EdgeInsets.symmetric(
            horizontal: sizer(true, 10, context), vertical: 24.0),
        contentPadding: EdgeInsets.symmetric(
          horizontal: sizer(true, 10, context),
          vertical: sizer(false, 17, context),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: sizer(true, 13, context),
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: sizer(false, 10, context),
            ),
            Text(
              content,
              style: TextStyle(
                fontSize: sizer(true, 13, context),
                color: AppColors.text1,
                fontWeight: FontWeight.w400,
                height: sizer(true, 1.5, context),
              ),
            ),
            SizedBox(
              height: sizer(false, 10, context),
            ),
            FullButton(
                buttonText: callToAction,
                buttonFunction: () async {
                  Navigator.pop(context);
                })
          ],
        ),
      );


    },
  );
}
