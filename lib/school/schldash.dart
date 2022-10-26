import 'package:flutter/material.dart';

class SchoolDash extends StatefulWidget {
  const SchoolDash({Key? key}) : super(key: key);

  @override
  State<SchoolDash> createState() => _SchoolDashState();
}

class _SchoolDashState extends State<SchoolDash> with AutomaticKeepAliveClientMixin<SchoolDash>{

@override
bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        child: ClipPath(
                          child: Container(
                            height: height * 0.2,
                            width: width / 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.group,
                                          size: width * 0.05,
                                          color: Colors.brown,
                                        ),
                                        Text('Students')
                                      ],
                                    ),

                                    Divider(height: height * 0.5,color: Colors.red,),
                                    Text('12,000',style: TextStyle(
                                        fontSize: width * 0.03
                                    ),)

                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.brown, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                        ),
                      ),
                      // SizedBox(width: width * 0.04,),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        child: ClipPath(
                          child: Container(
                            height: height * 0.2,
                            width: width / 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.groups,
                                          size: width * 0.05,
                                          color: Colors.blue,
                                        ),
                                        Text('Teachers')
                                      ],
                                    ),

                                    Divider(height: height * 0.5,color: Colors.red,),
                                    Text('12,000',style: TextStyle(
                                        fontSize: width * 0.03
                                    ),)

                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.blue, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                        ),
                      ),
                      // SizedBox(width: width * 0.04,),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        child: ClipPath(
                          child: Container(
                            height: height * 0.2,
                            width: width / 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.person_add_alt_1_sharp,
                                          size: width * 0.05,
                                          color: Colors.red,
                                        ),
                                        Text('Parents')
                                      ],
                                    ),

                                    Divider(height: height * 0.5,color: Colors.red,),
                                    Text('12,000',style: TextStyle(
                                        fontSize: width * 0.03
                                    ),)

                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.red, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                        ),
                      ),
                      // SizedBox(width: width * 0.04,),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        child: ClipPath(
                          child: Container(
                            height: height * 0.2,
                            width: width / 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.monetization_on_outlined,
                                          size: width * 0.05,
                                          color: Colors.green,
                                        ),
                                        Text('Finance')
                                      ],
                                    ),
                                    Divider(height: height * 0.5,color: Colors.red,),
                                    Text('12,000',style: TextStyle(
                                        fontSize: width * 0.03
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.green, width: 5))),
                          ),
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ClipPath(
                        child: Container(
                            height: height * 0.3,
                            width: width /2.5,
                            child: Padding(padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Collection & Expenses',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: width * 0.1,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.arrow_drop_down,color: Colors.green,),
                                              SizedBox(width: width * 0.01,),
                                              Icon(Icons.refresh,color: Colors.blue,),
                                              SizedBox(width: width * 0.01,),
                                              Icon(Icons.cancel,color: Colors.redAccent,),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                    Divider(height: height * 0.02,),
                                    Text('Chart Goes Here ${width /3}')
                                  ],
                                )

                            )
                        )
                    )
                ),
                Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ClipPath(
                        child: Container(
                            height: height * 0.6,
                            width: width /3.5,
                            child: Padding(padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Notice Board',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(height: height * 0.02,),
                                    Text('Text Goes Here${width /4}')
                                  ],
                                )

                            )
                        )
                    )
                ),
                Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ClipPath(
                        child: Container(
                            height: height * 0.6,
                            width: width /3.5,
                            child: Padding(padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Recent Activities',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(height: height * 0.02,),
                                    Text('Text Goes Here ${width /4}')
                                  ],
                                )

                            )
                        )
                    )
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
