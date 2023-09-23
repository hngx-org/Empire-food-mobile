import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

//remember to change to with
class Auth extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTimer;
  final String url = "http://free-lunch.droncogene.com/api/v1/auth/";
  bool get isAuth {
    return _token != null;
  }

  String? get token {
    return null;
  }

  String? get userId {
    return _userId;
  }

  // Future<void> _authenticated(

  // }

  Future<void> signUp(
    String email,
    String password,
    String firstname,
    String lastname,
    String phone,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Email and password are required.");
    }

    final response = await http.post(
      Uri.parse('${url}user/signup'),
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

    final responseData = json.decode(response.body);
    print(responseData);

    if (response.statusCode == 200 && responseData['statusCode'] == 201) {
      notifyListeners();
    } else {
      if (response.statusCode == 401 ||
          (response.statusCode >= 403 && response.statusCode <= 455)) {
        final errorDetail = responseData['detail'];
        throw Exception("Invalid credentials. ${errorDetail}");
      } else if (response.statusCode == 500) {
        throw Exception("Server error. Please try again later.");
      } else {
        throw Exception("An error occurred. Please try again.");
      }
    }
  }

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://free-lunch.droncogene.com/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    final responseData = json.decode(response.body);
    print(responseData);
    print(response.statusCode);
    final data = responseData['data'];
    if (response.statusCode == 200) {
      final accessToken = data['access_token'];
      saveString('token', accessToken);
      print("access token: $accessToken");
      notifyListeners();
    } else {
      // Handle the error based on the response status code and the error message from the server.
      if (response.statusCode == 401 ||
          (response.statusCode >= 403 && response.statusCode <= 455)) {
        final errorDetail = responseData['detail'];
        // print(errorDetail);
        throw Exception("Invalid credentials. ${errorDetail}");
      } else if (response.statusCode == 500) {
        throw Exception("Server error. Please try again later.");
      } else {
        throw Exception("An error occurred. Please try again.");
      }
    }
  }

  void saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<List<Map<String, dynamic>>> allUsers() async {
    // Retrieve the access_token
    String? access_token = await getString('token');

    if (access_token != null) {
      final response = await http.get(
        Uri.parse('http://free-lunch.droncogene.com/api/v1/user/all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'access-token': access_token,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final List<dynamic> users = responseData['data'];

        final List<Map<String, dynamic>> userList =
            users.cast<Map<String, dynamic>>();
        return userList;
      } else {
        // Handle the error
        print('Failed to fetch user data: ${response.statusCode}');
        print(response.body);
        throw Exception('Failed to fetch user data');
      }
    }

    throw Exception('Access token not available'); // Handle this case as needed
  }

  Future<void> logout() async {}

  void _autoLogout() {}
}
