// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class LogoutPage extends StatelessWidget {
//   final String apiUrl = "http://127.0.0.1:8000/api/auth/logout";
//   Future<http.Response> _logout() async {
//     return await http.post(
//       Uri.parse(apiUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Logout Page"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text("Logout"),
//           onPressed: () async {
//             final response = await _logout();
//             if (response.statusCode == 200) {
//               Navigator.pop(context);
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("Logout Failed"),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
