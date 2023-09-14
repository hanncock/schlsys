import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web1/screens_with_models/authentication/login_model.dart';
import 'package:web1/wrapper.dart';

class AuthService{
  // String url ="https://d10c-197-248-34-79.ngrok-free.app";
  String url ="http://192.168.1.117:3000";


  var companyIdtouse= Userdata?['allowedCompanies'][0]['companyId'];

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
    
    print(send);
    
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    print(response.body);
    var responseData = jsonDecode(response.body);
    if(responseData['success'] == true){

      var creds = [username,password];
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("Userdata", jsonEncode(responseData['data']));

      pref.setString("userCreds", jsonEncode(creds));

      // return(User.fromJson(jsonDecode(response.body)['data']));
      return(User.fromJson(responseData['data']));
    }else {
        return responseData;
      }
  }

  setupmailConfigs(companyId,mailusername,mailpassword,smtphost,port)async{
    var all = '$url/api/mails/setup';
    Map data = {
      "companyId":Userdata['allowedCompanies'][0]['companyId'],
      "mailUsername":mailusername,
      "mailPassword": mailpassword,
      "mailHost": smtphost,
      "mailPort": port,
      "user": currentUser
    };

    var send = jsonEncode(data);
    print(send);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    print(response.body);
    var responseData = jsonDecode(response.body);

    return responseData;

  }

  createClient(companyId,clientName,clientEmail,clientPhone,clientContactName,clientContactPhone,clientContactEmail,clientAddress,clientId)async{
    var all = "$url/api/clients/setup";
    print(all);
    Map data = {
      "companyId":Userdata['allowedCompanies'][0]['companyId'],
      "clientId":clientId,
      "clientName": clientName,
      "clientEmail": clientEmail,
      "clientPhone": clientPhone,
      "clientContactName": clientContactName,
      "clientContactPhone": clientContactPhone,
      "clientContactEmail": clientContactEmail,
      "clientAddress": clientAddress,
      "user": currentUser
    };

    var send = jsonEncode(data);
    print(send);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    print(response.body);
    var responseData = jsonDecode(response.body);

    return responseData;

  }



  setupSmsConfig(companyId,mesourl,appName,apiKey)async{
    var all = "$url/api/messages/setup";
    print(all);
    Map data = {
      "companyId":Userdata['allowedCompanies'][0]['companyId'],
      "messageUrl":mesourl,
      "appName": appName,
      "apiKey": apiKey,
      "user": currentUser
    };

    var send = jsonEncode(data);
    print(send);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    print(response.body);
    var responseData = jsonDecode(response.body);

    return responseData;

  }


  smsConfigs(companyId)async{
    String getsmsConfigs = "$url/api/messages/configs?companyId="+companyId;
    print(getsmsConfigs);
    try{
      var response =  await get(Uri.parse(getsmsConfigs));
      var jsondata = jsonDecode(response.body);
      return jsondata;
    }catch(e){
      return e.toString();
    }
  }

  mailConfigs(companyId)async{
    String getMailConfigs = "$url/api/mails/configs?companyId="+companyId;
    print(getMailConfigs);
    try{
      var response =  await get(Uri.parse(getMailConfigs));
      var jsondata = jsonDecode(response.body);
      return jsondata;
    }catch(e){
      return e.toString();
    }
  }


  userAdd(String? id,fName,oNames,idNo,email,phoneNum,gender)async{

    print('adding users');
    var all = '$url/api/users/add';
    Map data = {
      "id":id,
      "fname":fName,
      "sname":oNames,
      "idNo":idNo,
      "gender":gender,
      "email": email,
      "phoneNum": phoneNum,
      "pass": "sokeagain",
      "user": currentUser
    };
    print(data);

    var send = jsonEncode(data);
    print(send);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    var responseData = jsonDecode(response.body);
    return responseData;

  }

  users()async{
    String getcompanies = "$url/api/users/list";
    try{
      var response =  await get(Uri.parse(getcompanies));
      var jsondata = jsonDecode(response.body);
      return jsondata;
    }catch(e){
      return e.toString();
    }
  }

  companyAdd(companyId, companyName,companyEmail,companyRegNo,companyAddress,companyWebsite,companyLogo,companytaxpin,companyphone,companycountry,companytown,companyroad,imagechange,prevPath)async{


    var all = '$url/api/companies/add';

    Map data = {
      "companyId":companyId,
      "name":companyName,
      "email":companyEmail,
      "regNo":companyRegNo,
      "address":companyAddress,
      "website":companyWebsite,
      "logo":companyLogo,
      "taxpin":companytaxpin,
      "phone":companyphone,
      "country":companycountry,
      "town": companytown,
      "road":companyroad,
      "imageChange":imagechange,
      "prevPath":prevPath
    };

    var send = jsonEncode(data);
    print(send);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    var responseData = jsonDecode(response.body);
    return responseData;

  }

  companies()async{
    String getcompanies = "$url/api/companies/list";
    try{
      var response =  await get(Uri.parse(getcompanies));
      var jsondata = jsonDecode(response.body);
      // print(jsondata);
      return jsondata['data'];
    }catch(e){
      return e.toString();
    }
  }

  clients()async{
    String getcompanies = "$url/api/clients/list?companyId="+Userdata['allowedCompanies'][0]['companyId'];
    try{
      var response =  await get(Uri.parse(getcompanies));
      var jsondata = jsonDecode(response.body);
      print(jsondata);
      return jsondata['data'];
    }catch(e){
      return e.toString();
    }
  }

  clientBranchesAdd(branchId,clientId,branchName,branchContact,branchEmail,branchLocation)async{
    var all = '$url/api/clients/branches/add';

    Map data = {
      "branchId":branchId,
      "clientId":clientId,
      "branchName":branchName,
      "branchContact":branchContact,
      "branchEmail":branchEmail,
      "branchLocation":branchLocation,
    };

    var send = jsonEncode(data);
    print(send);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    var responseData = jsonDecode(response.body);
    // print(responseData);
    return responseData;
  }

  clientbranches(clientId)async{

    var getClientsbranches = '$url/api/clients/branches/list?clientId='+clientId;

    print(getClientsbranches);
    try{
      var response =  await get(Uri.parse(getClientsbranches));
      var jsondata = jsonDecode(response.body);
      return jsondata;
    }catch(e){
      return e.toString();
    }


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
    print(data);
    print(data.runtimeType);
    print(data['SMSMessageData']['Recipients']);
    var sendData = data['SMSMessageData']['Recipients'][0];

    saveMessotoDb(sendData['number'],sendData['messageId'],message,sendData['status'],sendData['statusCode'],sendData['cost']);
  }

  saveMessotoDb(numberTo,messageId,message,status,status_code,cost)async{

    var all = '$url/api/messages/save';

    Map data = {
      "numberTo":numberTo,
      "companyId":companyIdtouse,
      "messageId":message,
      "message":messageId,
      "status":status,
      "status_code":status_code,
      "cost":cost,
      "user": currentUser
    };

    var send = jsonEncode(data);
    print(send);
    var response = await http.post(Uri.parse(all), body: send, headers: headers);
    var responseData = jsonDecode(response.body);
    print(responseData);
    return responseData;
  }

  getMessages(companyId)async{

      String getMeso = "$url/api/messages/list?companyId="+companyId;
      print(getMeso);
      try{
        var response =  await get(Uri.parse(getMeso));
        var jsondata = jsonDecode(response.body);
        return jsondata;
      }catch(e){
        return e.toString();
      }

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