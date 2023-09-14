import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/loading.dart';
import '../../wrapper.dart';

class SMSSetup extends StatefulWidget {
  final smsConfigDet;
  const SMSSetup({Key? key,required this.smsConfigDet}) : super(key: key);

  @override
  State<SMSSetup> createState() => _SMSSetupState();
}

class _SMSSetupState extends State<SMSSetup> {

  /*
  * var url = 'https://api.africastalking.com/version1/messaging';
    var bodyFields = {
      'username': 'soke',
      'to': phoneNum,
      'message': message
    };
    print(bodyFields);
    final response = await http.post(Uri.parse(url),
        body: bodyFields,
        headers: {
          'apikey': '41928f753d83cfa1c413d2ff71075de523f385b7b8a0a267b334353547ee8a6e',
          'Accept': 'application/json',
          // 'Content-Type': 'application/x-www-form-urlencoded'
          // 'Content-Type':'application/json'
        }
  * */

  final userForm = GlobalKey<FormState>();

  late var id = widget.smsConfigDet?[0]['id'];
  late var companyId = widget.smsConfigDet?[0]['companyId'];
  late var url = widget.smsConfigDet?[0]['message_url'];
  late var appName = widget.smsConfigDet?[0]['app_name'];
  late var apiKey = widget.smsConfigDet?[0]['api_key'];

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
                    child: Text('Provider Url',),
                  ),
                  Container(
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (val) => val!.isEmpty ? "url" : null,

                      initialValue: url,
                      onChanged: (val){
                        setState(() {
                          url = val;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'provider url',
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
                    child: Text('App Name',),
                  ),
                  Container(
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) => val!.isEmpty ? "App Name" : null,
                      initialValue: appName,
                      onChanged: (val){
                        setState(() {
                          appName = val ;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'App Name',
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
                    child: Text('API Key',),
                  ),
                  Container(
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) => val!.isEmpty ? "Api Key" : null,
                      initialValue: apiKey,
                      onChanged: (val){
                        setState(() {
                          apiKey = val ;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'apikey',
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),

                  ),
                ],
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
                        var resu = await auth.setupSmsConfig(companyId, url, appName, apiKey);
                        if(resu['data'] == 'Success'){

                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            // backgroundColor: Colors.green,
                              const SnackBar(content: Text('Success'))
                          );
                          // showReturnMessage(context, Colors.green,'Success');


                        }else{
                          Navigator.of(context).pop();

                        }
                        print(resu);
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
