// import 'dart:io';
// import 'package:car_rent/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:car_rent/features/auth/presentation/view/login_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _gap = const SizedBox(height: 16);
//   final _key = GlobalKey<FormState>();

//   // TextEditingControllers for input fields
//   final _emailController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   // Image picker logic
//   File? _img;
//   Future _browseImage(ImageSource imageSource) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageSource);
//       if (image != null) {
//         setState(() {
//           _img = File(image.path);
//           // Send image to server
//           context.read<RegisterBloc>().add(UploadImage(file: _img!));
//         });
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   // Handle Camera Permission Request
//   Future<void> checkCameraPermission() async {
//     if (await Permission.camera.request().isRestricted ||
//         await Permission.camera.request().isDenied) {
//       await Permission.camera.request();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Register User',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 8, 45, 109),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Form(
//               key: _key,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Image Picker Section
//                   InkWell(
//                     onTap: () {
//                       showModalBottomSheet(
//                         backgroundColor: Colors.white,
//                         context: context,
//                         isScrollControlled: true,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.vertical(top: Radius.circular(20)),
//                         ),
//                         builder: (context) => Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   checkCameraPermission();
//                                   _browseImage(ImageSource.camera);
//                                   Navigator.pop(context);
//                                 },
//                                 icon: const Icon(Icons.camera,
//                                     color: Colors.white),
//                                 label: const Text('Camera'),
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color.fromARGB(
//                                         255, 8, 45, 109)),
//                               ),
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   _browseImage(ImageSource.gallery);
//                                   Navigator.pop(context);
//                                 },
//                                 icon: const Icon(Icons.image,
//                                     color: Colors.white),
//                                 label: const Text('Gallery'),
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color.fromARGB(
//                                         255, 8, 45, 109)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     child: SizedBox(
//                       height: 120,
//                       width: 120,
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundImage: _img != null
//                             ? FileImage(_img!)
//                             : const AssetImage('assets/images/logo.png')
//                                 as ImageProvider,
//                       ),
//                     ),
//                   ),
//                   _gap,

//                   // Email Input
//                   _buildTextField(
//                       controller: _emailController,
//                       labelText: 'Email',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter email';
//                         }
//                         return null;
//                       }),

//                   _gap,

//                   // Username Input
//                   _buildTextField(
//                       controller: _usernameController,
//                       labelText: 'Username',
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter username';
//                         }
//                         return null;
//                       }),

//                   _gap,

//                   // Password Input
//                   _buildTextField(
//                       controller: _passwordController,
//                       labelText: 'Password',
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter password';
//                         }
//                         return null;
//                       }),

//                   _gap,

//                   // Confirm Password Input
//                   _buildTextField(
//                       controller: _confirmPasswordController,
//                       labelText: 'Confirm Password',
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter confirm password';
//                         }
//                         if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       }),

//                   _gap,

//                   // Register Button
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_key.currentState!.validate()) {
//                         final registerState =
//                             context.read<RegisterBloc>().state;
//                         final imageName = registerState.imageName;
//                         context.read<RegisterBloc>().add(
//                               RegisterUser(
//                                 context: context,
//                                 email: _emailController.text,
//                                 username: _usernameController.text,
//                                 password: _passwordController.text,
//                                 image: imageName,
//                                 confirmpassword: _confirmPasswordController.text,
//                               ),
//                             );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       backgroundColor: const Color.fromARGB(255, 8, 45, 109),
//                     ),
//                     child: const Text(
//                       'Register',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Colors.white),
//                     ),
//                   ),
//                   _gap,

//                   // Navigate to Login Page Button
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginView()),
//                       );
//                     },
//                     child: const Text(
//                       'Already have an account? Sign In',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 8, 45, 109)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Reusable text field widget
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     String? Function(String?)? validator,
//     bool obscureText = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         border: Border.all(color: const Color.fromARGB(255, 8, 45, 109)),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           labelText: labelText,
//           labelStyle: const TextStyle(
//               fontWeight: FontWeight.bold, color: Color.fromARGB(255, 8, 45, 109)),
//         ),
//         validator: validator,
//       ),
//     );
//   }
// }
