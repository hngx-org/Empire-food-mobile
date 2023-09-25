import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipientInfoSection extends StatefulWidget {
  const RecipientInfoSection( {Key? key ,required this.user, required this.callback}) : super(key: key);
   final Map<String, dynamic> user;
  final void Function(dynamic) callback;

  @override
  State<RecipientInfoSection> createState() => _RecipientInfoSectionState();
}

class _RecipientInfoSectionState extends State<RecipientInfoSection> {
  var messageController = TextEditingController();
  String selectedLunch = '1 Free Lunch';
  List<String> lunchNumbers = [
    '1 Free Lunch',
    'Double Free Lunch',
    'Triple Free Lunch'
  ];
  String selectedName = '';
  String? freeLunchMessage;
  int lunchNumber = 1;

  void sendDataToParent() {
    var data = {
      "message" : freeLunchMessage ?? "",
      "lunchNumber" : lunchNumber,
    };
    widget.callback(data); // Call the callback function to send data to the parent
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recipient Name",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/dummy_2.png'),
                ),
                SizedBox(width: 10),
                Text(
                  "${widget.user["first_name"]}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "Number of Free Lunches",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: lunchNumbers.map((number) {
                int index = lunchNumbers.indexOf(number); // Get the index of the current item

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLunch = number;
                      lunchNumber = index + 1;
                      sendDataToParent();
                    });
                  },
                  child: Container(
                    width: 114.67,
                    height: 78,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: selectedLunch == number
                          ? const Color(0xFFEBD9FC)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            number,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -15,
                          right: -15,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Radio(
                              value: number,
                              groupValue: selectedLunch,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedLunch = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            "Free Lunch Message (Optional)",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 120,
            child: TextFormField(
              controller: messageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.brown,
                  ),
                ),
                hintText: "Type your free lunch message here",
              ),
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  freeLunchMessage = value;
                  sendDataToParent();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
