// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   bool _isLoading = false;
//
//   Future register() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     final response = await http.post(
//       Uri.parse('https://care-for-you-v1.000webhostapp.com/api/auth/register'),
//       body: {
//         'name': nameController.text,
//         'email': emailController.text,
//         'password': passwordController.text,
//       },
//     );
//
//     setState(() {
//       _isLoading = false;
//     });
//
//     if (response.statusCode == 200) {
//       var message = jsonDecode(response.body)['message'];
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 2),
//       ));
//     } else {
//       var error = jsonDecode(response.body)['error'];
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(error),
//         duration: Duration(seconds: 2),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register Page'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(labelText: 'Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(labelText: 'Email'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration: InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 24.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         register();
//                       }
//                     },
//                     child: _isLoading
//                         ? CircularProgressIndicator(
//                       color: Colors.white,
//                     )
//                         : Text('Register'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
