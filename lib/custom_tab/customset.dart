import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/custom_tab/keepAlive.dart';
import 'package:web1/custom_tab/tabsClass.dart';
import 'package:web1/invoicing/item_for_sale.dart';
import 'package:web1/messaging/Email/email.dart';
import 'package:web1/messaging/Sms/sms.dart';
import 'package:web1/settings/companies.dart';
import 'package:web1/settings/create_company.dart';
import 'package:web1/settings/users_list.dart';
import 'package:web1/wrapper.dart';

import '../invoicing/invoice_list.dart';
import '../settings/clientSetup.dart';

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

  List tabs = ['Settings'];
  late List menu_tabs = [
    // Tabler(
    //     label: 'Company',
    //     screen: CreateCompany(sessionStateStream: widget.sessionStateStream, companyDetails: null,),
    //   vicons: const Icon(Icons.ac_unit_sharp),
    // ),
    Tabler(
      label: 'Users',
      // screen: Createuser(sessionStateStream: widget.sessionStateStream,),
      screen: const UsersList(),
      vicons: const Icon(Icons.person_add_alt_1_outlined),
    ),
    Tabler(
      label: 'Companies',
      screen: const Companies(),
      vicons: const Icon(Icons.warehouse),
    ),
    Tabler(
      label: 'Client Setup',
      screen: const ClientSetup(),
      vicons: const Icon(Icons.message),
    ),
    Tabler(
      label: 'Email',
      screen: const Emailing(),
      vicons: const Icon(Icons.email),
    ),
    Tabler(
      label: 'Messaging',
      screen: Messaging(sessionStateStream: widget.sessionStateStream,),
      vicons: const Icon(Icons.message),
    ),
    Tabler(
      label: 'Invoice',
      screen: InvoicingList(sessionStateStream: widget.sessionStateStream,),
      vicons: const Icon(Icons.receipt_long),
    ),
    Tabler(
      label: 'Items',
      screen: Items(sessionStateStream: widget.sessionStateStream,),
      vicons: const Icon(Icons.local_grocery_store),
    ),

  ];
  // late final screns = <dynamic>[Createuser(sessionStateStream: widget.sessionStateStream)];
  // late final screns = <dynamic>[CreateCompany(sessionStateStream: widget.sessionStateStream,companyDetails: null,)];
  late final screns = <dynamic>[const ClientSetup()];
  late int tab_index = 0;

  @override
  void initState() {
    super.initState();
    sess = widget.sessionStateStream;
    controller = TabController(
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

      body: Column(
        children: [
          Card(
            color: Colors.blueAccent.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${Userdata['allowedCompanies'][0]['name']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  Container(
                    width: 20.w,
                    height: 20,
                    // color: :Colors.white,
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CircleAvatar(backgroundColor: Colors.brown,radius: 18,),
                        SizedBox(width: 1.w,),
                        Text('${Userdata['firstName']}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              initialIndex: 0,

              length: tabs.length,
              child: Row(
                children: [
                  Card(
                    elevation: 3,
                    shadowColor: Colors.black,
                    child: ConstrainedBox(

                      // minWidth: 16.w,
                      // height: height,
                      constraints: BoxConstraints(
                        minWidth: 140,
                        maxWidth: 140,
                        minHeight: height,
                        maxHeight: height
                      ),
                      child: ListView.builder(
                          itemCount: menu_tabs.length,
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: (){

                                if(tabs.contains(menu_tabs[index].label)){

                                  var activeIndex = tabs.indexOf(menu_tabs[index].label);

                                  print('contains $activeIndex');

                                  DefaultTabController.of(context).animateTo(activeIndex);

                                }else{

                                  setState(() {
                                    tabs.add(menu_tabs[index].label);
                                    screns.add(menu_tabs[index].screen);
                                  });

                                  var activeIndex = tabs.indexOf(menu_tabs[index].label);
                                  print('current index $activeIndex');
                                  // setState(() {

                                    DefaultTabController.of(context).animateTo(int.parse(activeIndex.toString()) );
                                  // });

                                  // DefaultTabController.of(context).animateTo((active_index +1 ) % 2);
                                }

                              },
                              child: Card(
                                elevation: 3,
                                shadowColor: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      menu_tabs[index].vicons,
                                      SizedBox(width: 10,),
                                      Text('${menu_tabs[index].label}'),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [

                        Container(
                          color: Colors.grey,
                          width: width,
                          height: 42,
                          child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              padding: EdgeInsets.zero,
                              indicatorPadding: const EdgeInsets.all(3),
                              labelPadding: EdgeInsets.zero,
                              indicatorWeight: 4,
                              labelColor: Colors.redAccent,
                              unselectedLabelColor: Colors.white,
                              // indicatorSize: TabBarIndicatorSize.label,
                              indicator: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.white),
                            tabs: List.generate(
                                growable:true,
                                tabs.length, (index) => ConstrainedBox(
                              constraints: const BoxConstraints(
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
                                        index == 0 ? const Text(''): InkWell(
                                            onTap: (){
                                              tabs.removeAt(index);
                                              screns.removeAt(index);
                                              setState(() {});
                                            },
                                            child: const Icon(Icons.close,color: Colors.red,size: 12,)
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            )
                            )
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // height: (height - 40),
                            // color: Colors.redAccent,
                            child: TabBarView(
                              children: List.generate(screns.length, (index) =>
                                  KeepPageAlive(child: screns[index],)
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }


  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }


}
