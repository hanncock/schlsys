import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/messaging/Sms/smsSetup.dart';
import '../../wrapper.dart';

class Messaging extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;

  // final StreamController<SessionState> sessionStateStream;
   const Messaging({Key? key, required this.sessionStateStream}) : super(key: key);

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {

  var selected = 'singleuser';
  var phoneNum;
  var message;

  final fieldText = TextEditingController();
  ScrollController listScrollController = ScrollController();
  void clearText() {
    fieldText.clear();
  }


  // sendSms(phoneNum,message)async{
  //
  //   var url = 'https://api.africastalking.com/version1/messaging';
  //   var bodyFields = {
  //       'username': 'soke',
  //       'to': phoneNum,
  //       'message': message
  //     };
  //   final response = await http.post(Uri.parse(url),
  //       body: bodyFields,
  //       headers: {
  //         'apikey': '41928f753d83cfa1c413d2ff71075de523f385b7b8a0a267b334353547ee8a6e',
  //         'Accept': 'application/json',
  //         // 'Content-Type': 'application/x-www-form-urlencoded'
  //         'Content-Type':'application/json; charset-UTF-8'
  //       }
  //   );
  //   // print(response.body);
  //   var data = jsonDecode(response.body);
  //   print(data['SMSMessageData']['Recipients']);
  //
  //
  //
  //   // var url = 'https://api.africastalking.com/version1/messaging?username=soke&lastReceivedId=ATXid_719a132c745b0b438020e19a6ad240c5';
  //   // var url = 'https://api.africastalking.com/version1/messaging?username=soke';
  //   // final response = await http.get(Uri.parse(url),
  //   //     headers: {
  //   //       'apikey': '41928f753d83cfa1c413d2ff71075de523f385b7b8a0a267b334353547ee8a6e',
  //   //       'Accept': 'application/json'
  //   //     }
  //   // );
  //   // print(response.body);
  // }

  var smsConfig;
  List messagesList = [];
  List mesoInView = [];

  getConfigs()async{

    var resu = await auth.smsConfigs(Userdata['allowedCompanies'][0]['companyId']);
    setState((){
      smsConfig = resu['data'];
    });
    print(resu['data']);

  }

  getMeso()async{

    var resu = await auth.getMessages(Userdata['allowedCompanies'][0]['companyId']);
    setState((){
      messagesList = resu['data'];
    });
    print(resu['data']);

  }

  setupSMS(var userDetails){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SMSSetup(smsConfigDet: smsConfig),
                    ),
                  ),
                );
              });
        });
  }

  @override
  void initState(){
    super.initState();
    print('fetching');
    getConfigs();
    getMeso();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Card(
                    elevation: 0,
                    child: Container(
                        width: 20.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:Colors.white
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Search Mail'),
                        )
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // addEditCompany(null);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getConfigs();
                      getMeso();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.refresh),
                    ),
                  )
                ],),
              ElevatedButton(
                onPressed: () {
                  print('loadinv');
                  setupSMS(smsConfig);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Setup SMS'),
                      Icon(Icons.settings_applications),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width -500,
                height:500,
                child:HorizontalDataTable(

                  rowSeparatorWidget: const Divider(
                    color: Colors.black12,
                    height: 1.0,
                    thickness: 0.0,
                  ),
                  itemCount: messagesList.length ?? 0,
                  leftHandSideColumnWidth: 10.w,
                  rightHandSideColumnWidth: 90.w,
                  isFixedHeader: true,
                  headerWidgets: _getTitleWidget(),
                  leftSideItemBuilder: (BuildContext context, index){
                    return InkWell(
                      onTap: (){
                        mesoInView.add(messagesList[index]);
                        print(mesoInView[index]);
                      },
                      child: Container(
                          width: 10.w,
                          height: 52,
                          color: index.isOdd?Colors.grey[100]:Colors.white,
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text('${messagesList[index]['number_to']}')
                      ),
                    );
                  },
                  rightSideItemBuilder: (BuildContext context, index){
                    return Row(
                      children: [
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${messagesList[index]['messageId']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${messagesList[index]['message']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${messagesList[index]['cost']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${messagesList[index]['status']}')
                        ),
                      ],
                    );
                  },
                  //   leftSideItemBuilder:[],
                  // rightSideItemBuilder: ,

                ),
                // child: Text('$messagesList'),
              ),
              // Text('${smsConfig}'),
              Container(
                margin: const EdgeInsets.all(15.0),
                // padding: const EdgeInsets.all(1.0),
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) => val!.isEmpty ? "Number" : null,
                      onChanged: (val){setState(() => phoneNum = val);},
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: selected == 'multipleusers' ? 'input numbers separated by commas ,' :'Phone Number',
                        // hintStyle: placeholderfont,
                        // suffixIcon: Icon(Icons.account_box),
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                    ),
                     Text('$mesoInView'),
                     Expanded(
                      // child: ListView.builder(itemBuilder: itemBuilder),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListView.builder(
                            itemCount: mesoInView.length,
                              shrinkWrap:true,
                              itemBuilder: (BuildContext context, index){
                            return Card(
                              child: Text('${mesoInView[index]}'),
                            );

                          })
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: fieldText,
                          onFieldSubmitted: (value) {
                            print(value);
                            // setState((){
                            //   message = value;
                            //   messages.add(value);
                            //   listScrollController.position.maxScrollExtent;
                            // });
                            var resu = auth.sendSms(phoneNum, message);
                            // sendSms("num",message);
                            // if (listScrollController.hasClients) {
                            //   final position = listScrollController.position.maxScrollExtent;
                            //   listScrollController.jumpTo(position + 50);
                            // }
                            // _scrollController.animateTo(_scrollController.position.maxScrollExtent);
                            clearText();
                          },
                          validator: (val) => val!.isEmpty ? "Number" : null,
                          onChanged: (val){setState(() => message = val);},
                          decoration: InputDecoration(
                            hintText: 'Message',
                            suffixIcon: const Icon(Icons.send),
                            border: OutlineInputBorder(
                              // borderSide: BorderSide(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Phone Number', 10.w),
      _getTitleItemWidget('Message', 10.w),
      _getTitleItemWidget('Msg Code', 10.w),
      _getTitleItemWidget('Cost', 10.w),
      _getTitleItemWidget('Status', 10.w),
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