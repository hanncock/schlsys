import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web1/screens_with_models/authentication/login.dart';
import 'package:web1/service/apis.dart';

import 'allmodules.dart';
import 'custom_tab/customset.dart';


class Wrapper extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const Wrapper({Key? key,required this.sessionStateStream}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

var Userdata ;
var currentUser ;
var width;
var height;
final AuthService auth = AuthService();
var session;
class _WrapperState extends State<Wrapper> {



  checkValues()async{
    SharedPreferences user = await SharedPreferences.getInstance();
    var data = user.getString('Userdata');
    setState(() {
      session = widget.sessionStateStream;
    });
    if(data == null){
      Navigator.push(context, MaterialPageRoute(builder: (_) =>  Login(sessionStateStream: widget.sessionStateStream,)));

    }else{

      // print(jsonDecode(data));
      setState(() {
        Userdata = jsonDecode(data);
        currentUser = "${Userdata['firstName']} ${Userdata['otherNames']}";
      });


      // flutter how to make a tab not refresh its state
      widget.sessionStateStream.add(SessionState.stopListening);

      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Modules(sessionStateStream: widget.sessionStateStream,)));
      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Messaging(sessionStateStream: widget.sessionStateStream)));
      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Createuser(sessionStateStream: widget.sessionStateStream)));
      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  CreateCompany(sessionStateStream: widget.sessionStateStream)));
      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Companies(sessionStateStream: widget.sessionStateStream)));
      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  Settings(sessionStateStream: widget.sessionStateStream)));
      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  const Companies()));
      Navigator.push(context, MaterialPageRoute(builder: (_) =>  CustomSet(sessionStateStream: widget.sessionStateStream,)));
      // Navigator.push(context, MaterialPageRoute(builder: (_) =>  UsersList()));
      widget.sessionStateStream.add(SessionState.startListening);

    }

  }

  @override
  void initState(){
    super.initState();
    checkValues();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Text('${Userdata ?? '---' }'),
      ),
    );
  }
}
