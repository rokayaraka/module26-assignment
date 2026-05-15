import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';
import 'package:module26assignment/presentation/screens/logIn_screen.dart';
import 'package:module26assignment/presentation/widget/app_background_container.dart';
import 'package:module26assignment/presentation/widget/circle_widget.dart';
import 'package:module26assignment/presentation/widget/glass_effect_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _signUpInProgress = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      body: AppBackgroundContainer(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(top: 80, right: -60, child: circleWidget(180)),
              Positioned(bottom: 150, left: -60, child: circleWidget(130)),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: GlassEffectContainer(
                    
                    child: Form(
                      key: _formkey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Welcome Students',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 40),
                          TextFormField(
                            controller: _emailController,
                             style: TextStyle(color: textfieldInputColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: textFieldIconStringColor,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: textFieldIconStringColor,
                              ),
                              fillColor: textfieldFillColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          // TextFormField(
                          //   controller: _nameController,
                          //   decoration: InputDecoration(
                          //     prefixIcon: Icon(
                          //       Icons.text_fields,
                          //       color: textFieldIconStringColor,
                          //     ),
                          //     hintText: 'Full Name',
                          //     hintStyle: TextStyle(
                          //       color: textFieldIconStringColor,
                          //     ),
                          //     fillColor: textfieldFillColor,
                          //     filled: true,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(25),
                          //       borderSide: BorderSide.none,
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                          // TextFormField(
                          //   controller: _rollController,
                          //   decoration: InputDecoration(
                          //     prefixIcon: Icon(
                          //       Icons.perm_identity,
                          //       color: textFieldIconStringColor,
                          //     ),
                          //     hintText: 'Roll Number',
                          //     hintStyle: TextStyle(
                          //       color: textFieldIconStringColor,
                          //     ),
                          //     fillColor: textfieldFillColor,
                          //     filled: true,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(25),
                          //       borderSide: BorderSide.none,
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                             style: TextStyle(color: textfieldInputColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
                                color: textFieldIconStringColor,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: textFieldIconStringColor,
                              ),
                              fillColor: textfieldFillColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if ((value?.length ?? 0) < 6) {
                                return 'Enter your password with at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _confirmPasswordController,
                             style: TextStyle(color: textfieldInputColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
                                color: textFieldIconStringColor,
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: textFieldIconStringColor,
                              ),
                              fillColor: textfieldFillColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (String? value) {
                              if ((value ?? '') != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed:
                                  _signUpInProgress ? null : _onTapSignUp,
                              child: _signUpInProgress
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Sign Up'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Have an account?',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: _onTapLogIn,
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.purple.shade300,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignUp() async {
    if (_formkey.currentState!.validate()) {
      try {
        _signUpInProgress = true;
        setState(() {});

        final UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            );
        _clearTextfields();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Account Created')));
        log(userCredential.toString());
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        _signUpInProgress = false;
        setState(() {});
      }
    }
  }

  void _onTapLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogInScreen()),
    );
  }

  void _clearTextfields() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();

  }

  @override
  void dispose() {
   _emailController.dispose();
   _passwordController.dispose();
   _confirmPasswordController.dispose();
    super.dispose();
  }
}
