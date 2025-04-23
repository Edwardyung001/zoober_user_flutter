import 'package:flutter/material.dart';
import 'package:zooberuserapp/UserApp/home/ui/presentation/screen/myaccount.dart';
import 'package:zooberuserapp/constants/colors.dart';
import 'package:zooberuserapp/constants/mediaquery.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'package:zooberuserapp/utils/custombutton.dart';
import 'favouriteslist.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    //final double screenHeight = MediaQuery.of(context).size.height;
    final double profileImageSize = screenWidth * 0.15; // 15% of screen width
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            ListTile(
              leading: CircleAvatar(
                radius: profileImageSize / 2,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-photo/3d-style-avatar-profile-picture-featuring-male-character-generative-ai_739548-13626.jpg"), // Replace with actual image asset
              ),
              title: Text(
                'Lokesh waran',
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              subtitle: Text(
                'Gold Member',
                style: TextStyle(fontSize: screenWidth * 0.035),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            SizedBox(
              height: height(0.028, context),
            ),
            InkWell(
              onTap: () {
                navigateTo(context, ProfileEditPage());
              },
              child: _buildSettingsItem(
                  context, Icons.person_outline, 'Profile', Color(0xffFF9500)),
            ),
            Divider(
              color: const Color.fromARGB(255, 228, 228, 228),
            ),

            InkWell(
              onTap: () {
                navigateTo(context, FavoritesListScreen());
              },
              child: _buildSettingsItem(context, Icons.favorite_border_outlined,
                  'Favourite', Color(0xff4CD964)),
            ),
            Divider(color: Color.fromARGB(255, 228, 228, 228)),

            _buildSettingsItem(
                context, Icons.privacy_tip, 'About', Color(0xff8F8E94)),
            Divider(color: Color.fromARGB(255, 228, 228, 228)),

            _buildSettingsItem(context, Icons.logout_outlined, 'Logout',
                Color.fromARGB(255, 238, 217, 33)),
            Divider(color: Color.fromARGB(255, 228, 228, 228)),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: white,
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: DeleteAccount(),
                    );
                  },
                );
              },
              child: _buildSettingsItem(context, Icons.delete_outline,
                  'Delete Account', Color(0xffFF2D55)),
            ),
            Divider(color: Color.fromARGB(255, 228, 228, 228)),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, IconData icon, String title, Color bgcolor) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(height(0.01, context))),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              size: screenWidth * 0.07,
              color: white,
            ),
          )),
      title: Text(
        title,
        style: TextStyle(fontSize: screenWidth * 0.045),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      // onTap: () {
      //   if (title == "Vehicle Management") {
      //     navigateTo(context, VehicleManagementPage());
      //   } else if (title == "Document Management") {
      //     navigateTo(context, DocumentManagementPage());
      //   }
      //},
    );
  }
}

class DeleteAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: Colors.grey,
              thickness: 3,
              indent: MediaQuery.of(context).size.width * 0.4,
              endIndent: MediaQuery.of(context).size.width * 0.4,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Are you want to delete your account ?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity,
                child: custombutton(
                  text: "Delete",
                  buttoncolor1: Color.fromARGB(255, 250, 226, 11),
                  buttoncolor2: Color.fromARGB(255, 250, 226, 11),
                )),
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity, child: custombutton(text: "Go Back")),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

void deliverylocation() {
  for (var i = 0; i < 1; i++) {
    print("enteringggg");
    if (i == 5) {
      print("goback");
    } else {
      i = 5;
      if (i == 6) {
        print("return recursive");
      } else {
        i = 7;
      }
      if (i == 0) {
        print("return1");
      } else {
        print("deliver");
      }
      for (var i = 0; i < 56; i++) {
        print("return3");
        for (var j = 5; j < 5; j++) {}
      }
    }
  }
}
