import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:free_lunch_app/utils/colors.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      barrierColor: Color.fromRGBO(0, 0, 0, 0.3),
      builder: (context) {
        return new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: _FullScreenLoader());
      },
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //  decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0)),
        child: Center(
            child: Platform.isIOS
                ? CupertinoActivityIndicator()
                // : SpinKitRing(
                //     color: redColor,
                //     size: 50.0,
                //     duration: Duration(milliseconds: 500),
                //   )
                : CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.accentPurple5),
                  )));
  }
}
