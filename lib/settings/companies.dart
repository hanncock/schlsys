import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/settings/create_company.dart';
import 'package:web1/widgets/loading.dart';
import '../wrapper.dart';

class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {

  List companies = [];
  var currentCompany;


  getCompanies()async{
    print('fetching companies');
    var resu = await auth.companies();
    setState(() {
      companies = resu;
    });
  }

  @override
  void initState(){
    getCompanies();
  }

  addEditCompany(var companyDetails){
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
                      child: CreateCompany(sessionStateStream: session, companyDetails: companyDetails,),
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
              Card(
                elevation: 0,
                child: Container(
                   width: 12.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Colors.white
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Search company'),
                    )
                ),
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
                  getCompanies();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.refresh),
                ),
              )
            ],),
          const Divider(),
          companies.isEmpty ?  const Center(child: LoadingSpinCircle(),):
          Card(
            elevation: 2,
            child: Container(
              width: width,
              height: height -168,
              child: HorizontalDataTable(
                rowSeparatorWidget: const Divider(
                  color: Colors.black12,
                  height: 1.0,
                  thickness: 0.0,
                ),
                itemCount: companies.length ?? 0,
                leftHandSideColumnWidth: 10.w,
                rightHandSideColumnWidth: 90.w,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: (BuildContext context, index){
                  return InkWell(
                    onDoubleTap: (){
                      addEditCompany([companies[index]]);
                    },
                    onTap: (){

                    },
                    child: Container(
                        width: 10.w,
                        height: 52,
                        color: index.isOdd?Colors.grey[100]:Colors.white,
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text('${companies[index]['name']}')
                    ),
                  );
                },
                rightSideItemBuilder: (BuildContext context, index){
                  return InkWell(
                    onDoubleTap: (){
                      addEditCompany([companies[index]]);
                    },
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text('${companies[index]['email']}')
                        ),
                        Container(
                          width: 10.w,
                          height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text('${companies[index]['regNo']}')
                        ),
                        Container(
                          width: 10.w,
                          height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text('${companies[index]['regNo']}')
                        ),
                        Container(
                          width: 10.w,
                          height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text('${companies[index]['tax_pin']}')
                        ),
                        Container(
                          width: 10.w,
                          height: 52,
                          color: index.isOdd?Colors.grey[100]:Colors.white,
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text('${companies[index]['country']}'),
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${companies[index]['town']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text('${companies[index]['road']}')
                        ),
                        Container(
                            width: 10.w,
                            height: 52,
                            color: index.isOdd?Colors.grey[100]:Colors.white,
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: companies[index]['logo'] == null ? Text('-'): Image.network(auth.url+'/'+companies[index]['logo']),
                            // child: Text('${companies[index]['logo']}')
                        ),
                      ],
                    ),
                  );
                },
                //   leftSideItemBuilder:[],
                // rightSideItemBuilder: ,

              ),
            ),
          ),
        ],
      ),

    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 10.w),
      _getTitleItemWidget('Email', 10.w),
      _getTitleItemWidget('Website', 10.w),
      _getTitleItemWidget('Reg No', 10.w),
      _getTitleItemWidget('Tax Pin', 10.w),
      _getTitleItemWidget('Country', 10.w),
      _getTitleItemWidget('Town', 10.w),
      _getTitleItemWidget('Road', 10.w),
      _getTitleItemWidget('Logo', 10.w),
    ];
  }

  Widget _getTitleItemWidget(String label, double widh) {
    return Container(
      width: widh,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
    );
  }
}
