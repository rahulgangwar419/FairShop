// import 'dart:convert';
// import 'package:firstprogram/model/aurh_model.dart';
// import 'package:http/http.dart' as http;

// Future<void> fetchData() async {
//   String url = 'https://jk-msfa-dev-api.jktyre.co.in/api/v1/attendance';
//   String token =
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTU1OTEwNTRkZTcyN2U1MjZhZWZjNDEiLCJTQVBfSUQiOiJTTzMxMTEwMSIsImlhdCI6MTcxMDQxMjQ3MSwiZXhwIjoxNzExNzA4NDcxfQ.r4_ofAKkfWaMWyUiv-GONTmGEDx_9Y6IsiZkLum1LKU';

//   try {
//     var response = await http.get(
//       Uri.parse(url),
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       // Request successful, parse the JSON
//       var data = jsonDecode(response.body);
//       var attendance =
//           AttendanceModel.fromJson(data); // Parse the JSON into AttendanceModel
//       print("response data : ${attendance.data![0].checkIn!.location!.lat}");
//     } else {
//       // Request failed with status code
//       print('Failed with status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Error in making request
//     print('Error: $e');
//   }
// }

// // Call fetchData() to make the API request

// Future<void> login(String email, String password) async {
//   String url = 'https://your-api-url.com/login';
//   Map<String, String> body = {
//     'email': email,
//     'password': password,
//   };

//   try {
//     var response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(body),
//     );

//     if (response.statusCode == 200) {
//       // Request successful, parse the JSON
//       var data = jsonDecode(response.body);
//       print(data);
//     } else {
//       // Request failed with status code
//       print('Failed with status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Error in making request
//     print('Error: $e');
//   }
// }
