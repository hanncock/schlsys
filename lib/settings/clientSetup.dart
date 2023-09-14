import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/settings/client_setup_details.dart';

import '../widgets/loading.dart';
import '../wrapper.dart';

class ClientSetup extends StatefulWidget {
  const ClientSetup({Key? key}) : super(key: key);

  @override
  State<ClientSetup> createState() => _ClientSetupState();
}

class _ClientSetupState extends State<ClientSetup> {

  List clients = [];

  getClients()async{
    print('fetching clients');
    var resu = await auth.clients();
    setState(() {
      clients = resu;
    });
  }


  addEditClient(var clientDet){
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
                      child: ClientSetupDetails(sessionStateStream: session, clientDetails: clientDet,),
                    ),
                  ),
                );
              });
        });
  }

  @override
  void initState(){
    getClients();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Card(
                elevation: 0,
                child: Container(
                    width: 12.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Colors.white
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Search Clients'),
                    )
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  addEditClient(null);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  getClients();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.refresh),
                ),
              )
            ],),
          clients.isEmpty ?  const Center(child: LoadingSpinCircle(),):
          Card(
            elevation: 2,
            child: Container(
              width: width,
              height: height -150,
              child: HorizontalDataTable(
                rowSeparatorWidget: const Divider(
                  color: Colors.black12,
                  height: 1.0,
                  thickness: 0.0,
                ),
                itemCount: clients.length ?? 0,
                leftHandSideColumnWidth: 10.w,
                rightHandSideColumnWidth: 90.w,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: (BuildContext context, index){
                  return InkWell(
                    onDoubleTap: (){
                      addEditClient([clients[index]]);
                    },
                    onTap: (){

                    },
                    child: Container(
                        width: 10.w,
                        height: 52,
                        color: index.isOdd?Colors.grey[100]:Colors.white,
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text('${clients[index]['clientName']}')
                    ),
                  );
                },
                rightSideItemBuilder: (BuildContext context, index){
                  return InkWell(
                    onDoubleTap: (){
                      addEditClient([clients[index]]);
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
                            child: Text('${clients[index]['clientEmail']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${clients[index]['clientPhone']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${clients[index]['clientAddress']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${clients[index]['clientContactName']}')
                        ),

                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child:  Text('${clients[index]['clientContactEmail']}'),
                        ),
                        Container(
                          width: 10.w,
                          height: 52,
                          color: index.isOdd?Colors.grey[100]:Colors.white,
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child:  Text('${clients[index]['clientContactPhone']}'),
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
        ],
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 10.w),
      _getTitleItemWidget('Email', 10.w),
      _getTitleItemWidget('Phone', 10.w),
      _getTitleItemWidget('Address', 10.w),
      _getTitleItemWidget('Contact Person', 10.w),
      _getTitleItemWidget('Contact Email', 10.w),
      _getTitleItemWidget('Contact Phone', 10.w),

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
