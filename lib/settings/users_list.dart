import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/settings/create_user.dart';

import '../wrapper.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  List users = [];
  var currentUserId;


  getusers()async{
    var resu = await auth.users();
    print('reloading');
    print(resu);
    print('reloading done');
    setState(() {
      users = resu;
    });
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
                      child: Createuser(sessionStateStream: session, userDetails: userDetails,),
                    ),
                  ),
                );
              });
        });
  }

  @override
  void initState(){
    getusers();
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
                  getusers();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.refresh),
                ),
              )
            ],),
          Card(
            elevation: 2,
            child: Container(
              width: width,
              height: height -140,
              child: HorizontalDataTable(
                rowSeparatorWidget: const Divider(
                  color: Colors.black12,
                  height: 1.0,
                  thickness: 0.0,
                ),
                itemCount: users.length ?? 0,
                leftHandSideColumnWidth: 20.w,
                rightHandSideColumnWidth: 90.w,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: (BuildContext context, index){
                  return InkWell(
                    onDoubleTap: (){
                      addEditCompany([users[index]]);
                    },
                    onTap: (){

                    },
                    child: Container(
                        width: 20.w,
                        height: 52,
                        color: index.isOdd?Colors.grey[100]:Colors.white,
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.brown,
                              radius: 18,
                              // backgroundImage: users[index]['photo']== null ?  :NetworkImage("${users[index]['photo']}"),
                              child: users[index]['photo'] == null ? Text('-'): Image.network(auth.url+'/'+users[index]['photo']),
                            ),
                            SizedBox(width: 1.w,),
                            Text('${users[index]['fName']}\t' '${users[index]['sName']}'),
                          ],
                        ),
                    ),
                  );
                },
                rightSideItemBuilder: (BuildContext context, index){
                  return InkWell(
                    onDoubleTap: (){
                      addEditCompany([users[index]]);
                    },
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${users[index]['email']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${users[index]['id']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${users[index]['phoneNum']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${users[index]['gender']}')
                        ),

                      ],
                    ),
                  );
                },
                //   leftSideItemBuilder:[],
                // rightSideItemBuilder: ,

              ),
            ),
          ),
          // InkWell(
          //   onDoubleTap: (){
          //     addEditCompany([users[currentUserId]]);
          //   },
          //   child: Card(
          //    child: Row(
          //      children: [
          //        Expanded(
          //          child: DataTable(
          //              dataRowMinHeight: 50,
          //              dataRowMaxHeight: 50,
          //              // columnSpacing: 20,
          //              headingRowColor:MaterialStateColor.resolveWith((states) => Colors.blueAccent),
          //              showCheckboxColumn: false,
          //              border: TableBorder.all(width: 0.03,),
          //              columns: const [
          //                DataColumn(label: Text('Names',style:TextStyle(color:Colors.white))),
          //                DataColumn(label: Text('Email',style:TextStyle(color:Colors.white))),
          //                DataColumn(label: Text('Id No',style:TextStyle(color:Colors.white))),
          //                DataColumn(label: Text('Phome',style:TextStyle(color:Colors.white))),
          //                DataColumn(label: Text('Gender',style:TextStyle(color:Colors.white))),
          //              ],
          //              rows: List.generate(
          //
          //                  users.length, (index) => DataRow(
          //                  onSelectChanged: (val){
          //                    setState(() {
          //                      print(index);
          //                      currentUserId = index;
          //                    });
          //                  },
          //                  color: index.isOdd ? MaterialStateProperty.resolveWith((states) => Colors.white): MaterialStateProperty.resolveWith((states) => Colors.grey[100]),//Colors.white : Colors.grey[200],
          //
          //                  cells: [
          //                DataCell(Row(
          //                  children: [
          //                    const CircleAvatar(backgroundColor: Colors.brown,radius: 18,),
          //                    SizedBox(width: 1.w,),
          //                    Text('${users[index]['fName']}\t' '${users[index]['sName']}'),
          //                  ],
          //                )),
          //                DataCell(Text('${users[index]['email']}')),
          //                DataCell(Text('${users[index]['idNo']}')),
          //                DataCell(Text('${users[index]['phoneNum']}')),
          //                DataCell(Text('${users[index]['gender']}')),
          //                  ]
          //              )).reversed.toList()
          //          ),
          //        ),
          //      ],
          //    ),
          //   ),
          // )
        ],
      ),
    );
  }
  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 10.w),
      _getTitleItemWidget('Email', 10.w),
      _getTitleItemWidget('iD', 10.w),
      _getTitleItemWidget('Phone', 10.w),
      _getTitleItemWidget('Gender', 10.w),
    ];
  }

  Widget _getTitleItemWidget(String label, double widh) {
    return Container(
      width: widh,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
    );
  }
}
