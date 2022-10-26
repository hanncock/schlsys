// import 'package:flutter/material.dart';
// import 'package:web1/responsive/desktop_body.dart';
// import 'package:web1/responsive/mobile_body.dart';
// import 'package:web1/responsive/responsive_layout.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
//
//   List<String> modules = ['Dashboard'];
//   int initPosition = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final currentWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: currentWidth < 600 ? Colors.deepPurple[300] : Colors.green[300],
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Card(
//             //   child: IconButton(
//             //     onPressed: (){
//             //       print('fetching the values');
//             //     },
//             //     icon: Icon(Icons.school),
//             //   ),
//             // ),
//             Card(
//               child: Container(
//                 width: width,
//                 height: height * 0.9,
//                 child: CustomTabView(
//                   initPosition: initPosition,
//                   itemCount: modules.length,
//                   tabBuilder: (context, index) => Tab(text: modules[index]),
//                   pageBuilder: (context, index) => (
//
//                   Text('build')
//                       // data[index] == 'Dashboard' ?
//                       // SchoolDash():
//                       // data[index] == 'Student'?
//                       // StudentList():
//                       // data[index] == 'Exams'?
//                       // Exams():
//                       // Text('first ${data[index]}')
//                   ),
//
//                   onPositionChange: (index){
//                     print('current position: $index');
//                     initPosition = index;
//                     setState((){});
//                   },
//                   onScroll: (position) => print('$position'), stub: Container(),
//                 ),
//               ),
//             ),
//             // Card(
//             //   child: Text('here goes the first actual page'),
//             // ),
//             // Container(
//             //   width: width,
//             //   height: height * 0.5,
//             //   child: ResponsiveLayout(
//             //     desktopBody: MyDesktopBody(),
//             //     mobileBody:  MyMobileBody(),
//             //     ),
//             // ),
//           ],
//         ),
//       )
//       // Center(
//       //   child: Text(currentWidth.toString()),
//       // )
//     );
//   }
// }
//
// class CustomTabView extends StatefulWidget {
//   final int itemCount;
//   final IndexedWidgetBuilder tabBuilder;
//   final IndexedWidgetBuilder pageBuilder;
//   final Widget stub;
//   final ValueChanged<int> onPositionChange;
//   final ValueChanged<double> onScroll;
//   final int initPosition;
//
//   CustomTabView({
//     required this.itemCount,
//     required this.tabBuilder,
//     required this.pageBuilder,
//     required this.stub,
//     required this.onPositionChange,
//     required this.onScroll,
//     required this.initPosition,
//   });
//
//   @override
//   _CustomTabsState createState() => _CustomTabsState();
// }
//
// class _CustomTabsState extends State<CustomTabView> with TickerProviderStateMixin {
//   late TabController controller;
//   late int _currentCount;
//   late int _currentPosition;
//
//   @override
//   void initState() {
//     // _currentPosition = widget.initPosition ?? 0;
//     _currentPosition = widget.initPosition;
//     controller = TabController(
//       length: widget.itemCount,
//       vsync: this,
//       initialIndex: _currentPosition,
//     );
//     controller.addListener(onPositionChange);
//     controller.animation?.addListener(onScroll);
//     _currentCount = widget.itemCount;
//     setState((){});
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(CustomTabView oldWidget) {
//     if (_currentCount != widget.itemCount) {
//       controller.animation?.removeListener(onScroll);
//       controller.removeListener(onPositionChange);
//       controller.dispose();
//
//       if (widget.initPosition != null) {
//         _currentPosition = widget.initPosition;
//       }
//
//       if (_currentPosition > widget.itemCount - 1) {
//         _currentPosition = widget.itemCount - 1;
//         _currentPosition = _currentPosition < 0 ? 0 :
//         _currentPosition;
//         if (widget.onPositionChange is ValueChanged<int>) {
//           WidgetsBinding.instance.addPostFrameCallback((_){
//             if(mounted) {
//               widget.onPositionChange(_currentPosition);
//             }
//           });
//         }
//       }
//
//       _currentCount = widget.itemCount;
//       setState(() {
//         controller = TabController(
//           length: widget.itemCount,
//           vsync: this,
//           initialIndex: _currentPosition,
//         );
//         controller.addListener(onPositionChange);
//         controller.animation?.addListener(onScroll);
//       });
//     } else if (widget.initPosition != null) {
//       controller.animateTo(widget.initPosition);
//     }
//
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void dispose() {
//     controller.animation!.removeListener(onScroll);
//     controller.removeListener(onPositionChange);
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // if (widget.itemCount < 1) return widget.stub ?? Container();
//     if (widget.itemCount < 1) return widget.stub ;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Container(
//           alignment: Alignment.center,
//           child: TabBar(
//             isScrollable: true,
//             controller: controller,
//             labelColor: Theme.of(context).primaryColor,
//             unselectedLabelColor: Theme.of(context).hintColor,
//             indicator: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Theme.of(context).primaryColor,
//                   width: 2,
//                 ),
//               ),
//             ),
//             tabs: List.generate(
//               widget.itemCount,
//                   (index) => widget.tabBuilder(context, index),
//             ),
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: controller,
//             children: List.generate(
//               widget.itemCount,
//                   (index) => widget.pageBuilder(context, index),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   onPositionChange() {
//     if (!controller.indexIsChanging) {
//       _currentPosition = controller.index;
//       if (widget.onPositionChange is ValueChanged<int>) {
//         widget.onPositionChange(_currentPosition);
//       }
//     }
//   }
//
//   onScroll() {
//     if (widget.onScroll is ValueChanged<double>) {
//       widget.onScroll(controller.animation!.value);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:web1/homeDash.dart';
import 'package:web1/homepage.dart';
import 'package:web1/models/listViewModel.dart';
import 'package:web1/responsive/desktop_body.dart';
import 'package:web1/responsive/tabBuiler.dart';
import 'package:web1/school/exams.dart';
import 'package:web1/school/schldash.dart';
import 'package:web1/school/studentList.dart';

import 'models/modulesViewer.dart';

// import 'drawwer.dart';

var moduleSent;

class HomePage extends StatefulWidget {
  // const MyDesktopBody({Key? key}) : super(key: key);
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
var width;
var height;
class _HomePageState extends State<HomePage> with TickerProviderStateMixin{


  List<String> modules = ['HomeScreen'];
  int modinitPosition = 0;

  var currentModules = [
    ModuleDetail(
        label: 'SchoolSys',
        title: 'School',
        icon: Icon(Icons.school,size: 80,),
        btnAction: ButtonActivateIntent(),
    ),
  ];

  moduleChanger() {
    print(moduleSent);
    if (moduleSent == null) {
      print('no module set');
    } else {
      print('updating modules');
      if (modules.contains('${moduleSent}')) {
        modinitPosition = modules.indexOf('${moduleSent}');
        setState(() {});
      } else {
        setState(() {
          modules.add('${moduleSent}');
        });
        modinitPosition = modules.indexOf('${moduleSent}');
        print('this is the position $modinitPosition');
        setState(() {});
      }
    }
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      moduleChanger();
    });
  }

  @override
  void initState() {
    // moduleChanger();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width;
    height = height;
    return Scaffold(
      // floatingActionButton:FloatingActionButton(
      //   onPressed: (){},
      //   child: IconButton(
      //     onPressed: () {
      //       modules[modinitPosition] == 'HomeScreen' ? setState((){}):
      //       setState(() {
      //         modules.remove(modules[modinitPosition]);
      //       });
      //     },
      //     icon: Icon(Icons.remove),
      //   ),
      // ),
      // drawer: Drawwer(),
      // backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Card(
            //   elevation: 2,
            //   child: Row(
            //     children: [
            //       RaisedButton(
            //         color: Colors.grey[100],
            //         onPressed: (){
            //           if(data.contains('Home')){
            //             initPosition = data.indexOf('Home');
            //             setState((){});
            //           }else{
            //             setState(() {
            //               data.add('Home');
            //             });
            //             initPosition = data.indexOf('Home');
            //             print('this is the position $initPosition');
            //             setState((){});
            //           }
            //         },
            //         child:  Text('Home'),
            //       ),
            //       RaisedButton(
            //         color: Colors.grey[100],
            //         onPressed: (){
            //           if(data.contains('Student')){
            //             initPosition = data.indexOf('Student');
            //             setState((){});
            //           }else{
            //             setState(() {
            //               data.add('Student');
            //             });
            //             initPosition = data.indexOf('Student');
            //
            //             setState((){});
            //           }
            //
            //         },
            //         child:  Text('Student'),
            //       ),
            //       RaisedButton(
            //         color: Colors.grey[100],
            //         onPressed: (){
            //           if(data.contains('Exams')){
            //             initPosition = data.indexOf('Exams');
            //             setState((){});
            //           }else{
            //             setState(() {
            //               data.add('Exams');
            //             });
            //             initPosition = data.indexOf('Exams');
            //             print('this is the position${initPosition}');
            //             setState((){});
            //           }
            //
            //         },
            //         child:  Text('Exams'),
            //       ),
            //     ],
            //   ),
            // ),
            Card(
              child: Container(
                width: width,
                height: height,
                child: CustomTabView(
                  modinitPosition: modinitPosition,
                  itemCount: modules.length,
                  tabBuilder: (context, index) => Tab(text: modules[index]),
                  pageBuilder: (context, index) => (
                      modules[index] == 'HomeScreen' ?
                      // HomeDash():
                      Column(
                        children: [
                          // ListView.builder(itemBuilder: itemBuilder)
                          Container(
                            width: width,
                            height: height * 0.8,
                            // child: Text('this '),

                            child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                ),
                                itemCount: currentModules.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ModuleViewer(moduleDetail: currentModules[index],);
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    child: Card(
                                      color: Colors.white10,
                                      child: Center(child: Text('$index')),
                                    ),
                                  );
                                }
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                if(modules.contains('SchoolSys')){
                                  print('exists');
                                  modinitPosition = modules.indexOf('SchoolSys');
                                  setState((){});
                                }else{
                                  setState(() {
                                    print('will add ');
                                    modules.add('SchoolSys');
                                  });
                                  modinitPosition = modules.indexOf('SchoolSys');
                                  print('this is the position $modinitPosition');
                                  setState((){});
                                }
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => const MyDesktopBody()),);
                              },
                              icon: Icon(Icons.school,color: Colors.blueAccent,)
                          )
                        ],
                      ):
                      modules[index] == 'SchoolSys'?
                      MyDesktopBody():
                      modules[index] == 'DocumentSys'?
                      Exams():
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
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget stub;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<double> onScroll;
  final int modinitPosition;

  CustomTabView({
    required this.itemCount,
    required this.tabBuilder,
    required this.pageBuilder,
    required this.stub,
    required this.onPositionChange,
    required this.onScroll,
    required this.modinitPosition,
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabView> with TickerProviderStateMixin {
  late TabController controller;
  late int _currentCount;
  late int _currentPosition;

  @override
  void initState() {
    // _currentPosition = widget.initPosition ?? 0;
    _currentPosition = widget.modinitPosition;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation?.addListener(onScroll);
    _currentCount = widget.itemCount;
    setState((){});
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      controller.animation?.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();

      if (widget.modinitPosition != null) {
        _currentPosition = widget.modinitPosition;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 :
        _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            if(mounted) {
              widget.onPositionChange(_currentPosition);
            }
          });
        }
      }

      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation?.addListener(onScroll);
      });
    } else if (widget.modinitPosition != null) {
      controller.animateTo(widget.modinitPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation!.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.itemCount < 1) return widget.stub ?? Container();
    if (widget.itemCount < 1) return widget.stub ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height * 0.04,
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).hintColor,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            tabs: List.generate(
              widget.itemCount,
                  (index) => widget.tabBuilder(context, index),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: List.generate(
              widget.itemCount,
                  (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }

  onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange(_currentPosition);
      }
    }
  }

  onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll(controller.animation!.value);
    }
  }
}
