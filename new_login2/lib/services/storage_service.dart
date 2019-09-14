import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:new_login/ui/shared/app_config.dart';

class StorageService {
  // daveData function for Register

  Future<bool> saveData(
      name, email, phone, password, gender, dob, isSeller) async {
    var url;

    HttpClient client = new HttpClient();
    if (isSeller == false) {
      url = baseURL;
    } else {
      url = baseURL;
    }

    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = new IOClient(client);
    try {
      final response = await ioClient.post(url, body: {
        "userName": name,
        "userPassword": password,
        "userMobileNumber": phone,
        "userEmailId": email,
        "userDOB": dob,
        "userGender": gender,
      });
      if (response.body == 'true') {
        return true;
      } else {
        return false;
      }
    } catch (Exception) {
      // Return something
    }
  }

// retrieveData function for login
  Future<bool> retrieveData(
      String email, String password, bool isSeller) async {
    String url;
    var response;
    if (isSeller == false)
      url = '${baseURL}test_customer.php';
    else
      url = '${baseURL}test_seller.php';
    try {
      response = await http.post(url, body: {
        "userEmail": email,
        "userPassword": password,
      });

      Map<String, dynamic> map = json.decode(response.body);
      if (map['status'] == '1') {
        return true;
      } else {
        return false;
      }
    } catch (Exception) {
      return false;
      // return something
    }
  }
}
