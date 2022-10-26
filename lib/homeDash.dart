import 'package:flutter/material.dart';
import 'package:web1/homepage.dart';
import 'package:web1/responsive/desktop_body.dart';

class HomeDash extends StatefulWidget {
  const HomeDash({Key? key}) : super(key: key);

  @override
  State<HomeDash> createState() => _HomeDashState();
}

class _HomeDashState extends State<HomeDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[200],
      // body: Column(
      //   children: [
      //     IconButton(
      //         onPressed: (){
      //           if(modules.contains('SchoolSys')){
      //             print('exists');
      //             modinitPosition = modules.indexOf('SchoolSys');
      //             setState((){});
      //           }else{
      //             setState(() {
      //               print('will add ');
      //               modules.add('SchoolSys');
      //             });
      //             modinitPosition = modules.indexOf('SchoolSys');
      //             print('this is the position $modinitPosition');
      //             setState((){});
      //           }
      //           modules.add('SchoolSys');
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => const MyDesktopBody()),
      //           // );
      //         },
      //         icon: Icon(Icons.school,color: Colors.white,)
      //     )
      //   ],
      // ),
    );
  }
}
