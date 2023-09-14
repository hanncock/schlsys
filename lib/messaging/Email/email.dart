import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/messaging/Email/mail_setup.dart';

import '../../wrapper.dart';

class Emailing extends StatefulWidget {
  const Emailing({Key? key}) : super(key: key);

  @override
  State<Emailing> createState() => _EmailingState();
}

class _EmailingState extends State<Emailing> {



  var mailConfig;


  getConfigs()async{
    var resu = await auth.mailConfigs(Userdata['allowedCompanies'][0]['companyId']);
    print(resu);
    setState(() {
      mailConfig = resu['data'];
    });
  }

  setupMail(var userDetails){
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
                      child: MailSetup(mailConfigs: mailConfig,),
                      // child: Createuser(sessionStateStream: session, userDetails: userDetails,),
                    ),
                  ),
                );
              });
        });
  }

  @override
  void initState(){
    getConfigs();
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
                        width: 12.w,
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
                      // getCompanies();
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
                  setupMail(mailConfig);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Setup Mail'),
                      Icon(Icons.settings_applications),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 600,
                child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index){
                      return Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(backgroundColor: Colors.brown,radius: 18,),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Title',style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Message'),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                }),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                // padding: const EdgeInsets.all(1.0),
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: const Column(
                  children: [
                    // TextFormField(
                    //   validator: (val) => val!.isEmpty ? "Number" : null,
                    //   onChanged: (val){setState(() => phoneNum = val);},
                    //   keyboardType: TextInputType.number,
                    //   inputFormatters: <TextInputFormatter>[
                    //     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    //     FilteringTextInputFormatter.digitsOnly
                    //   ],
                    //   decoration: InputDecoration(
                    //     hintText: selected == 'multipleusers' ? 'input numbers separated by commas ,' :'Phone Number',
                    //     // hintStyle: placeholderfont,
                    //     // suffixIcon: Icon(Icons.account_box),
                    //     border: OutlineInputBorder(
                    //       // borderSide: BorderSide(color: kPrimaryColor),
                    //       borderRadius: BorderRadius.circular(9.0),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('here are the text')
                        ],
                      ),
                    ),
                    // SizedBox(
                    //     height: 50,
                    //     child: TextFormField(
                    //       controller: fieldText,
                    //       onFieldSubmitted: (value) {
                    //         print(value);
                    //         // setState((){
                    //         //   message = value;
                    //         //   messages.add(value);
                    //         //   listScrollController.position.maxScrollExtent;
                    //         // });
                    //         var resu = auth.sendSms(phoneNum, message);
                    //         // sendSms("num",message);
                    //         // if (listScrollController.hasClients) {
                    //         //   final position = listScrollController.position.maxScrollExtent;
                    //         //   listScrollController.jumpTo(position + 50);
                    //         // }
                    //         // _scrollController.animateTo(_scrollController.position.maxScrollExtent);
                    //         clearText();
                    //       },
                    //       validator: (val) => val!.isEmpty ? "Number" : null,
                    //       onChanged: (val){setState(() => message = val);},
                    //       decoration: InputDecoration(
                    //         hintText: 'Message',
                    //         suffixIcon: const Icon(Icons.send),
                    //         border: OutlineInputBorder(
                    //           // borderSide: BorderSide(color: kPrimaryColor),
                    //           borderRadius: BorderRadius.circular(9.0),
                    //         ),
                    //       ),
                    //     )
                    // ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
