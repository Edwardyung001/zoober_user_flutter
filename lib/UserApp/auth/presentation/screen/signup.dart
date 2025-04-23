import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zooberuserapp/UserApp/auth/presentation/bloc/auth_bloc.dart';
import 'package:zooberuserapp/UserApp/auth/presentation/screen/login.dart';
import 'package:zooberuserapp/constants/routing.dart';
import 'package:zooberuserapp/utils/custombutton.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
          } else if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            navigateTo(context, LoginScreen());
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
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                      child: Image.asset('Assets/screenLogo.png'),
                    ),
                  ],
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                // Illustration
                SizedBox(
                  height: mediaQuery.height * 0.35,
                  child: Image.asset('Assets/signup.png'),
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.01),
                Text(
                  'Sign up with Email and Phone Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.04,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.04),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.04),

                /// ⏩ Custom SIGN UP button with BLoC
                InkWell(
                  onTap: () {
                    final email = emailController.text.trim();
                    final phone = phoneController.text.trim();
                    final name = nameController.text
                        .trim(); // You can customize this as needed
                    final password = passwordController.text
                        .trim(); // You can customize this as neededed
                    if (email.isNotEmpty && phone.isNotEmpty) {
                      context.read<AuthBloc>().add(SignupRequested(
                            name: name,
                            email: email,
                            phoneNumber: phone,
                            password: password,
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all fields")),
                      );
                    }
                  },
                  child: custombutton(text: "SIGN UP"),
                ),

                SizedBox(height: mediaQuery.height * 0.02),
                Text(
                  'By continuing, you agree to the Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.035,
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
