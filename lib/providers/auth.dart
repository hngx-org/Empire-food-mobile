import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopapp/models/http_exception.dart';

//remember to change to with
class Auth extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTimer;
  final String _api_key =
      "AIzaSyBOCeSkckZZoldHaJMkRXwP0tfrWHy4MI0"; //enter your firebase api key here

  bool get isAuth {
    return _token != null;
  }

  String? get token {}

  String? get userId {
    return _userId;
  }

  // Future<void> _authenticated(

  // }

  Future<void> signUp(String email, String password, String firstname,
      String lastname, String phone) async {
    final response = await http.post(
      Uri.parse('http://free-lunch.droncogene.com/api/v1/auth/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
        "first_name": firstname,
        "last_name": lastname,
        "phone_number": phone
      }),
    );

    //Hello

    final responseData = json.decode(response.body);
    print(responseData);

    if (response.statusCode == 201) {
      notifyListeners();
      print('Post successful');
    } else {
      // Handle the error
      print('Failed to post data: ${response.statusCode}');
    }
  }

  Future<void> login(String email, String password) async {}

  // Future<bool> tryAutoLogin() async {}

  Future<void> logout() async {}

  void _autoLogout() {}
}
