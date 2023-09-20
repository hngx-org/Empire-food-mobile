import 'package:flutter/material.dart';

import '../../widget/free_launch_message.dart';
import '../../widget/free_launches.dart';
import '../../widget/recipient_name.dart';

class FreeGiftScreen extends StatefulWidget {
  const FreeGiftScreen({super.key, required this.staffName});
  final String staffName;

  @override
  State<FreeGiftScreen> createState() => _FreeGiftScreenState();
}

class _FreeGiftScreenState extends State<FreeGiftScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();

  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number.';
    }

    // Use a regular expression to check if the input is a valid number.
    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return 'Please enter a valid number.';
    }

    return null; // Return null if the input is valid.
  }
  //  String? validatedNumber;

  // void _handleSubmittedNumber(String? number) {
  //   setState(() {
  //     validatedNumber = number;
  //   });
  // }
void _saveForm(){
 if (_formKey.currentState!.validate()){
  _formKey.currentState!.save();
 }

}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFF5FAFF),
        appBar: AppBar(
          backgroundColor: const Color(0XFFF5FAFF),
          title: const Text('Gift Free Lunch',
              style: TextStyle(
                fontFamily: 'Nunito',
              )),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please ensure that you provide accurate information in this form to avoid any hiccups in this process.',
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Recipient\'s Name ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Resipient(
                  staffName: widget.staffName,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Number of Free Launches',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: _numberController,
                        validator: _validateNumber,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const FreeLaunchMessage(),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    onTap:_saveForm ,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        color: const Color(0XffEBD9FC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
