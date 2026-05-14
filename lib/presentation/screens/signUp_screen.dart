import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';
import 'package:module26assignment/presentation/widget/circle_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: containerGradient,
          ),
        ),
        child: Stack(
          children: [
            Positioned(top: 80, right: -60, child: circleWidget(180)),
            Positioned(bottom: 150, left: -60, child: circleWidget(130)),

            Center(
              child: Container(
                height: 600,
                width: 320,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: containerBorderColor),
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome Stdents',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: textFieldIconStringColor,
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: textFieldIconStringColor),
                        fillColor: textfieldFillColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.text_fields,
                          color: textFieldIconStringColor,
                        ),
                        hintText: 'FullName',
                        hintStyle: TextStyle(color: textFieldIconStringColor),
                        fillColor: textfieldFillColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _rollController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.perm_identity,
                          color: textFieldIconStringColor,
                        ),
                        hintText: 'Roll Number',
                        hintStyle: TextStyle(color: textFieldIconStringColor),
                        fillColor: textfieldFillColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: textFieldIconStringColor,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: textFieldIconStringColor),
                        fillColor: textfieldFillColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? value) {
                        if ((value?.length ?? 0) < 5) {
                          return 'enter your password atleast 6 latters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: textFieldIconStringColor,
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: textFieldIconStringColor),
                        fillColor: textfieldFillColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (String? value) {
                        if ((value ?? '') != _passwordController.text) {
                          return "Doesn,t match with password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(25),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Sign Up'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned(
            //   bottom: 80,
            //  left: 60,
            //   child: ),
          ],
        ),
      ),
    );
  }

  void _clearTextfields() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _nameController.clear();
    _rollController.clear();
  }
}
