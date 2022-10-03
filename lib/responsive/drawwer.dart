import 'package:flutter/material.dart';
import 'package:web1/documents/document_home.dart';
import 'package:web1/responsive/tabBuiler.dart';

class Drawwer extends StatefulWidget {
  const Drawwer({Key? key}) : super(key: key);

  @override
  State<Drawwer> createState() => _DrawwerState();
}

class _DrawwerState extends State<Drawwer> {
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: MediaQuery.of(context).size.width * 0.25,
     child: Scaffold(
         backgroundColor: Colors.blueGrey,

       body: Column(
         children: [
           DrawerHeader(
             decoration: BoxDecoration(
               color: Colors.blue,
             ),
             child: Text('Drawer Header'),
           ),
           ListTile(
             leading: Padding(
               padding: const EdgeInsets.all(8),
               child: Icon(Icons.school,color: Colors.white,)
             ),
             title: Text('School Management',style: TextStyle(color: Colors.white)),
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (_) => Documents()));
               // Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
               // userData[1]['rights']['landlordStmt'] == 'NO' ? showAccess('Access Denied for Landlord Statement')
               //     :Navigator.push(context, MaterialPageRoute(builder: (_) => LandlordStatement()));
             },
           ),
           ListTile(
             leading: Padding(
                 padding: const EdgeInsets.all(8),
                 child: Icon(Icons.picture_as_pdf,color: Colors.white,)
             ),
             title: Text('Documents',style: TextStyle(color: Colors.white)),
             onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
             },
           ),
           // ExpansionTile(
           //   leading: SizedBox(
           //       width: 30,
           //       height: 30, // fixed width and height
           //       child: Icon(Icons.account_balance, color: Colors.redAccent,)//Image.asset('assets/icons/report.png',color: Colors.redAccent,)
           //   ),
           //   title: Text('Landlord Reports'),
           //   children: [
           //     ListTile(
           //       leading: Padding(
           //         padding: const EdgeInsets.all(8),
           //         child: Image.asset(
           //           'assets/new/property_stmt.png',
           //           color: Colors.grey,
           //         ),
           //       ),
           //       title: Text('Landlord Statements',style: TextStyle(fontSize: 12)),
           //       onTap: () {
           //         // userData[1]['rights']['landlordStmt'] == 'NO' ? showAccess('Access Denied for Landlord Statement')
           //         //     :Navigator.push(context, MaterialPageRoute(builder: (_) => LandlordStatement()));
           //       },
           //     ),
           //     ListTile(
           //       leading: Padding(
           //         padding: const EdgeInsets.all(8),
           //         child: Image.asset(
           //           'assets/icons/money.png',
           //           color: Colors.grey,
           //         ),
           //       ),
           //       title: Text('Landlord Expenses',style: TextStyle(fontSize: 12)),
           //       onTap: () {
           //       //   userData[1]['rights']['landlordDed'] == 'NO' ? showAccess('Access Denied for Landlord Expenses'):Navigator.push(context, MaterialPageRoute(builder: (_) => landlordExpenses()));
           //       },
           //     )
           //   ],
           // ),
         ],
       ),
     ),
   );
  }
}
