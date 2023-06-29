import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/allmodules.dart';
import 'package:web1/screens_with_models/authentication/login_model.dart';
import 'package:web1/service/apis.dart';
import 'package:web1/smsscreen/sms.dart';
import 'package:web1/style/colors.dart';
import 'package:web1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web1/wrapper.dart';

import '../../widgets/loading.dart';


class Login extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  Login({Key? key, required this.sessionStateStream}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var username;
  var password;
  bool obscuretext = true;
  final loginForm = GlobalKey<FormState>();
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: new BoxConstraints(
            // minwidth: MediaQuery.of(context).size.width * 0.35,
            // minWidth: width * 0.4,
            // maxHeight: 700.0,
            maxWidth: 50.h,
          ),
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryBg
              ),
              // minWidth: ,

              alignment: Alignment.center,
              child: Form(
                key: loginForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login', style: TextStyle(fontSize: 5.sp),),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        validator: (val) =>
                        val!.isEmpty || val == null
                            ? "Username"
                            : null,
                        onChanged: (val) {
                          setState(() => username = val);
                        },
                        decoration: InputDecoration(
                          hintText: 'username',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        validator: (val) => val!.isEmpty ? "Password" : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: obscuretext,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          counterText: 'Forgot password ?',
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  obscuretext = !obscuretext;
                                });
                              },
                              child: Icon(Icons.visibility_off_outlined,
                                color: Colors.grey,)
                          ),
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.deepPurple.shade100,
                                      spreadRadius: 10,
                                      blurRadius: 20
                                  )
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (loginForm.currentState!.validate()) {
                                    buildShowDialog(context);
                                    var resu = await auth.login(
                                        username, password);
                                    // var resu = await auth.ff();
                                    Navigator.of(context).pop();

                                    if (resu is User) {
                                      var showToast = Fluttertoast.showToast(
                                          msg: 'Login Success',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Messaging(sessionStateStream: widget.sessionStateStream)));
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (_) => Wrapper(
                                            sessionStateStream: widget
                                                .sessionStateStream,)));
                                      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Modules(session: widget.sessionStateStream,)));


                                    } else {
                                      var showToast = Fluttertoast.showToast(
                                          msg: resu["data"],
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }
                                    // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Modules()));
                                  }
                                  // await FlutterSession.set('token', user);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text('Login'),
                                ),
                              )
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

}