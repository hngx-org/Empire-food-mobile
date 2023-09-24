import 'package:flutter/material.dart';
import 'package:free_lunch_app/providers/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../helpers/router.dart';
import '../../../utils/colors.dart';
import '../../components/admin_home_card.dart';
import '../../components/bottom_navigator.dart';
import '../../components/custom_button.dart';
import '../../components/profile_pic.dart';
import '../gift_lunch/gift_free_lunch_2.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({
    super.key,
  });

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    super.initState();
    print('ENTERING THE HOME NOWW!!>>>>>>');

    _fetchUsers(); // Call the async function from initState
  }

  List usersData = [];

  Future _fetchUsers() async {
    final authProvider = Provider.of<Auth>(context, listen: false);

    try {
      await authProvider.getUserProfile();
    } catch (error) {
      print('Error fetching usernames: $error');
    }
    try {
      final userData = await authProvider.allUsers();
      setState(() {
        usersData = userData['data'];
      });
    } catch (error) {
      // Handle any exceptions here.
      print('Error fetching users: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: menuIcon(),
              onPressed: () {},
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.nunito(
            color: const Color(0xFF583208),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.24,
          ),
        ),
        actions: [
          IconButton(
            icon: searchIcon(),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfilePicture(
                  imageUrl: 'images/dummy_6.png',
                  outerRadius: 26,
                  innerRadius: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  'Welcome, ${Provider.of<Auth>(context, listen: true).name}',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                    letterSpacing: 0.18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    width: 160,
                    height: 45,
                    isTextBig: false,
                    color: AppColors.accentPurple5,
                    content: 'YOUR COWORKERS',
                    onTap: () {}),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteHelper.adminViewWorkerRoute);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'SEE ALL',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.18,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            usersData.isEmpty
                ?  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height * 0.2),
                   const Center(
                        child: Text('No Co-workers added to the firm yet!!! 😃'),
                      ),
                  ],
                )
                :
            Column(
              children:List.generate(usersData.length, (index) {
                final user = usersData[index];
                return AdminHomeCard(
                  staffName: '${user['first_name']} ${user['last_name']}',
                  roles: 'User Role',
                  imageUrl: 'images/dummy_$index.png',
                  onTap: (selectedItem) {
                    if (selectedItem == 'Gift Lunch') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              GiftFreeLunchScreen2(user: user)));
                    } else if (selectedItem == 'Delete Profile') {
                      // Handle 'Delete Profile' action
                    }
                  },
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
