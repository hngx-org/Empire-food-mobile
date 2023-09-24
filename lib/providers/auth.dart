import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:free_lunch_app/ui/components/dialog/alert_dialog.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../core/models/http_exception.dart';

//remember to change to with
class Auth extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTimer;
  String? _email;
  String? _password;
  String? _phoneNumber;
  String? _name;

  get phoneNumber => _phoneNumber;
  get name => _name;
  get password => _password;
  get email => _email;

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
  Future<bool> setPhoneNumber(String value) async {
    _phoneNumber = value;
    notifyListeners();
    return true;
  }

  Future<bool> setName(String value, String value2) async {
    _name = value + " " + value2;
    notifyListeners();
    return true;
  }

  Future<bool> setEmail(String value) async {
    _email = value;
    notifyListeners();
    return true;
  }

  Future signUp(String email, String password, String firstname,
      String lastname, String phone) async {
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

    //Hello
    final responseData = json.decode(response.body);
    // _token = responseData.access_token;
    print(responseData);

    if (response.statusCode == 201) {
      notifyListeners();
      // print('Post successful');
    } else {
      // Handle the error
      print('Failed to post data: ${response.statusCode}');
      // throw HttpException(responseData['details']);
    }
  }

  Future adminSignUp (String email, String password, String firstname,
      String lastname, String phone) async {
        try {
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
          "phone_number": phone,

        }),
      );
          final responseData = json.decode(response.body);
      final data = responseData['data'];
      print('>>>>>>>>>>>>> from SIGNUP ADMIN successFUL $data');
      notifyListeners();
       return responseData;
        } catch (e) {
          print('Error signing UP user/admin>>>>> : $e');
                  return SnackBar(
          content: Text(
        'User already exists',
        style: GoogleFonts.nunito(
          fontSize: 16,
          color: AppColors.activeBackground,
          fontWeight: FontWeight.w500,
          backgroundColor: Colors.red,
        ),
      ));
        }
   
      }

    Future adminLogin(String email, String password) async {
      print('>>>>>>Admin email: $email');
      print('>>>>>>>>Admin Password: $password');
    final response = await http.post(
      Uri.parse('${url}login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );
    final responseData = json.decode(response.body);
    final  data = responseData['data'];
      final accessToken = data['access_token'];
      print('>>>>>>>>>>>>> from ADMIN log in SUCCESSFUL  >>>>>$data');
      // clearString('admin-token');
      
      saveString(
        'admin-token',
        accessToken,
      );
      // print('Username: $username');
      notifyListeners();
      return data;

    }

      // print('Post successful');
  

    Future createOrganization(String org_name, String lunch, String admin_tok) async {
      print('THE PARSEDDDDDDDDDDDDDD >>>>>>> admin token when creating organisation: $admin_tok');
      
     String? admin_token = await getString('admin-token');
      print('>>>>>>>>>>>>> token called when creating organisation: $admin_token');
     try {
         if (admin_token != null) {
        final response = await http.post(
          Uri.parse(
              'http://free-lunch.droncogene.com/api/v1/organization/create'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $admin_token',
          },
          body: jsonEncode(<String, String>{
            "organization_name": org_name,
            "lunch_price": lunch,
            "currency_code": "NGN"
          }),
        );

        //Hello
        final responseData = json.decode(response.body);
        // _token = responseData.access_token;
        print('CREATE ORGANISATION SUCESSFUL >>>>>$responseData');
        notifyListeners();
        // print('Post successful');
        return responseData;
      } else {
        print('No token');
      }

     } catch (e) {
     print('Error error creating ORGAINSATION: $e');
    //  displayAlert(
    //       title: 'Error',
    //       content:'${e}',
    //       callToAction: 'Okay...',
    //       success: false,
    //       context: (e)
    //       );
     }
   

  }

  Future<String?> sendOtp(String email) async {
    final response = await http.post(
      Uri.parse('http://free-lunch.droncogene.com/api/v1/user/forget-password?email=$email'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
      },

    );

    final responseData = json.decode(response.body);
    // _token = responseData.access_token;
    print(responseData);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Save the user's name
      // // Retrieve the user's name
      // final data = responseData['data']; // Ge
      //
      // final accessToken = data['access_token'];
      // print('>>>>>>>>>>>>> from log in function$data');

      // print('Username: $username');
      notifyListeners();
      return responseData["message"];

      // print('Post successful');
    } else {
      // Handle the error
      print('Failed to post data: ${response.statusCode}');
      // print(response.body);
      // throw HttpException(responseData['detail']);
    }
  }

  Future resetPassword(String email, String password, String Otp) async {
    print('>>>>>>email : ${email}');
    print('>>>>>>password : ${password}');
    print('>>>>>>otp : ${Otp}');



    final response = await http.post(
      Uri.parse('http://free-lunch.droncogene.com/api/v1/user/reset-password?email=$email&otp=$Otp&password=$password'),
      headers: <String, String>{
        'Content-Type': 'application/json;',

      },

    );

    final responseData = json.decode(response.body);
    // _token = responseData.access_token;
    print(responseData);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Save the user's name
      // // Retrieve the user's name
      // final data = responseData['data']; // Ge


      // print('Username: $username');
      notifyListeners();
      return responseData;

      // print('Post successful');
    } else {
      // Handle the error
      print('Failed to post data: ${response.statusCode}');
      // print(response.body);
      // throw HttpException(responseData['detail']);
    }
  }

  Future login(String email, String password) async {

    try {
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
      print('ResponseDATA : >>>>>> $responseData');
      print(response.statusCode);

      if (response.statusCode == 200) {
        final data = responseData['data'];
        final accessToken = data['access_token'];
        // Save the access token
        saveString('token', accessToken);
        notifyListeners();
        return responseData; // User is valid and logged in successfully
      } else {
        print('Failed to log in: ${response.statusCode}');
        return response.statusCode; // User is not valid (credentials are incorrect)
      }
    } catch (e) {
      print(
        'Error logging in: $e'
      );
    }

  }

  Future getUserProfile() async {
    String? access_token = await getString('token');
    print('>>>username accesstoken when on home screen : $access_token');

    if (access_token != null) {
      final response = await http.get(

        Uri.parse('http://free-lunch.droncogene.com/api/v1/user/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json;',
          'Authorization': "Bearer $access_token",
        },
      );

      final responseData = json.decode(response.body);
      // _token = responseData.access_token;
      print(responseData);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Save the user's name
        // // Retrieve the user's name
        final data = responseData['data']; // Ge
        print('>>>username when on home screen : ${data["first_name"]}');

        setName(data["first_name"], data["last_name"]);
        setPhoneNumber(data["phone_number"]);
        setEmail(data["email"]);

        // print('Username: $username');
        notifyListeners();
        return data;

        // print('Post successful');
      } else {
        // Handle the error
        print('Failed to post data: ${response.statusCode}');
        // print(response.body);
        // throw HttpException(responseData['detail']);
      }
    }
  }

  saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  clearString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<Map<String, dynamic>> allUsers() async {
    // Retrieve the access_token
    String? access_token = await getString('token');
    print('>>>access when on home screen : $access_token');
    print('>>>access when on home screen : $access_token');

    if (access_token != null) {
      final response = await http.get(
        Uri.parse('http://free-lunch.droncogene.com/api/v1/user/all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $access_token",
        },
      );
      final responseData = json.decode(response.body);
      print('>>>>>>>>>>>>>>>$responseData');
      print(response.statusCode);

      if (response.statusCode == 200) {
        notifyListeners();
        return responseData; // Return user data here
      } else {
        // Handle the error
        print('Failed to fetch user data: ${response.statusCode}');
        print(response.body);
        throw Exception('Failed to fetch user data');
      }
    }

    throw Exception('Access token not available'); // Handle this case as needed
  }

  Future logout() async {}

  void _autoLogout() {}
}
