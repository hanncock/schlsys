import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web1/screens_with_models/authentication/login_model.dart';
import 'package:web1/wrapper.dart';

class AuthService{
  String url ='https://6dc1-105-161-3-1.ngrok-free.app';

  // var currentUser = "${Userdata['fName']} ${Userdata['sName']}";
  // String url ='http://105.161.3.1:3000';

  Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };

  login(username,password)async{

    var all = '$url/api/users/login';
      Map data = {
        "email": username,
        "pass": password
      };

    var send = jsonEncode(data);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);

    var response_data = jsonDecode(response.body);
    print(response_data);
    if(response_data['success']){

      var creds = [username,password];
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("Userdata", jsonEncode(response_data['data']));

      pref.setString("userCreds", jsonEncode(creds));

      return(User.fromJson(jsonDecode(response.body)['data']));
    }else {
        return response_data;
      }
  }

  ff() async {
    String getItemCatalog = "https://3a04-197-248-34-79.ngrok-free.app/api/users/list";
    //'$url/users/login';//userData[0].toString() +'/live/api/itemcatalog/list?companyId='+defaultCompanyId.toString();
    print(getItemCatalog);
    try{
      var response =  await get(Uri.parse(getItemCatalog));
      var jsondata = jsonDecode(response.body);
      print(jsondata);
      return jsondata;
    }catch(e){
      return e.toString();
    }
  }

  userAdd(fName,oNames,idNo,email,phoneNum,gender)async{

    var all = '$url/api/users/add';
    Map data = {
      "fname":fName,
      "sname":oNames,
      "idNo":idNo,
      "gender":gender,
      "email": email,
      "phoneNum": phoneNum,
      "pass": "sokeagain",
      "user": currentUser
    };

    var send = jsonEncode(data);
    print(send);
    // var response = await http.post(Uri.parse(all), body: send, headers: headers);
    // var response_data = jsonDecode(response.body);
    // return response_data;

  }


  sendSms(phoneNum,message)async{

    var url = 'https://api.africastalking.com/version1/messaging';
    var bodyFields = {
      'username': 'soke',
      'to': phoneNum,
      'message': message
    };
    print(bodyFields);
    final response = await http.post(Uri.parse(url),
        body: bodyFields,
        headers: {
          'apikey': '41928f753d83cfa1c413d2ff71075de523f385b7b8a0a267b334353547ee8a6e',
          'Accept': 'application/json',
          // 'Content-Type': 'application/x-www-form-urlencoded'
          // 'Content-Type':'application/json'
        }
    );
    // print(response.body);
    var data = jsonDecode(response.body);
    print(data.runtimeType);
    print(data['SMSMessageData']['Recipients']);

  }



  // internetFunctions()async{
  //   try {
  //     final checkConnection = await InternetAddress.lookup('google.com');
  //     if (checkConnection.isNotEmpty && checkConnection[0].rawAddress.isNotEmpty) {
  //       return true;
  //     }
  //   }on SocketException catch (_) {
  //     print('not connected');
  //     return false;
  //   }
  // }
  //
  //
  // SignIn(String email, String password, String url) async {
  //   String all = url.toString()+'/live/api/auth/login';
  //   Map data = {
  //     "username": email,
  //     "password": password
  //   };
  //
  //   var send = jsonEncode(data);
  //   Response response = await http.post(Uri.parse(all), body: send, headers: headers);
  //   User? use = _userdata(jsonDecode(response.body));
  //   return use;
  // }
  //
  // loanProjections(loanAmount,feesAsPrincipal,interstRate,numInstal,instalAmnt,intType,intFreq,repayFreq) async{
  //
  //   var all = userData[0] + '/live/api/sacco_loan/projection';
  //
  //   Map data = {
  //     "loanAmount":loanAmount,
  //     "feeAsPrincipal": feesAsPrincipal,
  //     "interestRate": interstRate,
  //     "numberOfInstallments": numInstal,
  //     "installmentAmount": instalAmnt,
  //     "interestType": intType,
  //     "interestFrequency": intFreq,
  //     "repaymentFrequency": repayFreq
  //   };
  //
  //   // return data;
  //   var send = jsonEncode(data);
  //   Response response = await http.post(Uri.parse(all), body: send, headers: headers);
  //   var use = jsonDecode(response.body);
  //   return use;
  // }

}