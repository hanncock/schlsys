import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/widgets/loading.dart';

import '../wrapper.dart';

class Createuser extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final List? userDetails;
  const Createuser({Key? key,required this.sessionStateStream,required this.userDetails}) : super(key: key);

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {

  late var id = widget.userDetails?[0]['id'];

  late var sirName = widget.userDetails?[0]['fName'];
  late var oNames = widget.userDetails?[0]['sName'];
  late var idNo = widget.userDetails?[0]['idNo'];
  late var email = widget.userDetails?[0]['email'];
  late var phoneNum = widget.userDetails?[0]['phoneNum'];
  List genders = ['Male', 'Female'];
  List countries = ['Kenya', 'Uganda','Tanzania'];
  late var country = widget.userDetails?[0]['country'] ?? '-';
  late var gender = widget.userDetails?[0]['gender'] ?? '-' ;
  var dob;
  final userForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: userForm,
          child: Column(

            children: [

              Card(
                color: Colors.blueAccent.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('SYSTEM USERS SETUP',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ],
                ),
              ),
              SizedBox(height:2.h),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'USER DETAILS',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text('First Name',),
                                  ),
                                  Container(
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      validator: (val) => val!.isEmpty ? "First Name" : null,

                                      initialValue: sirName,
                                      onChanged: (val){
                                        setState(() {
                                          sirName = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'First Name',
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
                                    child: Text('Other Names',),
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
                                      initialValue: oNames,
                                      onChanged: (val){
                                        setState(() {
                                          oNames = val ;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Other Names',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                              SizedBox(width :5.w),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Gender',),
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
                                          hint: Text('$gender'),
                                          items: genders.map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e,
                                              style: const TextStyle(
                                                // fontSize: 5.sp,
                                              ),
                                              ))).toList(),
                                          // value: gender,
                                          onChanged: (value){
                                            setState(() {
                                              gender = value;
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

                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text('Other Names'),
                              //     TextFormField(
                              //       validator: (val) => val!.isEmpty || val == null ? "Other Names" : null,
                              //       onChanged: (val){setState(() => sirName = val);},
                              //       decoration: InputDecoration(
                              //         hintText: 'Other Names',
                              //         filled: true,
                              //         fillColor: Colors.blueGrey[50],
                              //         border: OutlineInputBorder(
                              //           borderSide: BorderSide(color: Colors.blueGrey.shade50),
                              //           borderRadius: BorderRadius.circular(9.0),
                              //         ),
                              //         enabledBorder: OutlineInputBorder(
                              //           borderSide: BorderSide(color: Colors.blueGrey.shade50),
                              //           borderRadius: BorderRadius.circular(9.0),
                              //         ),
                              //         focusedBorder: OutlineInputBorder(
                              //           borderSide: BorderSide(color: Colors.blueGrey.shade50),
                              //           borderRadius: BorderRadius.circular(9.0),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          SizedBox(height: 4.h,),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
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
                                      initialValue: email,
                                      onChanged: (val){
                                        setState(() {
                                          email = val ;
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
                                    child: Text('Id No',),
                                  ),
                                  Container(
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      // keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      // keyboardType: TextInputType.number,
                                      initialValue: idNo,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      validator: (val) => val!.isEmpty ? "Id No" : null,
                                      onChanged: (val){
                                        setState(() {
                                          idNo = val ;
                                        });
                                      },
                                      decoration: const InputDecoration(
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
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text('Phone Number',),
                                  ),
                                  Container(
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius:  BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      initialValue: phoneNum,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      validator: (val) => val!.isEmpty ? "Phone Number" : null,
                                      onChanged: (val){
                                        setState(() {
                                          phoneNum = val ;
                                        });
                                      },

                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'phone Num',
                                        contentPadding: EdgeInsets.all(15),
                                      ),
                                    ),

                                  ),
                                ],
                              ),

                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text('Other Names'),
                              //     TextFormField(
                              //       validator: (val) => val!.isEmpty || val == null ? "Other Names" : null,
                              //       onChanged: (val){setState(() => sirName = val);},
                              //       decoration: InputDecoration(
                              //         hintText: 'Other Names',
                              //         filled: true,
                              //         fillColor: Colors.blueGrey[50],
                              //         border: OutlineInputBorder(
                              //           borderSide: BorderSide(color: Colors.blueGrey.shade50),
                              //           borderRadius: BorderRadius.circular(9.0),
                              //         ),
                              //         enabledBorder: OutlineInputBorder(
                              //           borderSide: BorderSide(color: Colors.blueGrey.shade50),
                              //           borderRadius: BorderRadius.circular(9.0),
                              //         ),
                              //         focusedBorder: OutlineInputBorder(
                              //           borderSide: BorderSide(color: Colors.blueGrey.shade50),
                              //           borderRadius: BorderRadius.circular(9.0),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          SizedBox(height: 4.h,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(3.0),
                          //           child: Text('Nationality',),
                          //         ),
                          //         Container(
                          //           width: 20.w,
                          //           decoration: BoxDecoration(
                          //             color: Colors.grey[100],
                          //             borderRadius:  BorderRadius.circular(10),
                          //           ),
                          //           child: DropdownButtonHideUnderline(
                          //               child: DropdownButton2(
                          //                 isExpanded: true,
                          //                 hint: Text('${country}'),
                          //                 items: countries.map((e) => DropdownMenuItem(
                          //                     value: e,
                          //                     child: Text(e,
                          //                       style: TextStyle(
                          //                         // fontSize: 5.sp,
                          //                       ),
                          //                     ))).toList(),
                          //                 // value: gender,
                          //                 onChanged: (value){
                          //                   setState(() {
                          //                     country = value;
                          //                   });
                          //                 },
                          //                 dropdownStyleData: DropdownStyleData(
                          //                   // maxHeight: 200,
                          //                   // width: 200,
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.circular(14),
                          //                     // color: Colors.redAccent,
                          //                   ),
                          //                   offset: const Offset(-20, 0),
                          //                   scrollbarTheme: ScrollbarThemeData(
                          //                     radius: const Radius.circular(40),
                          //                     thickness: MaterialStateProperty.all<double>(6),
                          //                     thumbVisibility: MaterialStateProperty.all<bool>(true),
                          //                   ),
                          //                 ),
                          //
                          //               )),
                          //         ),
                          //       ],
                          //     ),
                          //     SizedBox(width :5.w),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(3.0),
                          //           child: Text('Address',),
                          //         ),
                          //         Container(
                          //           width: 20.w,
                          //           decoration: BoxDecoration(
                          //             color: Colors.grey[100],
                          //             borderRadius:  BorderRadius.circular(10),
                          //           ),
                          //           child: DropdownButtonHideUnderline(
                          //               child: DropdownButton2(
                          //                 isExpanded: true,
                          //                 items: genders.map((e) => DropdownMenuItem(
                          //                     value: e,
                          //                     child: Text(e,
                          //                       style: TextStyle(
                          //                         // fontSize: 5.sp,
                          //                       ),
                          //                     ))).toList(),
                          //                 // value: gender,
                          //                 onChanged: (value){
                          //                   setState(() {
                          //                     gender = value;
                          //                   });
                          //                 },
                          //                 dropdownStyleData: DropdownStyleData(
                          //                   // maxHeight: 200,
                          //                   // width: 200,
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.circular(14),
                          //                     // color: Colors.redAccent,
                          //                   ),
                          //                   offset: const Offset(-20, 0),
                          //                   scrollbarTheme: ScrollbarThemeData(
                          //                     radius: const Radius.circular(40),
                          //                     thickness: MaterialStateProperty.all<double>(6),
                          //                     thumbVisibility: MaterialStateProperty.all<bool>(true),
                          //                   ),
                          //                 ),
                          //
                          //               )),
                          //         ),
                          //       ],
                          //     ),
                          //     SizedBox(width :5.w),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(3.0),
                          //           child: Text('Password',),
                          //         ),
                          //         Container(
                          //           width: 20.w,
                          //           decoration: BoxDecoration(
                          //             color: Colors.grey[100],
                          //             borderRadius:  BorderRadius.circular(10),
                          //           ),
                          //           child: DropdownButtonHideUnderline(
                          //               child: DropdownButton2(
                          //                 isExpanded: true,
                          //                 items: genders.map((e) => DropdownMenuItem(
                          //                     value: e,
                          //                     child: Text(e,
                          //                       style: TextStyle(
                          //                         // fontSize: 5.sp,
                          //                       ),
                          //                     ))).toList(),
                          //                 // value: gender,
                          //                 onChanged: (value){
                          //                   setState(() {
                          //                     gender = value;
                          //                   });
                          //                 },
                          //                 dropdownStyleData: DropdownStyleData(
                          //                   // maxHeight: 200,
                          //                   // width: 200,
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.circular(14),
                          //                     // color: Colors.redAccent,
                          //                   ),
                          //                   offset: const Offset(-20, 0),
                          //                   scrollbarTheme: ScrollbarThemeData(
                          //                     radius: const Radius.circular(40),
                          //                     thickness: MaterialStateProperty.all<double>(6),
                          //                     thumbVisibility: MaterialStateProperty.all<bool>(true),
                          //                   ),
                          //                 ),
                          //
                          //               )),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 2.h,),

                        ],
                      ),
                      SizedBox(width :5.w),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text('Profile Photo',),
                          ),
                          Container(
                            width: 15.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
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
                        var user = await auth.userAdd(id, sirName, oNames, idNo, email, phoneNum, gender);
                        if(user['data'] == 'Success'){
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();

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
              )
            ],
          ),
        ),
      );
  }
}
