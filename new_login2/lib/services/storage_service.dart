import 'dart:io';
import 'package:http/io_client.dart';
import 'package:new_login/ui/shared/app_config.dart';

class StorageService {
  // daveData function for Register

  Future<bool> saveData(
      name, email, phone, password, gender, dob, isSeller) async {
    var url;
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(client);

    if (isSeller == false) {
      url = baseURL + 'api/restaddusers';
    } else {
      url = baseURL + 'api/restaddusers';
    }

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
      return false;
    }
  }

/////////////////////////////////
// retrieveData function for login
  Future<bool> retrieveData(
      String email, String password, bool isSeller) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = new IOClient(client);

    String url;
    if (isSeller == false)
      url = baseURL + 'api/restuserlogin';
    else
      url = baseURL + 'api/restuserlogin';

    try {
      final response = await ioClient.post(url, body: {
        "userEmailId": email,
        "userPassword": password,
      });
      if (response.body == 'true') {
        return true;
      } else {
        return false;
      }
    } catch (Exception) {
      return false;
    }
  }
}
