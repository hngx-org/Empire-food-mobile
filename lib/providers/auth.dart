import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//remember to change to with
class Auth extends ChangeNotifier {
  String? _token;
  int? _userId;
  bool? _isAdmin;
  String? _email;
  String? _password;
  String? _phoneNumber;
  String? _name;
  int? _lunch_credit_balance;

  get phoneNumber => _phoneNumber;
  get name => _name;
  get password => _password;
  get email => _email;
  get isAdmin => _isAdmin;

  get lunch_credit_balance => _lunch_credit_balance;

  final String url = "http://free-lunch.droncogene.com/api/v1/auth/";
  bool get isAuth {
    return _token != null;
  }

  String? get token {
    return null;
  }

  int? get userId {
    return _userId;
  }

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

  Future<bool> setLunchCreditBalance(int value) async {
    _lunch_credit_balance = value;
    notifyListeners();
    return true;
  }

  Future<bool> setUserId(int value) async {
    _userId = value;
    notifyListeners();
    return true;
  }

  Future<bool> setAdmin(bool value) async {
    print('>>>>>>>>>>>>> from ADMIN ADMIN successFUL $value');

    _isAdmin = value;

    notifyListeners();
    return true;
  }

  Future signUp(String email, String password, String firstname,
      String lastname, String phone, String otp) async {
    final response = await http.post(
      Uri.parse(
          'http://free-lunch.droncogene.com/api/v1/organization/staff/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
        "first_name": firstname,
        "last_name": lastname,
        "phone_number": phone,
        "otp_token": otp
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

  Future adminSignUp(String email, String password, String firstname,
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
    final data = responseData['data'];
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

  Future createOrganization(
      String org_name, String lunch, String admin_tok) async {
    print(
        'THE PARSEDDDDDDDDDDDDDD >>>>>>> admin token when creating organisation: $admin_tok');

    String? admin_token = await getString('admin-token');
    print(
        '>>>>>>>>>>>>> token called when creating organisation: $admin_tok');
    try {
      if (admin_token != null) {
        final response = await http.post(
          Uri.parse(
              'http://free-lunch.droncogene.com/api/v1/organization/create'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $admin_tok',
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
    }
  }

  Future<String?> sendOtp(String email) async {
    final response = await http.post(
      Uri.parse(
          'http://free-lunch.droncogene.com/api/v1/user/forget-password?email=$email'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
      },
    );

    final responseData = json.decode(response.body);
    // _token = responseData.access_token;
    print(responseData);
    print(response.statusCode);
    if (response.statusCode == 200) {
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

  Future<String?> sendInvite(String email) async {
    String? access_token = await getString('token');
    print('>>>username accesstoken when on home screen : $access_token');

    if (access_token != null) {
      final response = await http.post(
        Uri.parse(
            'http://free-lunch.droncogene.com/api/v1/organization/invite?email=$email'),
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

    throw Exception('Access token not available'); //
  }

  Future resetPassword(String email, String password, String Otp) async {
    print('>>>>>>email : ${email}');
    print('>>>>>>password : ${password}');
    print('>>>>>>otp : ${Otp}');

    final response = await http.post(
      Uri.parse(
          'http://free-lunch.droncogene.com/api/v1/user/reset-password?email=$email&otp=$Otp&password=$password'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
      },
    );

    final responseData = json.decode(response.body);
    // _token = responseData.access_token;
    print(responseData);
    print(response.statusCode);
    if (response.statusCode == 200) {
      notifyListeners();
      return responseData;

      // print('Post successful');
    } else {
      // Handle the error
      print('Failed to post data: ${response.statusCode}');
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
        return response
            .statusCode; // User is not valid (credentials are incorrect)
      }
    } catch (e) {
      print('Error logging in: $e');
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
        print('>>>Admin when on home screen : ${data["is_admin"]}');
        await setUserId(data["id"]);
        await setAdmin(data["is_admin"] == true ? true : false);
        await saveString("is_admin", data["is_admin"].toString());
        await setName(data["first_name"], data["last_name"]);
        // await setPhoneNumber(data["phone_number"]);
        // await setEmail(data["email"]);
        await setLunchCreditBalance(data["lunch_credit_balance"] as int);

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

  Future requestWithdrawal(amount) async {
    String? access_token = await getString('token');
    print('>>>username accesstoken when on withdrawalScreen : $access_token');
    print('>>>user amount from form : $amount');
    if (amount <= 0) {
      throw Exception('Invalid amount: amount should greater than 0');
    }
    if (access_token != null) {
      final response = await http.post(
        Uri.parse('http://free-lunch.droncogene.com/api/v1/withdrawal/request'),
        headers: <String, String>{
          'Content-Type': 'application/json;',
          'Authorization': "Bearer $access_token",
        },
        body: jsonEncode(<String, String>{
          "amount": amount,
        }),
      );

      final responseData = json.decode(response.body);
      // _token = responseData.access_token;
      print(responseData);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Save the user's name
        // // Retrieve the user's name
        final data = responseData['data']; // Ge

        notifyListeners();
        return data;
      } else {
        // Handle the error
        print('Failed to post data: ${response.statusCode}');
      }
    }
  }

  Future<Map<String, dynamic>> allBanks() async {
    // Retrieve the access_token
    String? access_token = await getString('token');

    if (access_token != null) {
      final response = await http.get(
        Uri.parse('http://free-lunch.droncogene.com/api/v1/user/bank'),
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
        throw Exception('Failed to fetch bank data');
      }
    }

    throw Exception('Access token not available'); // Handle this case as needed
  }

  Future<dynamic> sendLunch(int id, int lunchNumber, String giftMessage) async {
    print('>>>>>>>>>>>>>>>id : $id');
    print('>>>>>>>>>>>>>>>lunchNumber:  $lunchNumber');
    print('>>>>>>>>>>>>>>>giftMessage: $giftMessage');

    String? access_token = await getString('token');
    print('>>>>>>>>>>>>>>>access_token: $access_token');

    if (access_token != null) {
      final response = await http.post(
        Uri.parse('http://free-lunch.droncogene.com/api/v1/lunch/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $access_token",
        },
        body: jsonEncode(<String, String>{
          "note": giftMessage,
          "quantity": "$lunchNumber",
          "receiver_id": "$id"
        }),
      );

      //Hello
      final responseData = json.decode(response.body);
      // _token = responseData.access_token;
      print(responseData);

      if (response.statusCode == 200) {
        notifyListeners();
        return responseData['data'];
        // print('Post successful');
      } else {
        // Handle the error
        print('Failed to post data: ${response.statusCode}');
        // throw HttpException(responseData['details']);
      }
      throw Exception('Failed to send Lunch data');
    }
    throw Exception('Access token not available'); // Handle this case as needed
  }

  Future<Map<String, dynamic>> allLunches() async {
    // Retrieve the access_token
    String? access_token = await getString('token');
    print('>>>access when on home screen : $access_token');
    print('>>>access when on home screen : $access_token');

    if (access_token != null) {
      final response = await http.get(
        Uri.parse('http://free-lunch.droncogene.com/api/v1/lunch/all'),
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
        throw Exception('Failed to fetch bank data');
      }
    }

    throw Exception('Access token not available'); // Handle this case as needed
  }

  Future logout() async {}

  void _autoLogout() {}
}
