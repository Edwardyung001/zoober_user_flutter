  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zooberuserapp/UserApp/auth/presentation/bloc/auth_bloc.dart';
import 'package:zooberuserapp/UserApp/auth/presentation/screen/signup.dart';
import 'package:zooberuserapp/UserApp/home/ui/presentation/screen/home.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'package:zooberuserapp/utils/custombutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();

  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // Show loading snackbar or indicator
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Signing up...")),
            );
          } else if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            navigateTo(context, HomeScreen());
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
            print("Error: ${state.error}");
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediaQuery.width * 0.08,
              vertical: mediaQuery.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo or Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                      child: Image.asset(
                        'Assets/screenLogo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: mediaQuery.height * 0.05),
                SizedBox(
                  height: mediaQuery.height * 0.4,
                  child: Image.asset('Assets/login.png'),
                ),

                SizedBox(height: mediaQuery.height * 0.05), // Spacer

                // Sign up text
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.07, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.01), // Small spacer

                // Sign up description
                Text(
                  'Login With Phone Number',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.04, // Responsive font size
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.02), // Spacer

                // Phone Number Input Field
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Phone number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.1), // Spacer
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.1), // Spacer

                // Send OTP Button
                InkWell(
                    onTap: () {
                      final phone = phoneController.text.trim();
                      final password = passwordController.text
                          .trim();
                      if (phone.isNotEmpty && phone.isNotEmpty) {
                        context.read<AuthBloc>().add(LoginRequested(
                          phoneNumber: phone,
                          password: password,
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill all fields")),
                        );
                      }
                    },
                    child: custombutton(text: "Send Otp")),
                SizedBox(height: mediaQuery.height * 0.1), // Spacer

                InkWell(
                    onTap: () {
                      navigateTo(context, SignUpScreen());

                    },
                    child: custombutton(text: "SignUp")),

                SizedBox(height: mediaQuery.height * 0.02), // Spacer

                // Privacy Policy Text
                Text(
                  'By continuing, you agree to the Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.035, // Responsive font size
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
