import 'package:flutter/material.dart';

import 'dialog_request.dart';
import '../ui/components/full_button.dart';
import '../utils/colors.dart';
import '../utils/size_calculator.dart';


class FloatingDialogCard extends StatelessWidget {
  final DialogRequest request;
  final VoidCallback dismissDialog;

  const FloatingDialogCard({
    Key? key,
    required this.request,
    required this.dismissDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(height: 80),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizer(true, 10, context),
              vertical: sizer(false, 14, context),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                      request.title,
                      style: TextStyle(
                        fontSize: sizer(true, 13, context),
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: sizer(false, 10, context),
                    ),
                  ],
                ),
                Text(
                  request.message,
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
                    buttonText: "Okay",
                    buttonFunction: () {
                      dismissDialog;
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
