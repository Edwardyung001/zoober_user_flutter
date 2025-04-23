import 'package:flutter/material.dart';
import 'package:zooberuserapp/UserApp/home/ui/presentation/screen/home.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'package:zooberuserapp/utils/custombutton.dart';

class Permission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuery.width * 0.08,
            vertical: mediaQuery.height * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
    
              SizedBox(
                height: mediaQuery.height * 0.4,
                child: Image.asset('Assets/location.png'),
              ),

              SizedBox(height: mediaQuery.height * 0.05),

  
              Text(
                'Location Permission',
                style: TextStyle(
                  fontSize: mediaQuery.width * 0.06, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: mediaQuery.height * 0.01),

              // Sign up description
              Text(
                'Sharing Location permission helps us improve your ride booking and pickup experience',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mediaQuery.width * 0.035,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: mediaQuery.height * 0.15),
              InkWell(
                  onTap: () {
                    navigateTo(context, HomeScreen());
                  },
                  child: const custombutton(text: "Allow Permission")),
              SizedBox(height: mediaQuery.height * 0.015),

              const custombutton(
                text: "Enter Pickup Manually",
                buttoncolor1: Color.fromARGB(255, 202, 202, 202),
                buttoncolor2: Color.fromARGB(255, 226, 226, 226),
              )
            ],
          ),
        ),
      ),
    );
  }
}
