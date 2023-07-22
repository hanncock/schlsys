import 'package:flutter/material.dart';
import 'package:web1/widgets/loading.dart';
import '../wrapper.dart';

class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {

  List companies = [];


  getCompanies()async{
    var resu = await auth.companies();
    // print(resu);
    setState(() {
      companies = resu;
    });
    print(resu);
  }

  @override
  void initState(){
    getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: companies.isEmpty ?  Center(child: LoadingSpinCircle(),):Row(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('#')),
              DataColumn(label: Text('Name')),
            ],
            rows: List.generate(companies.length, (index) => DataRow(
                color: index.isOdd ? MaterialStateProperty.resolveWith((states) => Colors.white): MaterialStateProperty.resolveWith((states) => Colors.grey[200]),//Colors.white : Colors.grey[200],

                cells: [
                  DataCell(Text('${companies[index]['companyId']}')),
                  DataCell(Text('${companies[index]['name']}')),
                ])
            )
              // DataRow(
              //     cells: [
              //   DataCell(Text('${companies}'))
              // ])
            // ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Scrollbar(
                radius: Radius.circular(10),
                scrollbarOrientation: ScrollbarOrientation.bottom,
                thickness: 10,
                isAlwaysShown:true,
                child: DataTable(
                    columns: [
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Website')),
                      DataColumn(label: Text('Reg_No')),
                      DataColumn(label: Text('Tax_Pin')),
                      DataColumn(label: Text('Country')),
                      DataColumn(label: Text('Town')),
                      DataColumn(label: Text('Road')),
                      DataColumn(label: Text('Logo')),
                    ],
                    rows: List.generate(companies.length, (index) => DataRow(
                        color: index.isOdd ? MaterialStateProperty.resolveWith((states) => Colors.white): MaterialStateProperty.resolveWith((states) => Colors.grey[200]),//Colors.white : Colors.grey[200],

                        cells: [
                          DataCell(Text('${companies[index]['email'] ?? ''}')),
                          DataCell(Text('${companies[index]['website'] ?? ''}')),
                          DataCell(Text('${companies[index]['regNo'] ?? '' }')),
                          DataCell(Text('${companies[index]['tex_pin'] ?? '' }')),
                          DataCell(Text('${companies[index]['country'] ?? '' }')),
                          DataCell(Text('${companies[index]['town'] ?? '' }')),
                          DataCell(Text('${companies[index]['road'] ?? '' }')),
                          DataCell(Text('${companies[index]['logo'] ?? '' }')),
                        ])
                    )
                  // DataRow(
                  //     cells: [
                  //   DataCell(Text('${companies}'))
                  // ])
                  // ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
