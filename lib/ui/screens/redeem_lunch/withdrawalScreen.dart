import 'package:flutter/material.dart';
import 'package:free_lunch_app/providers/auth.dart';
import 'package:provider/provider.dart';

import '../../../helpers/router.dart';
import '../../../utils/colors.dart';
import '../../components/cancel_button.dart';
import '../../components/next_button.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  String? _selectedBank = '';
  String? _selectedTransferMode = '';
  String? _selectedCountry = '';

  final List<String> _banks = [
    'kuda',
    'Opay',
    'GTbank',
    'UBA',
  ];
  final List<String> _paymentMode = [
    'Bank Tansfer',
    'Payapal',
  ];
  final List<String> _country = [
    'Nigeria',
    'Ghana',
    'Togo',
    'Kenya',
    'South-Africa'
  ];

  var amount = TextEditingController();

  void submitWithrawalRequest() async {
    final authProvider = Provider.of<Auth>(context, listen: false);
    try {
      await authProvider.requestWithdrawal(
        amount.text,
      );
    } catch (error) {}
  }

  void initState() {
    super.initState();
    print('ENTERING THE Withdraw Screen NOWW!!>>>>>>');

    _fetchBanks(); // Call the async function from initState
  }

  List banksData = [];

  Future _fetchBanks() async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      await authProvider.allBanks();
    } catch (error) {
      print('Error fetching banks: $error');
    }
    try {
      final userData = await authProvider.allUsers();
      setState(() {
        banksData = userData['data'];
      });
    } catch (error) {
      // Handle any exceptions here.
      print('Error fetching users: $error');
    }
  }

  // Store the selected item
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.text1,
                ),
              );
            },
          ),
          title: const Text(
            'Withdraw Free Lunches',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.text1),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Please ensure that you provide accurate information in this form to avoid any hiccups in this process.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Amount to Redeem',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: amount,
                decoration: InputDecoration(
                  // labelText: '20',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('10 🍕 = ₦1,000'),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Country',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 380,
                child: Container(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.TextFieldBorderColor, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    hint: const Center(
                        child: Text(
                      'Please select your country of residence',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )), // Hint text for the dropdown

                    value:
                        _selectedCountry!.isNotEmpty ? _selectedCountry : null,
                    items: _country
                        .map((String transferMode) => DropdownMenuItem<String>(
                              value: transferMode,
                              child: Text(
                                transferMode,
                                style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountry =
                            newValue!; // Update the selected item
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Redemption Method',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 380,
                child: Container(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.TextFieldBorderColor, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    hint: const Center(
                        child: Text(
                      'Please select your Payment mode',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )), // Hint text for the dropdown

                    value: _selectedTransferMode!.isNotEmpty
                        ? _selectedTransferMode
                        : null,
                    items: _paymentMode
                        .map((String transferMode) => DropdownMenuItem<String>(
                              value: transferMode,
                              child: Text(
                                transferMode,
                                style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTransferMode =
                            newValue!; // Update the selected item
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Account Name',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  // labelText: '20',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Account Number',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  // labelText: '20',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Bank',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 380,
                child: Container(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.TextFieldBorderColor, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    hint: const Center(
                        child: Text(
                      'Please select your Bank Name',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )), // Hint text for the dropdown

                    value: _selectedBank!.isNotEmpty ? _selectedBank : null,
                    items: _banks
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBank = newValue!; // Update the selected item
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CancelButton(),
                  const SizedBox(width: 25),
                  NextButton(onTap: () {
                    print(amount.text);
                    Navigator.pushNamed(
                      context,
                      RouteHelper.withdrawalConfirmRoute,
                      arguments: amount.text,
                    );
                  }),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
