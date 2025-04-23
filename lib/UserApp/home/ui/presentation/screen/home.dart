import 'package:flutter/material.dart';
import 'package:zooberuserapp/constants/colors.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'package:zooberuserapp/utils/customdrawer.dart';
import 'locationpicking.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController sourcecontroller = TextEditingController();
  final TextEditingController designationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: buttonrightcolor,
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Colors.white),
          title: Text(
            "Zoober Rider ",
            style: TextStyle(color: Colors.white),
          )),
      key: _scaffoldKey,
      drawer: CustomDrawer(
          userName: "Lokesh Waran",
          onDrawerClose: () {
            Navigator.pop(context);
          }),
      body: Stack(
        children: [
          // Map background image
          SizedBox.expand(
            child: Image.asset(
              "Assets/Map.png",
              fit: BoxFit.cover,
            ),
          ),

          // Current location and search bar
          Positioned(
            top: screenHeight * 0.01,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: _buildSearchBar(screenHeight, screenWidth),
          ),

          // Search result list at the bottom
          Positioned(
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: _buildSearchResults(screenHeight, screenWidth),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(double screenHeight, double screenWidth) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.01),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: screenHeight * 0.02,
              ),
            ],
          ),
          child: TextField(
            controller: sourcecontroller,
            decoration: InputDecoration(
              hintText: 'Your location',
              border: InputBorder.none,
              icon: InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.my_location_sharp,
                    color: buttonrightcolor, size: screenHeight * 0.03),
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.01),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: screenHeight * 0.02,
              ),
            ],
          ),
          child: TextField(
            controller: designationcontroller,
            decoration: InputDecoration(
              hintText: 'Your Destignation',
              border: InputBorder.none,
              icon: InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.pin_drop,
                    color: buttonrightcolor, size: screenHeight * 0.03),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults(double screenHeight, double screenWidth) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.01),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: screenHeight * 0.02,
              ),
            ],
          ),
          child: TextField(
            controller: sourcecontroller,
            decoration: InputDecoration(
              hintText: 'Where are you going?',
              border: InputBorder.none,
              icon: Icon(Icons.search, size: screenHeight * 0.03),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        InkWell(
          onTap: () {
            navigateTo(context, LocationSearchPage());
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenHeight * 0.01),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: screenHeight * 0.02,
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSearchResultItem(
                  icon: Icons.history,
                  title: 'TVS Tolgate',
                  subtitle: 'Trichy, Tamil Nadu, India',
                  screenHeight: screenHeight,
                ),
                _buildSearchResultItem(
                  icon: Icons.history,
                  title: 'Chatram Bus Stand',
                  subtitle: 'Trichy, Tamil Nadu, India',
                  screenHeight: screenHeight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResultItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required double screenHeight,
  }) {
    return ListTile(
      leading: Icon(icon, color: blue, size: screenHeight * 0.03),
      title: Text(title, style: TextStyle(fontSize: screenHeight * 0.02)),
      subtitle:
          Text(subtitle, style: TextStyle(fontSize: screenHeight * 0.015)),
    );
  }
}
