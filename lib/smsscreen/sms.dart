import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/SizeConfig.dart';
import '../style/colors.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {

  var selected = 'singleuser';
  var phoneNum;
  var messages = [
    'welcome',
    'how are you',
    'is all ok',
    'this is the longest message that can be made'
        'welcome',
    'how are you',
    'is all ok',
    'this is the longest message that can be made'
  ];

  final fieldText = TextEditingController();
  ScrollController listScrollController = ScrollController();
  void clearText() {
    fieldText.clear();
  }

  @override
  void iniState(){
    super.initState();
    if (listScrollController.hasClients) {
      final position = listScrollController.position.maxScrollExtent;
      print('th is the ${position}');
      listScrollController.jumpTo(position + 50);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                color: AppColors.secondaryBg,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Card(
                              color: AppColors.primaryBg,
                              child: Padding(padding: EdgeInsets.all(5),
                                  child: Text('Send a new Message')
                              )
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                selected = 'singleuser';
                              });
                            },
                            child: Text('SMS a user'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selected == 'singleuser'?  Colors.blue[800] : Colors.grey[400],
                              padding:  EdgeInsets.all(20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                selected = 'multipleusers';
                              });
                            },
                            child: Text('Send multiple users'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selected == 'multipleusers'?  Colors.blue[800] : Colors.grey[400],
                              padding:  EdgeInsets.all(20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [

                          Container(
                            width: 300,
                            child: TextFormField(
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
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryBg
                      ),
                      // alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: listScrollController,
                              shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                              itemCount: messages.length,
                                itemBuilder: (context,index){
                                  return Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        margin: EdgeInsets.only(left: 50),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text('${messages[index]}'),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ),
                          Divider(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                controller: fieldText,
                                onFieldSubmitted: (value) {
                                  setState((){
                                    messages.add(value);
                                    listScrollController.position.maxScrollExtent;
                                  });

                                  if (listScrollController.hasClients) {
                                    final position = listScrollController.position.maxScrollExtent;
                                    print('th is the ${position}');
                                    listScrollController.jumpTo(position + 50);
                                  }
                                  // _scrollController.animateTo(_scrollController.position.maxScrollExtent);
                                  clearText();
                                },
                                  validator: (val) => val!.isEmpty ? "Number" : null,
                                  onChanged: (val){setState(() => phoneNum = val);},
                                  decoration: InputDecoration(
                                    hintText: 'Message',
                                    suffixIcon: Icon(Icons.send),
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide(color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                  ),
                            )
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        Expanded(
          flex: 10,
          child: Container(
              width: double.infinity,
              height: SizeConfig.screenHeight,
              child: Column(
                children: [
                  Card(
                    color: AppColors.primaryBg,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Phone Num'),
                          Text('message Info'),
                          Text('Transaction cost'),
                          Text('Date'),
                          Text('Time'),
                          Text('Status'),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('+254 700 000 000'),
                                Text('This is a trial sms and it is more than that'),
                                Text('0.87'),
                                Text('Delivered'),
                                Text('12/01/2022'),
                                Text('12:04 am')
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ],
              )
          )
        )
          ],
        ),
      ),
    );
  }
}
