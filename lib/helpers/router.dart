import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../ui/screens/HomeScreen.dart';
import '../ui/screens/bottom_nav_bar/NotifyScreen.dart';
import '../ui/screens/gift_lunch/gift_free_lunch_1.dart';
import '../ui/screens/gift_lunch/gift_free_lunch_2.dart';
import '../ui/screens/gift_lunch/gift_free_lunch_3.dart';
import 'dialog_manager.dart';



class RouteHelper {

  static const String loginRoute = "Login";
  static const String homeRoute = "Home";
  static const String giftFreeLunchScreen = "GiftFreeLunchScreen";
  static const String giftFreeLunchScreen2 = "GiftFreeLunchScreen2";
  static const String giftFreeLunchScreen3 = "GiftFreeLunchScreen3";
  static const String notificationsRoute = "NotificationScreen";
  static const String userProfileRoute = "GiftFreeLunchScreen3";



  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const HomeScreen(),
        );
  
         case giftFreeLunchScreen:
        return _getTransistionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: GiftFreeLunchScreen(),
        );
        
        case giftFreeLunchScreen2:
        return _getTransistionPageRoute(
          type: PageTransitionType.leftToRight,
          routeName: settings.name!,
          viewToShow: GiftFreeLunchScreen2(),
        );
      case giftFreeLunchScreen3:
        return _getTransistionPageRoute(
          type: PageTransitionType.leftToRight,
          routeName: settings.name!,
          viewToShow: GiftFreeLunchScreen3(),
        );
     
      // case loginRoute:
      //   return _getTransistionPageRoute(
      //     type: PageTransitionType.rightToLeft,
      //     routeName: settings.name!,
      //     viewToShow: const LoginPage(),
      //   );
      case notificationsRoute:
        return _getTransistionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: NotificationScreen(),
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
