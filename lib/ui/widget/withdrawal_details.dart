import 'package:flutter/material.dart';

class WithdrawalDetails extends StatelessWidget {
  const WithdrawalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 244,
      decoration: BoxDecoration(
        color: const Color(0xFFDEECF6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 20.0, top: 23, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(top: 10.0, bottom: 10),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Amount to Redeem',
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w700,
            //                   color: Color(0xff000000))),
            //           SizedBox(height: 2),
            //           Text('20',
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w500,
            //                   color: Color(0xff000000))),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(right :24),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //         Text('Redemption Method',
            //             style: TextStyle(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w700,
            //                 color: Color(0xff000000))),
            //         Text('Bank Transfer',
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w500,
            //                 color: Color(0xff000000))),
            //       ]),
            //     )
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(top: 10.0, bottom: 10),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Account Name ',
            //               style: TextStyle(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w700,
            //                   color: Color(0xff000000))),
            //           SizedBox(height: 2),
            //           Text('Alexandra Bennett',
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w500,
            //                   color: Color(0xff000000))),
            //         ],
            //       ),
            //     ),
            //     // SizedBox(width: 10,),
            //     Padding(
            //       padding: EdgeInsets.only(right: 45),
            //       child: Column(
            //           children: [
            //         Text('Account Number',
            //             style: TextStyle(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w700,
            //                 color: Color(0xff000000))),
            //         Text('1234567891',
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w500,
            //                 color: Color(0xff000000))),
            //       ]),
            //     )
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(top: 10.0, bottom: 10, ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Bank ',
            //               style: TextStyle(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w700,
            //                   color: Color(0xff000000))),
            //           SizedBox(height: 2),
            //           Text('Kuda',
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w500,
            //                   color: Color(0xff0000005))),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(right: 60.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //         Text('Total Amount',
            //             style: TextStyle(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w700,
            //                 color: Color(0xff000000))),
            //         Text('₦20,000',
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w500,
            //                 color: Color(0xff000000))),
            //       ]),
            //     )
            //   ],
            // ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount to Redeem',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: 0.70,
                        child: Text(
                          '20',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Redemption Method',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: 0.70,
                        child: Text(
                          'Bank Transfer',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: 0.70,
                        child: Text(
                          'Alexandra Bennett',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Number',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: 0.70,
                        child: Text(
                          '1234567891',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),

            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bank',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: 0.70,
                        child: Text(
                          'Kuda',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Opacity(
                        opacity: 0.70,
                        child: Text(
                          '₦20,000',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
