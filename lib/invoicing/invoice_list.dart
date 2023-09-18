import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/invoicing/create_invoice.dart';

import '../wrapper.dart';

class InvoicingList extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;
  const InvoicingList({Key? key,required this.sessionStateStream}) : super(key: key);

  @override
  State<InvoicingList> createState() => _InvoicingListState();
}

class _InvoicingListState extends State<InvoicingList> {

  List invoices = [];

  getInvoices(){
    
  }

  addEditCompany(var userDetails){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    // color: Colors.redAccent,
                    // child: Text('soke'),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CreateInvoice(sessionStateStream: session, invoicedata: userDetails,),
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 18.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:Colors.white
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Invoice Number'),
                  )
              ),
              ElevatedButton(
                onPressed: () {
                  addEditCompany(null);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // getusers();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.refresh),
                ),
              )
            ],),
        ],
      ),
    );
  }
}
