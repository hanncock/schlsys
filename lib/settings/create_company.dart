import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import '../widgets/loading.dart';
import '../wrapper.dart';

class CreateCompany extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const CreateCompany({Key? key,required this.sessionStateStream}) : super(key: key);

  @override
  State<CreateCompany> createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  var companyName;
  var email;
  var website = '';
  var idNo;
  var poBox;
  var town;
  var road;
  var phoneNum;
  var taxPin;
  List countries = ['Kenya', 'Uganda','Tanzania'];
  var country;
  var dob;
  final userForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: userForm,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Company Name',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Company Name" : null,
                                    onChanged: (val){
                                      setState(() {
                                        companyName = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Company Name',
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
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Email',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Email" : null,
                                    onChanged: (val){
                                      setState(() {
                                        email = val;
                                      });
                                    },
                                    decoration: InputDecoration(
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
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Website',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    // validator: (val) => val!.isEmpty ? "Email" : null,
                                    onChanged: (val){
                                      setState(() {
                                        website = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                  ),

                                ),
                              ],
                            ),


                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Row(
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Country',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        items: countries.map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e,
                                              style: TextStyle(
                                                // fontSize: 5.sp,
                                              ),
                                            ))).toList(),
                                        value: country,
                                        onChanged: (value){
                                          setState(() {
                                            country = value;
                                          });
                                        },
                                        dropdownStyleData: DropdownStyleData(
                                          // maxHeight: 200,
                                          // width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14),
                                            // color: Colors.redAccent,
                                          ),
                                          offset: const Offset(-20, 0),
                                          scrollbarTheme: ScrollbarThemeData(
                                            radius: const Radius.circular(40),
                                            thickness: MaterialStateProperty.all<double>(6),
                                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                                          ),
                                        ),

                                      )),
                                ),
                              ],
                            ),
                            SizedBox(width :5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Town',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Town" : null,
                                    onChanged: (val){
                                      setState(() {
                                        town = val;
                                      });
                                    },

                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Town',
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
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('P.O.Box',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "P.O Box" : null,
                                    onChanged: (val){
                                      setState(() {
                                        poBox = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Id No',
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                  ),

                                ),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Road/Street',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(() {
                                        road = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Id No',
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
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Tax Pin',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(() {
                                        taxPin = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Tax Pin',
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
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Phone Number',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    ],
                                    validator: (val) => val!.isEmpty ? "Phone Number" : null,
                                    onChanged: (val){
                                      setState(() {
                                        phoneNum = val;
                                      });
                                    },

                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'phone Num',
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                  ),

                                ),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width :5.w),
                          ],
                        ),
                        SizedBox(height: 2.h,),

                      ],
                    ),
                    SizedBox(width :4.w),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('Logo',),
                        ),
                        Container(
                          width: 15.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 4.h,),
                // Text('${Userdata['fName']}''${Userdata['sName']}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.red, // background
                        onPrimary: Colors.grey[100], // foreground
                      ),
                      onPressed: () async{
                        if (userForm.currentState!.validate()) {
                          buildShowDialog(context);
                          // var user = await auth.companyAdd(companyName,email, website, idNo, phoneNum, country);
                          var user = await auth.companyAdd(companyName, email, "reg", poBox, website, 'logo', taxPin, phoneNum, country, town, road);
                          user['data'] == 'success' ? showReturnMessage(context, Colors.green, 'Success') :
                          showReturnMessage(context, Colors.red, 'Error');
                          Navigator.of(context).pop();
                          print(user);
                        }

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Save'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
