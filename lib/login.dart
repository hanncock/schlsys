import 'package:flutter/material.dart';
import 'package:web1/allmodules.dart';
import 'package:web1/service/apis.dart';
import 'package:web1/style/colors.dart';

import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

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
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: new BoxConstraints(
            // minwidth: MediaQuery.of(context).size.width * 0.35,
            minWidth: MediaQuery.of(context).size.width * 0.35,
            // maxHeight: 30.0,
            maxWidth: MediaQuery.of(context).size.width * 0.35,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                  Text('Login'),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextFormField(
                      validator: (val) => val!.isEmpty || val == null ? "Username" : null,
                      onChanged: (val){setState(() => username = val);},
                      decoration: InputDecoration(
                        hintText: 'username',
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextFormField(
                      // onFieldSubmitted: (value) {
                      //   setState((){
                      //     if(username == 'soke' && password == 'soke'){
                      //       // Navigator.of(context)
                      //     }
                      //   });
                      // },
                      validator: (val) => val!.isEmpty ? "Password" : null,
                      onChanged: (val){setState(() => password = val);},
                      obscureText: obscuretext,
                      decoration: InputDecoration(
                        hintText: 'Password',
                          filled: true,
                          counterText: 'Forgot password ?',
                          suffixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                obscuretext = !obscuretext;
                              });
                            },
                              child: Icon(Icons.visibility_off_outlined,color: Colors.grey,)
                          ),
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
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
                            onPressed: ()async{
                              if (loginForm.currentState!.validate()) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Modules()));
                                // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Modules()));
                              }else{
                                var resu = await auth.login(username, password);
                                print(resu);
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
            ),
          ),
        ),
      ),
    );
  }
}
