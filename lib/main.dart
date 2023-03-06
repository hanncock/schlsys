import 'package:flutter/material.dart';
import 'package:web1/allmodules.dart';
import 'package:web1/config/SizeConfig.dart';
import 'package:web1/login.dart';
import 'package:web1/smsscreen/sms.dart';
import 'package:web1/style/colors.dart';
import 'HomePage.dart';

void main(){

  runApp(const myApp());
}

 var _mediaQueryData;
 var screenWidth;
 var screenHeight;
 var blockSizeHorizontal;
 var blockSizeVertical;

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.primaryBg
      ),
      // home: HomePage(),
      home: Login(),
      // home: Messaging(),
    );
  }
}
