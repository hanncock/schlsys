// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
//
// class MyDesktopBody extends StatelessWidget {
//   const MyDesktopBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//         title: Text('D E S K T O P'),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.deepPurple[200],
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: Container(
//                         height: 200,
//                         // width: 200,
//                         color: Colors.deepPurple[400],
//                         ),
//                     ),
//                   ),
//
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: 8,
//                       itemBuilder: (context, index) {
//
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 120,
//                             color: Colors.deepPurple[300],
//                           ),
//                         );
//                       })
//                     ),
//               ]),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: 200,
//                 color: Colors.deepPurple[300],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:web1/homepage.dart';
import 'package:web1/responsive/tabBuiler.dart';
import 'package:web1/school/exams.dart';
import 'package:web1/school/schldash.dart';
import 'package:web1/school/studentList.dart';

import 'drawwer.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}
var width;
var height;
class _MyDesktopBodyState extends State<MyDesktopBody> with /*TickerProviderStateMixin*/ AutomaticKeepAliveClientMixin<MyDesktopBody>{

@override
bool get wantKeepAlive => true;
  List<String> data = ['Dashboard'];
  // // List<Tab> data = [
  // //   const Tab(icon: IconButton(onPressed: null, icon: Icon(Icons.close)), child: const Text('Tab One')),
  // //   const Tab(icon: Icon(Icons.looks_two), text: 'Tab Two'),
  // //   const Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
  // // ];
  // var data = [
  //   'Dashboard'
  // ];
  int initPosition = 0;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width;
    height = height;
    return Scaffold(
      //   appBar: AppBar(
      //   title: Text('D E S K T O P',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold
      //     ),),
      //   centerTitle: true,
      //     backgroundColor: Colors.blueGrey,
      //     actions: [
      //       IconButton(
      //           onPressed: (){},
      //           icon: Icon(Icons.minimize,size: 15,)
      //       ),
      //       IconButton(
      //           onPressed: (){},
      //           icon: Icon(Icons.close,size: 15,)
      //       )
      //     ],
      // ),
      //   floatingActionButton:FloatingActionButton(
      //     onPressed: (){},
      //     child: IconButton(
      //       onPressed: () {
      //         data[initPosition] == 'Dashboard' ? setState((){}):
      //         setState(() {
      //           data.remove(data[initPosition]);
      //         });
      //       },
      //       icon: Icon(Icons.remove),
      //     ),
      //   ),
      drawer: Drawwer(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
              Card(
                elevation: 2,
                child: Row(
                  children: [
                    RaisedButton(
                      color: Colors.grey[100],
                      onPressed: (){
                        if(data.contains('Home')){
                          initPosition = data.indexOf('Home');
                          setState((){});
                        }else{
                          setState(() {
                            data.add('Home');
                          });
                          initPosition = data.indexOf('Home');
                          print('this is the position $initPosition');
                          setState((){});
                        }
                      },
                        child:  Text('Home'),
                    ),
                    RaisedButton(
                      color: Colors.grey[100],
                      onPressed: (){
                        if(data.contains('Student')){
                          // initPosition = data.indexOf('Student');
                          initPosition = data.indexOf('Student');
                          setState((){});
                        }else{
                          setState(() {
                            data.add('Student');
                          });
                          initPosition = data.indexOf('Student');

                          setState((){});
                        }

                      },
                      child:  Text('Student'),
                    ),
                    RaisedButton(
                      color: Colors.grey[100],
                      onPressed: (){
                        if(data.contains('Exams')){
                          initPosition = data.indexOf('Exams');
                          setState((){});
                        }else{
                          setState(() {
                            data.add('Exams');
                          });
                          initPosition = data.indexOf('Exams');
                          print('this is the position${initPosition}');
                          setState((){});
                        }

                      },
                      child:  Text('Exams'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  width: width,
                  height: height * 0.9,
                  child: CustomTabView(
                    initPosition: initPosition,
                    itemCount: data.length,
                    tabBuilder: (context, index) => Tab(text: data[index].toString()),
                    pageBuilder: (context, index) => (
                        data[index] == 'Dashboard' ?
                            SchoolDash():
                        data[index] == 'Student'?
                            StudentList():
                        data[index] == 'Exams'?
                            Exams():
                        Text('first ${data[index]}')
                    ),

                    onPositionChange: (index){
                      print('current position: $index');
                      initPosition = index;
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
  final int initPosition;

  CustomTabView({
    required this.itemCount,
    required this.tabBuilder,
    required this.pageBuilder,
    required this.stub,
    required this.onPositionChange,
    required this.onScroll,
    required this.initPosition,
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
    _currentPosition = widget.initPosition;
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

      if (widget.initPosition != null) {
        _currentPosition = widget.initPosition;
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
    } else if (widget.initPosition != null) {
      controller.animateTo(widget.initPosition);
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
          height: MediaQuery.of(context).size.height * 0.04,
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            onTap: (index){
              print('will close');
    },
            // labelColor: Theme.of(context).primaryColor,
            labelColor: Colors.white,
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


