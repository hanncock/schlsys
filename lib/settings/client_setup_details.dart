import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';

import '../widgets/loading.dart';
import '../wrapper.dart';

class ClientSetupDetails extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final List? clientDetails;
  const ClientSetupDetails({Key? key,required this.clientDetails,required this.sessionStateStream}) : super(key: key);

  @override
  State<ClientSetupDetails> createState() => _ClientSetupDetailsState();
}

class _ClientSetupDetailsState extends State<ClientSetupDetails> {

  late var companyId = widget.clientDetails?[0]['companyId'];
  late var clientId = widget.clientDetails?[0]['clientId'];
  late var clientName = widget.clientDetails?[0]['clientName'];
  late var clientEmail = widget.clientDetails?[0]['clientEmail'];
  late var clientContactName = widget.clientDetails?[0]['clientContactName'];
  late var clientContactEmail = widget.clientDetails?[0]['clientContactEmail'];
  late var clientContactPhone = widget.clientDetails?[0]['clientContactPhone'];
  late var clientPhone = widget.clientDetails?[0]['clientPhone'];
  late var clientAddress = widget.clientDetails?[0]['clientAddress'];

  var branchId;
  var branchName;
  var branchEmail;
  var branchLocation;
  var branchContact;


  final userForm = GlobalKey<FormState>();

  List branches = [];

  getBranches()async{
    var resu = await auth.clientbranches(clientId);
    print(resu);
    setState((){
      branches = resu['data'];
    });
  }

  @override
  void initState(){
    getBranches();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Form(
              key: userForm,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.blueAccent.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Client Setup',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:2.h),
                    Container(
                      width:width ,
                      // height:400,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'CLIENT DETAILS',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),

                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text('Name',),
                                  ),
                                  Container(
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      initialValue: clientName,
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                      validator: (val) => val!.isEmpty ? "Company Name" : null,
                                      onChanged: (val){
                                        setState(() {
                                          clientName = val ;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Name',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                              SizedBox(width :5.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Email',),
                                  ),
                                  Container(
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                      initialValue: clientEmail,
                                      validator: (val) => val!.isEmpty ? "Email" : null,
                                      onChanged: (val){
                                        setState(() {
                                          clientEmail = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),

                              SizedBox(width :5.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Phone',),
                                  ),
                                  Container(
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                      initialValue: clientPhone,
                                      // validator: (val) => val!.isEmpty ? "Email" : null,
                                      onChanged: (val){
                                        setState(() {
                                          clientPhone = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'client phone',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),

                              SizedBox(width :5.w),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Address',),
                                  ),
                                  Container(
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                      initialValue: clientAddress,
                                      // validator: (val) => val!.isEmpty ? "Email" : null,
                                      onChanged: (val){
                                        setState(() {
                                          clientAddress = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'client phone',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    Container(

                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'CLIENT CONTACT PERSON',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Contact Person',),
                                  ),
                                  SizedBox(width :1.w),
                                  Container(
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                      initialValue: clientContactName,
                                      validator: (val) => val!.isEmpty ? "name" : null,
                                      onChanged: (val){
                                        setState(() {
                                          clientContactName = val;
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Contact Name',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                              SizedBox(width :5.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Contact Person Email',),
                                  ),
                                  Container(
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                      initialValue: clientContactEmail,
                                      validator: (val) => val!.isEmpty ? "email" : null,
                                      onChanged: (val){
                                        setState(() {
                                          clientContactEmail = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'contact person email',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                              SizedBox(width :5.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Contact Person Phone',),
                                  ),
                                  SizedBox(width :1.w),
                                  Container(
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                      initialValue: clientContactPhone,
                                      validator: (val) => val!.isEmpty ? "email" : null,
                                      onChanged: (val){
                                        setState(() {
                                          clientContactPhone = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'contact person phone',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height :3.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // primary: Colors.red, // background
                            foregroundColor: Colors.grey[100], // foreground
                          ),
                          onPressed: () async{
                            if (userForm.currentState!.validate()) {
                              buildShowDialog(context);
                              var user = await auth.createClient(companyId, clientName, clientEmail, clientPhone, clientContactName, clientContactPhone, clientContactEmail, clientAddress, clientId);
                              if(user['data'] == 'Success'){
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();

                              }else{
                                Navigator.of(context).pop();
                              }
                              user['data'] == 'Success' ? showReturnMessage(context, Colors.green, 'Success') :
                              showReturnMessage(context, Colors.red, 'Error');
                              // Navigator.of(context).pop();
                              // print(user['data']);
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: companyId == null ? const Text('Save') :const Text('Update'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          companyId == null ? const Text('') : Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Branch Name',),
                            ),
                            Container(
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:  BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                validator: (val) => val!.isEmpty ? "Branch Name" : null,
                                onChanged: (val){
                                  setState(() {
                                    branchName = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Branch Name',
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Contact',),
                            ),
                            Container(
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:  BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                validator: (val) => val!.isEmpty ? "Contact" : null,
                                onChanged: (val){
                                  setState(() {
                                    branchContact = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Contact',
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Branch Email',),
                            ),
                            Container(
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:  BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                validator: (val) => val!.isEmpty ? "Branch Email" : null,
                                onChanged: (val){
                                  setState(() {
                                    branchEmail = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Branch Email',
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Branch Location',),
                            ),
                            Container(
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:  BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                validator: (val) => val!.isEmpty ? "Branch Location" : null,
                                onChanged: (val){
                                  setState(() {
                                    branchLocation = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Branch Location',
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),

                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),

                        ElevatedButton(
                            onPressed: ()async{
                              var resu = await auth.clientBranchesAdd(branchId,clientId,branchName,branchContact,branchEmail,branchLocation);
                              print(resu);
                            },
                            child: const Text('Add')
                        )
                      ],
                    ),
                  ),
                  // const Divider(),
                  Container(
                    height: 25.h,
                    decoration: const BoxDecoration(

                    ),
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, index){
                          return Card(
                            // child: ,
                          );
                        }),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
