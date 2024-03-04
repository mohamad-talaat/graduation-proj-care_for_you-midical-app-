import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final String _baseUrl = 'https://care-for-you-v1.000webhostapp.com/api'; // put url here

  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse(_baseUrl + endpoint));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }

// static Future<Response> getData( {required String url, required Map<String, dynamic> query}) {
// return dio.get(url, queryParameters: query,); }

  static Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse(_baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data to API');
    }
  }


  static Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    final response = await http.put(Uri.parse(_baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update data in API');
    }
  }

  static Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(Uri.parse(_baseUrl + endpoint));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to delete data from API');
    }
  }
}

// static Future<Response> getData( {required String url, required Map<String, dynamic> query}) {
// return dio.get(url, queryParameters: query,); }

//ودا رابط الابي اي اللي فيه الداتا
// https://newsapi.org/v2/top-headlines?country=eg&apiKey=c9549d6d17f24a06a3405763441e9825&category=business

// var business=[];
// void getBusiness(){
//   emit(newAppbusinessLoadingState());
//   DioHelper.getData(url: 'v2/top-headlines', query:{'country':'eg' , 'apiKey' :'c9549d6d17f24a06a3405763441e9825','category':'business' })
//   .then((value){business = value.data['articles']; print(business);   emit(newAppbusinessSuccessfullState()); })
//   .catchError((error){print(error.toString());emit(newAppbusinessErrorState(error));});
// }

// الميثود اللي هتعامل من خلالها مع الداتا
Future<void> fetchData() async {
  try { // TRY AND CATCH  نفس الشئ ب  .then and catch error  مفيش تغيير يعني خالص
    final data = await ApiProvider.get('/some/endpoint');
    // Do something with data
    // print('Response status: ${data.statusCode}');print('Response body: ${data.body}'); // دا الامر الاصح
    // ااو زي كدا  ;business = value.data['articles']; print(business)
  } catch (e) {
    // Handle error
    //print('Error: $e');
  }
}

Future<void> postData() async {
  final body = {"name": "John Doe", "email": "john.doe@example.com"};
  final response = await ApiProvider.post('/some/endpoint', body);
  try {
    final response = await ApiProvider.post('/some/endpoint', body);
    // Handle response
     print('Response status: ${response.statusCode}');print('Response body: ${response.body}'); // دا الامر الاصح
  } catch (e) {// Handle error
    print('Request failed with status: ${response.statusCode}.');
  }}
// this method For  Login
Future<String> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://example.com/api/login'), body: {'email': email, 'password': password},);

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['token'];
  } else {
    throw Exception('Failed to login');
  }
}



Future<void> updateData() async {
  final body = {'name': 'John', 'age': 31};
  final response = await ApiProvider.put('/some/endpoint/1', body);
  try {
    final response = await ApiProvider.put('/some/endpoint/1', body);
    // Handle response
  } catch (e) {
    // Handle error
  }
}

Future<void> deleteData() async {
  try {
    final response = await ApiProvider.delete('/some/endpoint/1');
    // Handle response
  } catch (e) {
    // Handle error
  }
}

