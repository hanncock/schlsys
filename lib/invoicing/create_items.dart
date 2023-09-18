import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';

import '../widgets/loading.dart';
import '../wrapper.dart';

class CreateItems extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  final List? itemsList;
  const CreateItems({Key? key,required this.itemsList,required this.sessionStateStream}) : super(key: key);

  @override
  State<CreateItems> createState() => _CreateItemsState();
}

class _CreateItemsState extends State<CreateItems> {

  late var id = widget.itemsList?[0]['id'];
  late var itemName = widget.itemsList?[0]['itemName'];
  late var description = widget.itemsList?[0]['description'];
  late var companyId = widget.itemsList?[0]['companyId'];
  late var unitPrice = widget.itemsList?[0]['unitPrice'];

  final userForm = GlobalKey<FormState>();

  // getitems()async{
  //   var resu = await auth.
  // }

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
                    child: Text('ITEMS SETUP',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ],
              ),
            ),
            SizedBox(height:2.h),
            Container(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'ITEMS',
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
                                  child: Text('Item ',),
                                ),
                                Container(
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:  BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ? "Item " : null,

                                    initialValue: itemName,
                                    onChanged: (val){
                                      setState(() {
                                        itemName = val;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Item Name',
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
                                  child: Text('Description',),
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
                                    initialValue: description,
                                    onChanged: (val){
                                      setState(() {
                                        description = val ;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Description',
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
                                  child: Text('Unit Price',),
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
                                    initialValue: unitPrice,
                                    onChanged: (val){
                                      setState(() {
                                        unitPrice = val ;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Unit Price',
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


                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4.h),
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
                      var user = await auth.addItems(id, itemName, description, unitPrice);
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
