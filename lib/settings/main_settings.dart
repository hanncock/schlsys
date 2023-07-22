import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:web1/settings/companies.dart';
import '../models/listViewModel.dart';
import '../models/modulesViewer.dart';
import '../style/colors.dart';
import '../tabViews.dart';
import '../wrapper.dart';
import 'create_company.dart';
import 'create_user.dart';

class Settings extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const Settings({Key? key,required this.sessionStateStream}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> modules = ['HomeScreen'];
  int modinitPosition = 0;
  var settingsModules = [
    ModuleDetail(
      label: 'Company',
      title: 'Company',
      icon: Icon(Icons.school,size: 80,),
    ),
    ModuleDetail(
      label: 'User',
      title: 'user',
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
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 100,
            height: height,
            color: AppColors.secondaryBg,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 100,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Center(
                        child: SvgPicture.asset('mac-action.svg'),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                      'home.svg',
                      color: AppColors.iconGray,
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                      'pie-chart.svg',
                      color: AppColors.iconGray,
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                      'clipboard.svg',
                      color: AppColors.iconGray,
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                      'credit-card.svg',
                      color: AppColors.iconGray,
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                      'trophy.svg',
                      color: AppColors.iconGray,
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(
                      'invoice.svg',
                      color: AppColors.iconGray,
                    ),
                    iconSize: 20,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: height,
            width: width * 0.8,
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
                      itemCount: settingsModules.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: (){
                              var label = settingsModules[index].label;
                              if(modules.contains(settingsModules[index].label)){
                                print('exists');
                                modinitPosition = modules.indexOf(settingsModules[index].label);
                                setState((){});
                              }else{
                                setState(() {
                                  print('will add ');
                                  modules.add(settingsModules[index].label);
                                });
                                modinitPosition = modules.indexOf(settingsModules[index].label);
                                print('this is the position $modinitPosition');
                                setState((){});
                              }
                              // Navigator.push(context,MaterialPageRoute(builder: (context) => const MyDesktopBody()),);
                            },
                            child: ModuleViewer(moduleDetail: settingsModules[index],));
                      }
                  ):
                  // ListView.builder(
                  //   itemCount: settingsModules.length,
                  //   itemBuilder: (context, index){
                  //   return Card(child: Text(settingsModules[index].label),);
                  // },):
                  modules[index] == 'Company'?
                  CreateCompany(sessionStateStream: widget.sessionStateStream,):
                  modules[index] == 'User'?
                  Createuser(sessionStateStream: widget.sessionStateStream,):
                  modules[index] == "Settings" ?
                  Settings(sessionStateStream: widget.sessionStateStream,):
                  modules[index] == "SMS" ?
                      Text(''):
                  // Messaging(sessionStateStream: widget.sessionStateStream,):
                  Text('first ${modules[index]}')
              ),
              onPositionChange: (index){
                print('current position: $index');
                modinitPosition = index;
                setState((){});
              },
              onScroll: (position) => print('$position'), stub: Container(),
            ),
          )
        ],
      ),

    );
  }
}
