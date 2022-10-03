import 'package:flutter/material.dart';
import 'package:web1/responsive/desktop_body.dart';
import 'package:web1/responsive/mobile_body.dart';
import 'package:web1/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: currentWidth < 600 ? Colors.deepPurple[300] : Colors.green[300],
      body: ResponsiveLayout(
        desktopBody: MyDesktopBody(),
        mobileBody:  MyMobileBody(),
        )
      // Center(
      //   child: Text(currentWidth.toString()),
      // )
    );
  }
}
