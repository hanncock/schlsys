import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/loading.dart';
import '../../wrapper.dart';

class MailSetup extends StatefulWidget {
  final mailConfigs;
  const MailSetup({Key? key,required this.mailConfigs}) : super(key: key);

  @override
  State<MailSetup> createState() => _MailSetupState();
}

class _MailSetupState extends State<MailSetup> {

  late var id = widget.mailConfigs?[0]['id'];
  late var companyId = widget.mailConfigs?[0]['companyId'];
  late var mailusername = widget.mailConfigs?[0]['msetup_username'];
  late var mailpassword = widget.mailConfigs?[0]['msetup_password'];
  late var smtphost = widget.mailConfigs?[0]['msetup_smtphot'];
  late var port = widget.mailConfigs?[0]['msetup_port'];
  final userForm = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: userForm,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(' mailusername',),
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (val) => val!.isEmpty ? "mailusername" : null,

                      initialValue: mailusername,
                      onChanged: (val){
                        setState(() {
                          mailusername = val;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mail mailusername',
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
                    child: Text('mailpassword',),
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // validator: (val) => val!.isEmpty ? "First Name" : null,
                      initialValue: mailpassword,
                      onChanged: (val){
                        setState(() {
                          mailpassword = val ;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mail mailpassword',
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
                    child: Text('SMTP Host',),
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // validator: (val) => val!.isEmpty ? "First Name" : null,
                      initialValue: smtphost,
                      onChanged: (val){
                        setState(() {
                          smtphost = val ;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'host',
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
                    child: Text('Port',),
                  ),
                  Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      initialValue: port,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (val) => val!.isEmpty ? "Phone Number" : null,
                      onChanged: (val){
                        setState(() {
                          port = val ;
                        });
                      },

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Port',
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),

                  ),
                ],
              ),
              // Column(crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Padding(
              //       padding: EdgeInsets.all(3.0),
              //       child: Text('Gender',),
              //     ),
              //     Container(
              //       width: 20.w,
              //       decoration: BoxDecoration(
              //         color: Colors.grey[100],
              //         borderRadius:  BorderRadius.circular(10),
              //       ),
              //       child: DropdownButtonHideUnderline(
              //           child: DropdownButton2(
              //             isExpanded: true,
              //             hint: Text('$gender'),
              //             items: genders.map((e) => DropdownMenuItem(
              //                 value: e,
              //                 child: Text(e,
              //                   style: const TextStyle(
              //                     // fontSize: 5.sp,
              //                   ),
              //                 ))).toList(),
              //             // value: gender,
              //             onChanged: (value){
              //               setState(() {
              //                 gender = value;
              //               });
              //             },
              //             dropdownStyleData: DropdownStyleData(
              //               // maxHeight: 200,
              //               // width: 200,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(14),
              //                 // color: Colors.redAccent,
              //               ),
              //               offset: const Offset(-20, 0),
              //               scrollbarTheme: ScrollbarThemeData(
              //                 radius: const Radius.circular(40),
              //                 thickness: MaterialStateProperty.all<double>(6),
              //                 thumbVisibility: MaterialStateProperty.all<bool>(true),
              //               ),
              //             ),
              //
              //           )),
              //     ),
              //   ],
              // ),

              SizedBox(height: 4.h,),
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
                        var user = await auth.setupmailConfigs(companyId, mailusername, mailpassword, smtphost, port);
                        if(user['data'] == 'Success'){

                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                              // backgroundColor: Colors.green,
                              const SnackBar(content: Text('Success'))
                          );
                          // showReturnMessage(context, Colors.green,'Success');


                        }else{
                          Navigator.of(context).pop();

                        }
                        print(user);
                      }

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: id == null ? const Text('Save') :const Text('Update'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 4.h,),
            ],
          ),
        ),
      ),
    );
  }
}
