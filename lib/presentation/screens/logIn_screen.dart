import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:module26assignment/core/app_colors.dart';
import 'package:module26assignment/presentation/screens/home_screen.dart';
import 'package:module26assignment/presentation/screens/signUp_screen.dart';
import 'package:module26assignment/presentation/widget/app_background_container.dart';
import 'package:module26assignment/presentation/widget/circle_widget.dart';
import 'package:module26assignment/presentation/widget/glass_effect_container.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _logInInProgress = false;

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
                            style: TextStyle(color: onlyWhite),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: textFieldIconStringColor,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: textFieldIconStringColor,
                              ),
                              fillColor: White10,
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

                          TextFormField(
                            controller: _passwordController,
                             style: TextStyle(color: onlyWhite),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.password,
                                color: textFieldIconStringColor,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: textFieldIconStringColor,
                              ),
                              fillColor: White10,
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
                              onPressed: _logInInProgress
                                  ? null
                                  : _onTapLoggedIn,
                              child: _logInInProgress
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Log In'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have any account?",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: _onTapSignUp,
                                child: Text(
                                  'Sign Up',
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

  Future<void> _onTapLoggedIn() async {
    if (_formkey.currentState!.validate()) {
      try {
        _logInInProgress = true;
        setState(() {});

        final UserCredential userCredential = await _firebaseAuth
            .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (predicate) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account Logged In Successfully.')),
        );
        log(userCredential.toString());
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        _logInInProgress = false;
        setState(() {});
      }
    }
  }

  void _onTapSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
