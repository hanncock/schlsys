import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:web1/custom_tab/keepAlive.dart';
import 'package:web1/custom_tab/tabsClass.dart';
import 'package:web1/settings/companies.dart';
import 'package:web1/settings/create_company.dart';
import 'package:web1/settings/create_user.dart';
import 'package:web1/wrapper.dart';

class CustomSet extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const CustomSet({Key? key,required this.sessionStateStream}) : super(key: key);

  @override
  State<CustomSet> createState() => _CustomSetState();
}

class _CustomSetState extends State<CustomSet>  with TickerProviderStateMixin{


  late StreamController sess ;
  // late TabController tabController;
  // @override
  // void initState() {
  //   super.initState();
  //   tabController = TabController(
  //     initialIndex: 0,
  //     length: 2,
  //     vsync: this,
  //   );
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   final theme = Theme.of(context);
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Row(
  //         children: [
  //
  //           Container(
  //             width: 400,
  //             child: TabBar(
  //               labelColor: Color.fromRGBO(4, 2, 46, 1),
  //               labelStyle: theme.textTheme.headline1,
  //               indicatorColor: Color.fromRGBO(4, 2, 46, 1),
  //               unselectedLabelColor: Colors.grey,
  //               controller: tabController,
  //               tabs: [
  //                 Text('الفاتورة'),
  //                 Text('دليفري'),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     body: Container(
  //       child: TabBarView(
  //         controller: tabController,
  //         children: [
  //           Container(
  //             color: Colors.red,
  //           ),
  //           Container(
  //             color: Colors.orange,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // @override
  // void dispose() {
  //   tabController.dispose();
  //   super.dispose();
  // }

  late TabController controller;
  // late int _currentCount;
  late int _currentPosition;

  List tabs = ['Settings Home'];
  late List menu_tabs = [
    Tabler(
        label: 'Company',
        screen: CreateCompany(sessionStateStream: widget.sessionStateStream,),
    ),
    // Tabler(
    //   label: 'User',
    //   screen: Createuser(sessionStateStream: widget.sessionStateStream,),
    // ),
    Tabler(
      label: 'Companies',
      screen: Companies(),
    )
  ];
  late final screns = <dynamic>[Createuser(sessionStateStream: widget.sessionStateStream)];
  late int tab_index = 0;

  // void onPositionChange(){
  //   if (!controller.indexIsChanging) {
  //     tab_index = controller.index;
  //     if (onPositionChange is ValueChanged<int>) {
  //       onPositionChange();
  //     }
  //   }
  //
  // }

  @override
  void initState() {
    super.initState();
    sess = widget.sessionStateStream;
    controller = new TabController(
      length: tabs.length,
      vsync: this,
      // initialIndex: tab_index,
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     // SizedBox(
      //     //   width: 200,
      //     // height: height,
      //     // child: ListView.builder(
      //     //     itemCount: tabs.length,
      //     //     itemBuilder: (context, index){
      //     //       return InkWell(
      //     //         onTap: (){
      //     //           setState(() {
      //     //             tabs.add('add this value');
      //     //           });
      //     //           print(tabs);
      //     //         },
      //     //         child: Card(
      //     //           child: Padding(
      //     //             padding: const EdgeInsets.all(8.0),
      //     //             child: Text('${tabs[index]}'),
      //     //           ),
      //     //         ),
      //     //       );
      //     // }),
      //     // ),
      //     Container(
      //       color: Colors.redAccent,
      //       width: 500,
      //       child: TabBar(
      //
      //         controller: controller,
      //         tabs: [
      //           Text('1'),
      //           Text('2'),
      //         ],
      //         // tabs: List.generate(
      //         //   tabs.length,(index)=>Text('${tabs[index]}')
      //         // ),
      //       ),
      //     ),
      //     Container(
      //       height: 400,
      //         color: Colors.yellow,
      //         child: TabBarView(
      //             controller: controller,
      //         children: [
      //           Container(
      //               height:200,
      //               child: Text('soke')
      //           ),
      //           Container(
      //               height: 200,
      //               child: Text('soke')
      //           )
      //         ],
      //         // children: List.generate(
      //         //     screns.length, (index) => Text('soke'))
      //         )
      //     )
      //   ],
      // ),

      body: DefaultTabController(
        initialIndex: 0,

        length: tabs.length,
        child: Row(
          children: [
            SizedBox(
              width: 180,
              height: height,
              child: ListView.builder(
                  itemCount: menu_tabs.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){

                        if(tabs.contains(menu_tabs[index].label)){

                          var active_index = tabs.indexOf(menu_tabs[index].label);

                          print('contains ${active_index}');

                          DefaultTabController.of(context).animateTo(active_index);

                        }else{

                          setState(() {
                            tabs.add(menu_tabs[index].label);
                            screns.add(menu_tabs[index].screen);
                          });

                          var active_index = tabs.indexOf(menu_tabs[index].label);
                          print('current index ${active_index}');
                          // setState(() {

                            DefaultTabController.of(context).animateTo(int.parse(active_index.toString()) );
                          // });

                          // DefaultTabController.of(context).animateTo((active_index +1 ) % 2);
                        }

                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${menu_tabs[index].label}'),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Column(
                children: [

                  Container(
                    color: Colors.grey,
                    width: width,
                    height: 40,
                    child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.all(3),
                        labelPadding: EdgeInsets.zero,
                        indicatorWeight: 4,
                        labelColor: Colors.redAccent,
                        unselectedLabelColor: Colors.white,
                        // indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white),
                      tabs: List.generate(
                          growable:true,
                          tabs.length, (index) => ConstrainedBox(
                        constraints: new BoxConstraints(
                          minWidth: 120.0,
                          maxWidth: 120.0,
                        ),
                        child: Card(
                          elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${tabs[index]}'),
                                  index == 0 ? Text(''): InkWell(
                                      onTap: (){
                                        tabs.removeAt(index);
                                        screns.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Icon(Icons.close,color: Colors.red,size: 12,)
                                  )
                                ],
                              ),
                            )
                        ),
                      )
                      )
                    ),
                  ),
                  Container(
                    height: (height - 40),
                    color: Colors.redAccent,
                    child: TabBarView(
                      children: List.generate(screns.length, (index) =>
                          KeepPageAlive(child: screns[index],)
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }


  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }


}
