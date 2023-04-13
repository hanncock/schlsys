import 'package:flutter/material.dart';

class Createuser extends StatefulWidget {
  const Createuser({Key? key}) : super(key: key);

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {

  var sirName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: Text('SirName')),
          TextFormField(
            // enabled: isenabled,
            validator: (val) => val!.isEmpty ? "Company" : null,
            onChanged: (val){setState(() => sirName = val);},
            // initialValue: currentUserData['company'],style: styles2,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              // suffixIcon: Icon(Icons.account_box),
              // labelText: "Company",
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400],
                padding:  EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: (){
                // uploadImage('image', imagepath,null);
                // var resu = await auth.uploadImage(null,imagepath,File(imagepath));
                // print(resu);
              },
              child: Text('Save',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Muli",
                ),)),
        ],
      ),
    );
  }
}
