import 'package:carrent/core/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: getApplicationTheme(), // Apply your custom theme here
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('FleetRider')),
          backgroundColor: const Color(0xFFD39632),
        ),
        body: Stack(
          children: [
            // Positioned(
            //   top: 10,
            //   left: 50,
            //   child: Container(
            //     width: 350,
            //     height: 350,
            //     decoration: BoxDecoration(
            //       image: const DecorationImage(
            //         image: AssetImage(
            //             "assets/images/login.png"), // Replace with your image path
            //         fit: BoxFit.cover,
            //       ),
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(20),
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //           color: const Color.fromARGB(66, 192, 200, 120),
            //           blurRadius: 10,
            //           offset: const Offset(2, 2),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 205, 200, 200),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFD39632),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _usernameController,
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      TextFormField(
                                        controller: _passwordController,
                                        obscureText: !_isPasswordVisible,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: const OutlineInputBorder(),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          if (value.length < 6) {
                                            return 'Password must be at least 6 characters';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Navigator.pushNamed(
                                                context, '/home');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFD39632),
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Text('Login'),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/forgot');
                                            },
                                            child: const Text(
                                              'Forgot Password?',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/register');
                                            },
                                            child: const Text(
                                              'Register',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
