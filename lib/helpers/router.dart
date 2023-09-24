import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/screens/admin/InviteCoworkers.dart';
import 'package:free_lunch_app/ui/screens/admin/ViewCoworkers.dart';
import 'package:free_lunch_app/ui/screens/admin/admin_HomeScreen.dart';
import 'package:free_lunch_app/ui/screens/auth/forgot_password.dart';
import 'package:free_lunch_app/ui/screens/auth/login.dart';
import 'package:free_lunch_app/ui/screens/auth/signUp.dart';
import 'package:free_lunch_app/ui/screens/redeem_lunch/withdrawalConfScreen.dart';
import 'package:free_lunch_app/ui/screens/redeem_lunch/withdrawalScreen.dart';
import 'package:free_lunch_app/ui/screens/settings.dart';
import 'package:page_transition/page_transition.dart';

import '../ui/home.dart';
import '../ui/screens/HomeScreen.dart';
import '../ui/screens/admin/home_admin.dart';
import '../ui/screens/auth/reset_password.dart';
import '../ui/screens/bottom_nav_bar/NotifyScreen.dart';
import '../ui/screens/gift_lunch/gift_free_lunch_1.dart';
import '../ui/screens/gift_lunch/gift_free_lunch_2.dart';
import '../ui/screens/gift_lunch/gift_free_lunch_3.dart';
import 'dialog_manager.dart';

class RouteHelper {
  static const String loginRoute = "Login";
  static const String forgotPasswordRoute = "ForgotPassword";
  static const String resetPasswordRoute = "ResetPassword";
  static const String signUpRoute = "SignUp";
  static const String home = "Home";
  static const String adminHome = "Home_Admin";
  static const String homeRoute = "HomeScreen";
  static const String adminHomeRoute = "Admin_HomeScreen";
  static const String adminViewWorkerRoute = "Admin_View_CoWorkers";
  static const String inviteWorkerRoute = "Admin_Invite_CoWorkers";
  static const String giftFreeLunchScreen = "GiftFreeLunchScreen";
  static const String giftFreeLunchScreen2 = "GiftFreeLunchScreen2";
  static const String giftFreeLunchScreen3 = "GiftFreeLunchScreen3";
  static const String notificationsRoute = "NotificationScreen";
  static const String userProfileRoute = "GiftFreeLunchScreen3";
  static const String withdrawalRoute = "WithdrawalScreen";
  static const String withdrawalConfirmRoute = "WithdrawalConfirmScreen";
  static const String settingsRoute = "SettingScreen";

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const Home(),
        );
      case adminHome:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: HomeAdmin(),
        );
      case homeRoute:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const HomeScreen(),
        );
      case adminHomeRoute:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const AdminHomeScreen(),
        );
      case adminViewWorkerRoute:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const ViewCoworkerScreen(),
        );
      case inviteWorkerRoute:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const InviteCoworkerScreen(),
        );

      case giftFreeLunchScreen:
        return _getTransistionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const GiftFreeLunchScreen(),
        );

      case giftFreeLunchScreen2:
        return _getTransistionPageRoute(
          type: PageTransitionType.leftToRight,
          routeName: settings.name!,
          viewToShow: const GiftFreeLunchScreen2(),
        );
      case giftFreeLunchScreen3:
        return _getTransistionPageRoute(
          type: PageTransitionType.leftToRight,
          routeName: settings.name!,
          viewToShow: const GiftFreeLunchScreen3(),
        );

      case loginRoute:
        return _getTransistionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const SignIn(),
        );
      case forgotPasswordRoute:
        return _getTransistionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const ForgotPassword(),
        );
      // case resetPasswordRoute:
      //   return _getTransistionPageRoute(
      //     type: PageTransitionType.rightToLeft,
      //     routeName: settings.name!,
      //     viewToShow: const ResetPassword(email: '',),
      //   );
      case signUpRoute:
        return _getTransistionPageRoute(
          type: PageTransitionType.topToBottom,
          routeName: settings.name!,
          viewToShow: const SignUp(),
        );
      case notificationsRoute:
        return _getTransistionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const NotificationScreen(),
        );
      case withdrawalRoute:
        return _getTransistionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const WithdrawalScreen(),
        );
      case withdrawalConfirmRoute:
        final String withdrawalData = (settings.arguments).toString();
        return _getTransistionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: WithdrawalConfirmation(data: withdrawalData),
        );
      case settingsRoute:
       
        return _getTransistionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: SettingsScreen(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  PageRoute _getPageRoute(
      {required String routeName, required Widget viewToShow}) {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => DialogManager(child: viewToShow));
  }

  PageRoute _getTransistionPageRoute({
    required String routeName,
    required Widget viewToShow,
    PageTransitionType type = PageTransitionType.bottomToTop,
  }) {
    return PageTransition(
        settings: RouteSettings(
          name: routeName,
        ),
        type: type,
        child: DialogManager(child: viewToShow));
  }
}
