import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/invoicing/create_items.dart';

import '../wrapper.dart';

class Items extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const Items({Key? key,required this.sessionStateStream}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {

  List items = [];


  getItems()async{
    var resu = await auth.getItems(Userdata['allowedCompanies'][0]['companyId']);
    print(resu);
    setState(() {
      items = resu['data'];
    });
    print(items);
  }

  @override
  void initState(){
    getItems();
  }

  addEditCompany(var userDetails){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    // color: Colors.redAccent,
                    // child: Text('soke'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CreateItems(sessionStateStream: session, itemsList: null,),
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 18.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:Colors.white
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Search users'),
                  )
              ),
              ElevatedButton(
                onPressed: () {
                  addEditCompany(null);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // getusers();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.refresh),
                ),
              )
            ],),
          InkWell(
            onDoubleTap: (){
              // addEditCompany([users[currentUserId]]);
            },
            child: Card(
              elevation: 1,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                          dataRowMinHeight: 50,
                          dataRowMaxHeight: 50,
                          // columnSpacing: 20,
                          headingRowColor:MaterialStateColor.resolveWith((states) => Colors.blueAccent),
                          showCheckboxColumn: false,
                          border: TableBorder.all(width: 0.03,),
                          columns: const [
                            DataColumn(label: Text('Product',style:TextStyle(color:Colors.white))),
                            DataColumn(label: Text('Description',style:TextStyle(color:Colors.white))),
                            DataColumn(label: Text('Unit Price',style:TextStyle(color:Colors.white))),
                            // DataColumn(label: Text('Phome',style:TextStyle(color:Colors.white))),
                            // DataColumn(label: Text('Gender',style:TextStyle(color:Colors.white))),
                          ],
                          rows: List.generate(

                              items.length, (index) => DataRow(
                              onSelectChanged: (val){
                                setState(() {
                                  print(index);
                                  // currentUserId = index;
                                });
                              },
                              color: index.isOdd ? MaterialStateProperty.resolveWith((states) => Colors.white): MaterialStateProperty.resolveWith((states) => Colors.grey[100]),//Colors.white : Colors.grey[200],

                              cells: [
                                // DataCell(Row(
                                //   children: [
                                //     const CircleAvatar(backgroundColor: Colors.brown,radius: 18,),
                                //     SizedBox(width: 1.w,),
                                //     Text('${items[index]['fName']}\t' '${items[index]['sName']}'),
                                //   ],
                                // )),
                                DataCell(Text('${items[index]['prodName']}')),
                                DataCell(Text('${items[index]['description']}')),
                                DataCell(Text('Ksh ${items[index]['unitPrice']}')),
                                // DataCell(Text('${items[index]['gender']}')),
                              ]
                          )).reversed.toList()
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
