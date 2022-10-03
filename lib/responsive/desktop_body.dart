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
class _MyDesktopBodyState extends State<MyDesktopBody> with TickerProviderStateMixin{

  List<String> data = ['Dashboard'];
  int initPosition = 0;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    width = width;
    height = height;
    return Scaffold(
        appBar: AppBar(
        title: Text('D E S K T O P',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
          backgroundColor: Colors.blueGrey,
      ),
        floatingActionButton:FloatingActionButton(
          onPressed: (){},
          child: IconButton(
            onPressed: () {
              data[initPosition] == 'Dashboard' ? setState((){}):
              setState(() {
                data.remove(data[initPosition]);
              });
            },
            icon: Icon(Icons.remove),
          ),
        ),
      drawer: Drawwer(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Card(
                                color: Colors.grey[200],
                                elevation: 2,
                                child: ClipPath(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        RaisedButton(
                                          color: Colors.grey[100],
                                          onPressed: (){
                                            if(data.contains('Home')){

                                            }else{
                                              setState(() {
                                                data.add('Home');
                                              });
                                              // print('current position: $index');
                                              initPosition = int.parse("Home");
                                              setState((){});
                                            }

                                          },
                                            child:  Text('Home'),
                                        ),
                                        RaisedButton(
                                          color: Colors.grey[100],
                                          onPressed: (){
                                            if(data.contains('Student')){

                                            }else{
                                              setState(() {
                                                data.add('Student');
                                              });
                                              initPosition = int.parse("Student");
                                              setState((){});
                                            }

                                          },
                                          child:  Text('Student'),
                                        ),
                                        RaisedButton(
                                          color: Colors.grey[100],
                                          onPressed: (){
                                            if(data.contains('Exams')){
                                              CustomTabView(
                                                initPosition: initPosition,
                                                itemCount: data.length,
                                                tabBuilder: (context, initPosition) => Tab(text: data[initPosition]),
                                                pageBuilder: (context, initPosition) => Text('its page ${data[initPosition]}'),
                                                stub: Container(),
                                                onScroll: (double value) {  },
                                                onPositionChange: (int value) {  }

                                              );
                                            }else{
                                              setState(() {
                                                data.add('Exams');
                                              });
                                              CustomTabView(
                                                  initPosition: initPosition,
                                                  itemCount: data.length,
                                                  tabBuilder: (context, initPosition) => Tab(text: data[initPosition]),
                                                  pageBuilder: (context, initPosition) => Text('its page ${data[initPosition]}'),
                                                  stub: Container(),
                                                  onScroll: (double value) {  },
                                                  onPositionChange: (int value) {  }

                                              );
                                              // print('current position: $index');
                                              initPosition = int.parse("Exams");
                                              print('this is the position${initPosition}');
                                              setState((){});
                                            }

                                          },
                                          child:  Text('Exams'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          ],
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
                        tabBuilder: (context, index) => Tab(text: data[index]),
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
                    // child: Container(
                    //   width: 400,
                    //   // height: 50,
                    //   child: Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: TabBar(
                    //         controller: _tabController,
                    //       isScrollable: true,
                    //       labelColor: Colors.black,
                    //         indicator: BoxDecoration(
                    //           color: Colors.grey[300],
                    //           borderRadius: BorderRadius.circular(5.0)
                    //         ),
                    //         // labelPadding: EdgeInsets.only(left: 8.0,right: 8.0),
                    //         unselectedLabelColor: Colors.grey,
                    //       tabs: _tabs,
                    //         // tabs: [
                    //         //   Tab(text:"Soke"),
                    //         //   Tab(text: 'soke2',),
                    //         // ]
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
            // Expanded(
            //   child: TabBarView(
            //       controller: _tabController,
            //     children: getWidgets(),
            //       // children: [
            //       //   Column(
            //       //     children: [
            //       //       Row(
            //       //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       //         // crossAxisAlignment: CrossAxisAlignment.end,
            //       //         children: [
            //       //           Padding(
            //       //             padding: const EdgeInsets.all(8.0),
            //       //             child: Row(
            //       //               children: [
            //       //                 Card(
            //       //                   color: Colors.white,
            //       //                   elevation: 2,
            //       //                   child: ClipPath(
            //       //                     child: Container(
            //       //                       height: height * 0.2,
            //       //                       width: width / 4,
            //       //                       child: Padding(
            //       //                         padding: const EdgeInsets.all(8.0),
            //       //                         child: Center(
            //       //                           child: Row(
            //       //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       //                             crossAxisAlignment: CrossAxisAlignment.center,
            //       //                             children: [
            //       //                               Column(
            //       //                                 children: [
            //       //                                   Icon(
            //       //                                     Icons.group,
            //       //                                     size: width * 0.05,
            //       //                                     color: Colors.brown,
            //       //                                   ),
            //       //                                   Text('Students')
            //       //                                 ],
            //       //                               ),
            //       //
            //       //                               Divider(height: height * 0.5,color: Colors.red,),
            //       //                               Text('12,000',style: TextStyle(
            //       //                                   fontSize: width * 0.03
            //       //                               ),)
            //       //
            //       //                             ],
            //       //                           ),
            //       //                         ),
            //       //                       ),
            //       //                       decoration: BoxDecoration(
            //       //                           border: Border(right: BorderSide(color: Colors.brown, width: 5))),
            //       //                     ),
            //       //                     clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
            //       //                         borderRadius: BorderRadius.circular(3))),
            //       //                   ),
            //       //                 ),
            //       //                 // SizedBox(width: width * 0.04,),
            //       //                 Card(
            //       //                   color: Colors.white,
            //       //                   elevation: 2,
            //       //                   child: ClipPath(
            //       //                     child: Container(
            //       //                       height: height * 0.2,
            //       //                       width: width / 4,
            //       //                       child: Padding(
            //       //                         padding: const EdgeInsets.all(8.0),
            //       //                         child: Center(
            //       //                           child: Row(
            //       //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       //                             crossAxisAlignment: CrossAxisAlignment.center,
            //       //                             children: [
            //       //                               Column(
            //       //                                 children: [
            //       //                                   Icon(
            //       //                                     Icons.groups,
            //       //                                     size: width * 0.05,
            //       //                                     color: Colors.blue,
            //       //                                   ),
            //       //                                   Text('Teachers')
            //       //                                 ],
            //       //                               ),
            //       //
            //       //                               Divider(height: height * 0.5,color: Colors.red,),
            //       //                               Text('12,000',style: TextStyle(
            //       //                                   fontSize: width * 0.03
            //       //                               ),)
            //       //
            //       //                             ],
            //       //                           ),
            //       //                         ),
            //       //                       ),
            //       //                       decoration: BoxDecoration(
            //       //                           border: Border(right: BorderSide(color: Colors.blue, width: 5))),
            //       //                     ),
            //       //                     clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
            //       //                         borderRadius: BorderRadius.circular(3))),
            //       //                   ),
            //       //                 ),
            //       //                 // SizedBox(width: width * 0.04,),
            //       //                 Card(
            //       //                   color: Colors.white,
            //       //                   elevation: 2,
            //       //                   child: ClipPath(
            //       //                     child: Container(
            //       //                       height: height * 0.2,
            //       //                       width: width / 4,
            //       //                       child: Padding(
            //       //                         padding: const EdgeInsets.all(8.0),
            //       //                         child: Center(
            //       //                           child: Row(
            //       //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       //                             crossAxisAlignment: CrossAxisAlignment.center,
            //       //                             children: [
            //       //                               Column(
            //       //                                 children: [
            //       //                                   Icon(
            //       //                                     Icons.person_add_alt_1_sharp,
            //       //                                     size: width * 0.05,
            //       //                                     color: Colors.red,
            //       //                                   ),
            //       //                                   Text('Parents')
            //       //                                 ],
            //       //                               ),
            //       //
            //       //                               Divider(height: height * 0.5,color: Colors.red,),
            //       //                               Text('12,000',style: TextStyle(
            //       //                                   fontSize: width * 0.03
            //       //                               ),)
            //       //
            //       //                             ],
            //       //                           ),
            //       //                         ),
            //       //                       ),
            //       //                       decoration: BoxDecoration(
            //       //                           border: Border(right: BorderSide(color: Colors.red, width: 5))),
            //       //                     ),
            //       //                     clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
            //       //                         borderRadius: BorderRadius.circular(3))),
            //       //                   ),
            //       //                 ),
            //       //                 // SizedBox(width: width * 0.04,),
            //       //                 Card(
            //       //                   color: Colors.white,
            //       //                   elevation: 2,
            //       //                   child: ClipPath(
            //       //                     child: Container(
            //       //                       height: height * 0.2,
            //       //                       width: width / 5,
            //       //                       child: Padding(
            //       //                         padding: const EdgeInsets.all(8.0),
            //       //                         child: Center(
            //       //                           child: Row(
            //       //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       //                             crossAxisAlignment: CrossAxisAlignment.center,
            //       //                             children: [
            //       //                               Column(
            //       //                                 children: [
            //       //                                   Icon(
            //       //                                     Icons.monetization_on_outlined,
            //       //                                     size: width * 0.05,
            //       //                                     color: Colors.green,
            //       //                                   ),
            //       //                                   Text('Finance')
            //       //                                 ],
            //       //                               ),
            //       //                               Divider(height: height * 0.5,color: Colors.red,),
            //       //                               Text('12,000',style: TextStyle(
            //       //                                   fontSize: width * 0.03
            //       //                               ),)
            //       //                             ],
            //       //                           ),
            //       //                         ),
            //       //                       ),
            //       //                       decoration: BoxDecoration(
            //       //                           border: Border(right: BorderSide(color: Colors.green, width: 5))),
            //       //                     ),
            //       //                     clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
            //       //                         borderRadius: BorderRadius.circular(3))),
            //       //                   ),
            //       //                 ),
            //       //               ],
            //       //             ),
            //       //           ),
            //       //         ],
            //       //       ),
            //       //       Row(
            //       //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       //         crossAxisAlignment: CrossAxisAlignment.start,
            //       //         children: [
            //       //           Card(
            //       //               color: Colors.white,
            //       //               elevation: 2,
            //       //               child: ClipPath(
            //       //                   child: Container(
            //       //                       height: height * 0.3,
            //       //                       width: width /2.5,
            //       //                       child: Padding(padding: EdgeInsets.all(8.0),
            //       //                           child: Column(
            //       //                             children: [
            //       //                               Padding(
            //       //                                 padding: const EdgeInsets.all(8.0),
            //       //                                 child: Row(
            //       //                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       //                                   children: [
            //       //                                     Text(
            //       //                                       'Collection & Expenses',
            //       //                                       textAlign: TextAlign.center,
            //       //                                       style: TextStyle(
            //       //                                         color: Colors.black45,
            //       //                                         fontWeight: FontWeight.bold,
            //       //                                       ),
            //       //                                     ),
            //       //                                     SizedBox(width: width * 0.1,),
            //       //                                     Row(
            //       //                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       //                                       children: [
            //       //                                         Icon(Icons.arrow_drop_down,color: Colors.green,),
            //       //                                         SizedBox(width: width * 0.01,),
            //       //                                         Icon(Icons.refresh,color: Colors.blue,),
            //       //                                         SizedBox(width: width * 0.01,),
            //       //                                         Icon(Icons.cancel,color: Colors.redAccent,),
            //       //                                       ],
            //       //                                     ),
            //       //
            //       //                                   ],
            //       //                                 ),
            //       //                               ),
            //       //                               Divider(height: height * 0.02,),
            //       //                               Text('Chart Goes Here ${width /3}')
            //       //                             ],
            //       //                           )
            //       //
            //       //                       )
            //       //                   )
            //       //               )
            //       //           ),
            //       //           Card(
            //       //               color: Colors.white,
            //       //               elevation: 2,
            //       //               child: ClipPath(
            //       //                   child: Container(
            //       //                       height: height * 0.6,
            //       //                       width: width /3.5,
            //       //                       child: Padding(padding: EdgeInsets.all(8.0),
            //       //                           child: Column(
            //       //                             children: [
            //       //                               Padding(
            //       //                                 padding: const EdgeInsets.all(8.0),
            //       //                                 child: Row(
            //       //                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       //                                   children: [
            //       //                                     Text(
            //       //                                       'Notice Board',
            //       //                                       textAlign: TextAlign.center,
            //       //                                       style: TextStyle(
            //       //                                         color: Colors.black45,
            //       //                                         fontWeight: FontWeight.bold,
            //       //                                       ),
            //       //                                     ),
            //       //                                   ],
            //       //                                 ),
            //       //                               ),
            //       //                               Divider(height: height * 0.02,),
            //       //                               Text('Text Goes Here${width /4}')
            //       //                             ],
            //       //                           )
            //       //
            //       //                       )
            //       //                   )
            //       //               )
            //       //           ),
            //       //           Card(
            //       //               color: Colors.white,
            //       //               elevation: 2,
            //       //               child: ClipPath(
            //       //                   child: Container(
            //       //                       height: height * 0.6,
            //       //                       width: width /3.5,
            //       //                       child: Padding(padding: EdgeInsets.all(8.0),
            //       //                           child: Column(
            //       //                             children: [
            //       //                               Padding(
            //       //                                 padding: const EdgeInsets.all(8.0),
            //       //                                 child: Row(
            //       //                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       //                                   children: [
            //       //                                     Text(
            //       //                                       'Recent Activities',
            //       //                                       textAlign: TextAlign.center,
            //       //                                       style: TextStyle(
            //       //                                         color: Colors.black45,
            //       //                                         fontWeight: FontWeight.bold,
            //       //                                       ),
            //       //                                     ),
            //       //                                   ],
            //       //                                 ),
            //       //                               ),
            //       //                               Divider(height: height * 0.02,),
            //       //                               Text('Text Goes Here ${width /4}')
            //       //                             ],
            //       //                           )
            //       //
            //       //                       )
            //       //                   )
            //       //               )
            //       //           ),
            //       //
            //       //         ],
            //       //       ),
            //       //     ],
            //       //   ),
            //       //   Text('are'),
            //       // ]
            //   ),
            // ),

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
    _currentPosition = widget.initPosition ?? 0;
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
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
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


