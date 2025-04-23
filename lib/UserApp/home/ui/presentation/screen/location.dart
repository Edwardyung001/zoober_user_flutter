import 'package:flutter/material.dart';
import 'package:zooberuserapp/UserApp/auth/presentation/screen/permission.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'package:zooberuserapp/utils/custombutton.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'Assets/Map1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: height * 0.05,
            left: width * 0.05,
            right: width * 0.05,
            child: Column(
              children: [
                Container(
                  width: width * 0.9, // Adjusts width based on screen size
                  padding: EdgeInsets.symmetric(vertical: width * 0.05),
                  decoration: BoxDecoration(
                    color: Color(0xffFFD428),
                    borderRadius: BorderRadius.circular(width * 0.05),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn(
                        icon: Icons.access_time,
                        value: '20 mins',
                        label: 'Time taken',
                        context: context,
                      ),
                      _buildInfoColumn(
                        icon: Icons.mode_of_travel,
                        value: '16 KM',
                        label: 'Distance',
                        context: context,
                      ),
                      _buildInfoColumn(
                        icon: Icons.money,
                        value: '40 Rs',
                        label: 'Amount',
                        context: context,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, Permission());
                  },
                  child: const custombutton(text: "Ride"),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const custombutton(
                  text: "Cancel Ride",
                  buttoncolor1: Color.fromARGB(255, 202, 202, 202),
                  buttoncolor2: Color.fromARGB(255, 226, 226, 226),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoColumn({
  required IconData icon,
  required String value,
  required String label,
  required BuildContext context,
}) {
  var mediaQuery = MediaQuery.of(context);
  var width = mediaQuery.size.width;

  return Column(
    children: [
      Icon(
        icon,
        size: width * 0.08,
        color: Colors.black,
      ),
      SizedBox(height: width * 0.02),
      Text(
        value,
        style: TextStyle(
          fontSize: width * 0.05,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: width * 0.01),
      Text(
        label,
        style: TextStyle(
          fontSize: width * 0.035,
          color: Colors.black54,
        ),
      ),
    ],
  );
}
