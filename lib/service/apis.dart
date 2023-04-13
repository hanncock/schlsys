class AuthService{
  String url ='';

  login(username,password)async{
    var resu = await url+'/auth/login';
    print(resu);
    return resu;
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