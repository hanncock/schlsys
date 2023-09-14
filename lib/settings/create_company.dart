import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import '../widgets/loading.dart';
import '../wrapper.dart';

class CreateCompany extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final List? companyDetails;
  const CreateCompany({Key? key,required this.sessionStateStream,required this.companyDetails}) : super(key: key);

  @override
  State<CreateCompany> createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {

  late var companyId = widget.companyDetails?[0]['companyId'];
  late var companyName = widget.companyDetails?[0]['name'];
  late var website = widget.companyDetails?[0]['website'];
  late var email = widget.companyDetails?[0]['email'];
  late var idNo = widget.companyDetails?[0]['companyId'];
  late var poBox = widget.companyDetails?[0]['companyId'];
  late var town = widget.companyDetails?[0]['town'];
  late var road = widget.companyDetails?[0]['road'];
  late var phoneNum = widget.companyDetails?[0]['phoneNum'];
  late var taxPin = widget.companyDetails?[0]['tax_pin'];
  late var country = widget.companyDetails?[0]['country'] ?? '-';
  late var regNo = widget.companyDetails?[0]['regNo'] ?? '-';
  late var compLogo = widget.companyDetails?[0]['logo'] == 'NUll' ? false : widget.companyDetails?[0]['logo'];
  late var prevPath = widget.companyDetails?[0]['logo'] == 'NUll' ? false : widget.companyDetails?[0]['logo'];

  var branchName;
  var branchEmail;
  var branchContact;
  var branchLocation;

  List countries = ['Kenya', 'Uganda','Tanzania'];
  final userForm = GlobalKey<FormState>();

  var filePath;

  String selectedfile = '';
  late XFile file;
  late Uint8List selectedImageInByte;

  bool imageset = false;
  bool imagechange = false;
  var _imageFile;
  var fileEncoded;
  final ImagePicker _picker = ImagePicker();
  var imagepath;

  // Future<void> captureImage() async {
  //   print('selecting');
  //   try {
  //     ImagePicker picker = ImagePicker();
  //     final pickedFile = await picker.getImage(source: ImageSource.camera,);
  //     //preferredCameraDevice: CameraDevice.back);
  //
  //     setState((){
  //       imagepath = pickedFile!.path.toString();
  //     });
  //
  //     var mimeType = lookupMimeType(imagepath);
  //
  //     setState(() {
  //       _imageFile = File(pickedFile!.path);
  //       imageset = true;
  //     });
  //
  //     setState((){
  //       // filePath = (filess.path);
  //       fileEncoded =  "data:${mimeType};base64,${base64Encode(File(imagepath).readAsBytesSync())}";
  //       print(fileEncoded);
  //     });
  //     // } else {
  //     //   // User canceled the picker
  //     // }
  //
  //   } catch (e) {
  //     //return e.toString();
  //   }
  // }

  // Future<void> captureImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['jpg','jpeg','png','pdf']);
  //
  //   if (result != null) {
  //     File filess = File(result.files.single.path!);
  //     PlatformFile file = result.files.first;
  //     var mimeType = lookupMimeType(result.files.single.path!);
  //     print('her is file mime ${mimeType}');
  //
  //     var toencode =  File(filess.path).readAsBytesSync();
  //     setState((){
  //       filePath = (filess.path);
  //       fileEncoded =  "data:${mimeType};base64,${base64Encode(toencode!)}";
  //       print(fileEncoded);
  //     });
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  captureImage()async {
    var picked = await FilePicker.platform.pickFiles();
    if (picked != null) {
      print(picked.files.first.name);

      setState((){
        imagechange = true;
        imageset = true;
        selectedImageInByte = picked.files.first.bytes!;
      });

      // String base64String = base64Encode(selectedImageInByte);
      // print(selectedImageInByte);
      var mimeType = lookupMimeType(picked.files.first.name);
      fileEncoded =  "data:${mimeType};base64,${base64Encode(selectedImageInByte!)}";
      // print(fileEncoded);
      // print('her is file mime ${mimeType}');
    }
  }
  @override
  Widget build(BuildContext context) {
    print(auth.url+'/'+"${compLogo}");
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                            child: Text('Company Setup',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:2.h),
                    InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'COMPANY DETAILS',
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
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text('Company Name',),
                                        ),
                                        Container(
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:  BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            initialValue: companyName,
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            validator: (val) => val!.isEmpty ? "Company Name" : null,
                                            onChanged: (val){
                                              setState(() {
                                                companyName = val ;
                                              });
                                            },
                                            decoration: const InputDecoration(
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
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: email,
                                            validator: (val) => val!.isEmpty ? "Email" : null,
                                            onChanged: (val){
                                              setState(() {
                                                email = val;
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
                                          child: Text('Website',),
                                        ),
                                        Container(
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:  BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: website,
                                            // validator: (val) => val!.isEmpty ? "Email" : null,
                                            onChanged: (val){
                                              setState(() {
                                                website = val;
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


                                  ],
                                ),
                                SizedBox(height: 4.h,),
                                Row(
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(3.0),
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
                                                hint: Text('${country ?? '-'}'),
                                                items: countries.map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(e,
                                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),

                                                    ))).toList(),
                                                // value:country,
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
                                        const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text('Town',),
                                        ),
                                        Container(
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:  BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: town,
                                            validator: (val) => val!.isEmpty ? "Town" : null,
                                            onChanged: (val){
                                              setState(() {
                                                town = val;
                                              });
                                            },

                                            decoration: const InputDecoration(
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
                                        const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text('P.O.Box',),
                                        ),
                                        Container(
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:  BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: poBox,
                                            validator: (val) => val!.isEmpty ? "P.O Box" : null,
                                            onChanged: (val){
                                              setState(() {
                                                poBox = val;
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
                                          child: Text('Road/Street',),
                                        ),
                                        Container(
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:  BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: road,
                                            onChanged: (val){
                                              setState(() {
                                                road = val;
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
                                          child: Text('Tax Pin',),
                                        ),
                                        Container(
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:  BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: taxPin,
                                            onChanged: (val){
                                              setState(() {
                                                taxPin = val;
                                              });
                                            },
                                            decoration: const InputDecoration(
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
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: phoneNum,
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

                                            decoration: const InputDecoration(
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
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text('Reg No',),
                                        ),
                                        Container(
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:  BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                            initialValue: regNo,
                                            onChanged: (val){
                                              setState(() {
                                                regNo = val;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Reg No',
                                              contentPadding: EdgeInsets.all(15),
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                    // Text('soke')
                                    SizedBox(width :50.w),
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.all(3.0),
                                    //       child: Text('Tax Pin',),
                                    //     ),
                                    //     Container(
                                    //       width: 20.w,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.grey[100],
                                    //         borderRadius:  BorderRadius.circular(10),
                                    //       ),
                                    //       child: TextFormField(
                                    //         style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                    //         initialValue: taxPin,
                                    //         onChanged: (val){
                                    //           setState(() {
                                    //             taxPin = val;
                                    //           });
                                    //         },
                                    //         decoration: InputDecoration(
                                    //           border: InputBorder.none,
                                    //           hintText: 'Tax Pin',
                                    //           contentPadding: EdgeInsets.all(15),
                                    //         ),
                                    //       ),
                                    //
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(width :5.w),
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.all(3.0),
                                    //       child: Text('Phone Number',),
                                    //     ),
                                    //     Container(
                                    //       width: 20.w,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.grey[100],
                                    //         borderRadius:  BorderRadius.circular(10),
                                    //       ),
                                    //       child: TextFormField(
                                    //         style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                    //         initialValue: phoneNum,
                                    //         keyboardType: TextInputType.number,
                                    //         inputFormatters: [
                                    //           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    //         ],
                                    //         validator: (val) => val!.isEmpty ? "Phone Number" : null,
                                    //         onChanged: (val){
                                    //           setState(() {
                                    //             phoneNum = val;
                                    //           });
                                    //         },
                                    //
                                    //         decoration: InputDecoration(
                                    //           border: InputBorder.none,
                                    //           hintText: 'phone Num',
                                    //           contentPadding: EdgeInsets.all(15),
                                    //         ),
                                    //       ),
                                    //
                                    //     ),
                                    //   ],
                                    // ),

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
                            InkWell(
                              onTap: (){
                                captureImage();
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // const Padding(
                                  //   padding: EdgeInsets.all(3.0),
                                  //   child: Text('Logo',),
                                  // ),
                                  Container(
                                    width: 15.w,
                                    height: 32.h,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    // child: compLogo ? imageset ? Image.memory(selectedImageInByte) : Text('sel image') : Image.network(auth.url+'/'+compLogo),
                                    child: imagechange ? Image.memory(selectedImageInByte) :compLogo == null ? imageset ? Text('load from file') : Center(child: Icon(Icons.camera_alt_outlined)) : Image.network(auth.url+'/'+compLogo),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    // Text('${Userdata['fName']}''${Userdata['sName']}'),
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
                              // var user = await auth.companyAdd(companyName,email, website, idNo, phoneNum, country);
                              var user = await auth.companyAdd(companyId,companyName, email, regNo, poBox, website,fileEncoded ?? compLogo, taxPin, phoneNum, country, town, road,imagechange,prevPath);
                              if(user['data'] == 'Success'){
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();

                              }else{
                                Navigator.of(context).pop();
                              }
                              // user['data'] == 'Success' ? showReturnMessage(context, Colors.green, 'Success') :
                              // showReturnMessage(context, Colors.red, 'Error');
                              // Navigator.of(context).pop();
                              print(user['data']);
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
          // companyId == null ? const Text('') : Card(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Container(
          //           child: Row(
          //             children: [
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   const Padding(
          //                     padding: EdgeInsets.all(5.0),
          //                     child: Text('Branch Name',),
          //                   ),
          //                   Container(
          //                     width: 10.w,
          //                     decoration: BoxDecoration(
          //                       color: Colors.grey[100],
          //                       borderRadius:  BorderRadius.circular(10),
          //                     ),
          //                     child: TextFormField(
          //                       validator: (val) => val!.isEmpty ? "Branch Name" : null,
          //                       onChanged: (val){
          //                         setState(() {
          //                           branchName = val;
          //                         });
          //                       },
          //                       decoration: const InputDecoration(
          //                         border: InputBorder.none,
          //                         hintText: 'Branch Name',
          //                         contentPadding: EdgeInsets.all(15),
          //                       ),
          //                     ),
          //
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(width: 10,),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   const Padding(
          //                     padding: EdgeInsets.all(5.0),
          //                     child: Text('Contact',),
          //                   ),
          //                   Container(
          //                     width: 10.w,
          //                     decoration: BoxDecoration(
          //                       color: Colors.grey[100],
          //                       borderRadius:  BorderRadius.circular(10),
          //                     ),
          //                     child: TextFormField(
          //                       validator: (val) => val!.isEmpty ? "Contact" : null,
          //                       onChanged: (val){
          //                         setState(() {
          //                           branchContact = val;
          //                         });
          //                       },
          //                       decoration: const InputDecoration(
          //                         border: InputBorder.none,
          //                         hintText: 'Contact',
          //                         contentPadding: EdgeInsets.all(15),
          //                       ),
          //                     ),
          //
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(width: 10,),
          //
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   const Padding(
          //                     padding: EdgeInsets.all(5.0),
          //                     child: Text('Branch Email',),
          //                   ),
          //                   Container(
          //                     width: 10.w,
          //                     decoration: BoxDecoration(
          //                       color: Colors.grey[100],
          //                       borderRadius:  BorderRadius.circular(10),
          //                     ),
          //                     child: TextFormField(
          //                       validator: (val) => val!.isEmpty ? "Branch Email" : null,
          //                       onChanged: (val){
          //                         setState(() {
          //                           branchEmail = val;
          //                         });
          //                       },
          //                       decoration: const InputDecoration(
          //                         border: InputBorder.none,
          //                         hintText: 'Branch Email',
          //                         contentPadding: EdgeInsets.all(15),
          //                       ),
          //                     ),
          //
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(width: 10,),
          //
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   const Padding(
          //                     padding: EdgeInsets.all(5.0),
          //                     child: Text('Branch Location',),
          //                   ),
          //                   Container(
          //                     width: 10.w,
          //                     decoration: BoxDecoration(
          //                       color: Colors.grey[100],
          //                       borderRadius:  BorderRadius.circular(10),
          //                     ),
          //                     child: TextFormField(
          //                       validator: (val) => val!.isEmpty ? "Branch Location" : null,
          //                       onChanged: (val){
          //                         setState(() {
          //                           branchLocation = val;
          //                         });
          //                       },
          //                       decoration: const InputDecoration(
          //                         border: InputBorder.none,
          //                         hintText: 'Branch Location',
          //                         contentPadding: EdgeInsets.all(15),
          //                       ),
          //                     ),
          //
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(width: 10,),
          //
          //               ElevatedButton(
          //                   onPressed: ()async{
          //                     var resu = await auth.companyBranchesAdd(companyId, companyId,branchName,branchContact,branchEmail,branchLocation);
          //                     print(resu);
          //                   },
          //                   child: const Text('Add')
          //               )
          //             ],
          //           ),
          //         ),
          //         const Divider(),
          //         Container(
          //           height: 25.h,
          //           decoration: const BoxDecoration(
          //
          //           ),
          //           child: ListView.builder(
          //               itemCount: 1,
          //               itemBuilder: (BuildContext context, index){
          //                 return const Text('here are the branches');
          //               }),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
