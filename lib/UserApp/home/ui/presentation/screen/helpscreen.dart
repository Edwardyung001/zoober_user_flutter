import 'package:flutter/material.dart';
import 'package:zooberuserapp/UserApp/home/ui/presentation/screen/ridersafteyfaq.dart';
import 'package:zooberuserapp/constants/colors.dart';
import 'package:zooberuserapp/constants/mediaquery.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'rideinsurancefaq.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    //final double screenHeight = MediaQuery.of(context).size.height;
    final double profileImageSize = screenWidth * 0.15; // 15% of screen width

    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
        title: Text('Help'),
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
              trailing: Icon(Icons.arrow_forward_ios),
            ),

            Divider(
              color: const Color.fromARGB(255, 228, 228, 228),
            ),

            InkWell(
              onTap: () {
                navigateTo(context, Riderinsurancefaq());
              },
              child: _buildSettingsItem(
                  context,
                  Icons.document_scanner_outlined,
                  'Ride Insurance',
                  Color(0xff4CD964)),
            ),
            Divider(color: Color.fromARGB(255, 228, 228, 228)),

            InkWell(
                onTap: () {
                  navigateTo(context, Ridersafteyfaq());
                },
                child: _buildSettingsItem(context, Icons.privacy_tip,
                    'Ride Safety', Color(0xff8F8E94))),
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
