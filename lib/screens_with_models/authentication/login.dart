import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/screens_with_models/authentication/login_model.dart';
import 'package:web1/service/apis.dart';
import 'package:web1/style/colors.dart';
import 'package:web1/wrapper.dart';

import '../../widgets/loading.dart';


class Login extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const Login({Key? key, required this.sessionStateStream}) : super(key: key);

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
          constraints: BoxConstraints(
            // minwidth: MediaQuery.of(context).size.width * 0.35,
            // minWidth: width * 0.4,
            // maxHeight: 700.0,
            maxWidth: 50.h,
          ),
          child: Container(
              padding: const EdgeInsets.all(8),
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
                    const SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        validator: (val) =>
                        val!.isEmpty
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
                              child: const Icon(Icons.visibility_off_outlined,
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
                    const SizedBox(height: 40,),
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
                                    print(resu);
                                    Navigator.of(context).pop();

                                    if (resu is User) {
                                      const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text('Login Success'),
                                      );
                                      // var showToast = Fluttertoast.showToast(
                                      //     msg: 'Login Success',
                                      //     toastLength: Toast.LENGTH_SHORT,
                                      //     gravity: ToastGravity.CENTER,
                                      //     timeInSecForIosWeb: 3,
                                      //     backgroundColor: Colors.green,
                                      //     textColor: Colors.white,
                                      //     fontSize: 16.0
                                      // );
                                      showReturnMessage(context, Colors.green,'Login Success');
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Messaging(sessionStateStream: widget.sessionStateStream)));
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (_) => Wrapper(
                                            sessionStateStream: widget
                                                .sessionStateStream,)));
                                      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Modules(session: widget.sessionStateStream,)));


                                    } else {
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text('${resu["data"]}'),
                                      );
                                    }
                                    // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Modules()));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                                child: const Padding(
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