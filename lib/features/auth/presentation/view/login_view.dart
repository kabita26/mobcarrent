import 'package:car_rent/core/common/snackbar/my_snackbar.dart';
import 'package:car_rent/features/auth/presentation/view/register_view.dart';
import 'package:car_rent/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:car_rent/features/home/presentation/view/dashboard_view.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  bool _isPasswordVisible = false;
  String? _errorMessage;

  final _gap = const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Gradient Logo Section
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 8, 45, 109),
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Image.asset(
                  'assets/images/Front-car-pana.png',
                  fit: BoxFit.contain,
                ),
              ),
              // Login Form Section
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'Junge',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 8, 45, 109),
                          ),
                        ),
                        _gap,
                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 8, 45, 109)),
                            labelText: 'Email',
                            hintText: 'abc@gmail.com',
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 242, 255),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                        _gap,
                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 8, 45, 109)),
                            labelText: 'Password',
                            hintText: '********',
                            hintStyle: const TextStyle(color: Colors.blueGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 242, 255),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 8, 45, 109),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        // Error Message
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        const SizedBox(height: 2),
                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Add Forgot Password Navigation
                            },
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 8, 45, 109),
                              ),
                            ),
                          ),
                        ),
                        _gap,
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Color.fromARGB(255, 8, 45, 109),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              elevation: 5,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginUserEvent(
                                        context: context,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    );

                                if (_emailController.text == '' &&
                                    _passwordController.text == '') {
                                  context.read<LoginBloc>().add(
                                        NavigateHomeScreenEvent(
                                          destination: DashboardView(),
                                          context: context,
                                        ),
                                      );
                                } else {
                                  setState(() {
                                    _errorMessage =
                                        'Invalid username or password';
                                  });
                                  showMySnackBar(
                                    context: context,
                                    message: 'Invalid username or password',
                                    color: Colors.red,
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Divider and Signup Link
              Container(
                height: 1,
                color: Colors.grey.shade400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            NavigateRegisterScreenEvent(
                              destination: RegisterView(),
                              context: context,
                            ),
                          );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color.fromARGB(255, 8, 45, 109),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
