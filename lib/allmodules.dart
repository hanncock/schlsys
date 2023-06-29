import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:web1/HomePage.dart';
import 'package:web1/settings/create_user.dart';
import 'package:web1/smsscreen/sms.dart';
import 'package:web1/tabViews.dart';
import 'package:web1/wrapper.dart';
import 'models/listViewModel.dart';
import 'models/modulesViewer.dart';

class Modules extends StatefulWidget {
  // Session session;
  final StreamController<SessionState> sessionStateStream;
   Modules({Key? key, required this.sessionStateStream}) : super(key: key);

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {

  List<String> modules = ['HomeScreen'];
  int modinitPosition = 0;

  var currentModules = [
    ModuleDetail(
      label: 'SchoolSys',
      title: 'School',
      icon: Icon(Icons.school,size: 80,),
    ),
    ModuleDetail(
      label: 'SMS',
      title: 'Messaging',
      icon: Icon(Icons.sms,size: 80,),
    ),
    ModuleDetail(
      label: 'Settings',
      title: 'Settings',
      icon: Icon(Icons.settings,size: 80,),
    ),
    ModuleDetail(
      label: 'Vehicle',
      title: 'VMS',
      icon: Icon(Icons.directions_bus_outlined,size: 80,),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width;
    height = height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('${Userdata['fName']}'),
            Container(
              width: width,
              height: height * 0.8,
              child: CustomTabView(
                modinitPosition: modinitPosition,
                itemCount: modules.length,
                tabBuilder: (context, index) => Tab(text: modules[index]),
                pageBuilder: (context, index) => (
                    modules[index] == 'HomeScreen' ?
                    // HomeDash():
                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                        ),
                        itemCount: currentModules.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: (){
                                var label = currentModules[index].label;
                                if(modules.contains(currentModules[index].label)){
                                  print('exists');
                                  modinitPosition = modules.indexOf(currentModules[index].label);
                                  setState((){});
                                }else{
                                  setState(() {
                                    print('will add ');
                                    modules.add(currentModules[index].label);
                                  });
                                  modinitPosition = modules.indexOf(currentModules[index].label);
                                  print('this is the position $modinitPosition');
                                  setState((){});
                                }
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => const MyDesktopBody()),);
                              },
                              child: ModuleViewer(moduleDetail: currentModules[index],));
                        }
                    ):
                    modules[index] == 'SchoolSys'?
                    HomePage():
                    modules[index] == 'DocumentSys'?
                    Text('document'):
                    modules[index] == "Settings" ?
                    Createuser(sessionStateStream: widget.sessionStateStream,):
                    modules[index] == "SMS" ?
                    Messaging(sessionStateStream: widget.sessionStateStream,):
                    Text('first ${modules[index]}')
                ),
                onPositionChange: (index){
                  print('current position: $index');
                  modinitPosition = index;
                  setState((){});
                },
                onScroll: (position) => print('$position'), stub: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
