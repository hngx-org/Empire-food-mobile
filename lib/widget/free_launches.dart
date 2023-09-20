import 'package:flutter/material.dart';

class NumberOfFreeLauncheNumber extends StatefulWidget {
  const NumberOfFreeLauncheNumber({
    super.key,
    required this.onValidate,
  });
  final Function(String?) onValidate;

  @override
  State<NumberOfFreeLauncheNumber> createState() =>
      _NumberOfFreeLauncheNumberState();
}

class _NumberOfFreeLauncheNumberState extends State<NumberOfFreeLauncheNumber> {
  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
            validator: widget.onValidate(_numberController.text),
            keyboardType: TextInputType.number,
            initialValue: '0',
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
