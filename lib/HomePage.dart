import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web1/component/appBarActionItems.dart';
import 'package:web1/component/info_card.dart';
import 'package:web1/config/responsive.dart';
import 'package:web1/homeDrawwer.dart';
import 'package:web1/style/colors.dart';
import 'package:web1/style/style.dart';
import 'component/barchart.dart';
import 'component/header.dart';
import 'config/SizeConfig.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: Homedrawwer(),),
      appBar: !Responsive.isDesktop(context) ? AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: (){
            _drawerKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu,color: AppColors.black,),
        ),
        actions: [
          AppBarActionItems()
        ],
      ): PreferredSize(
        child: SizedBox(),
        preferredSize: Size.zero),
      body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(Responsive.isDesktop(context))
              Expanded(
                  flex: 1,
                  child: Homedrawwer()
              ),
              Expanded(
                  flex: 10,
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Header(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 4,),
                            SizedBox(
                              width: SizeConfig.screenWidth,
                              child: Wrap(
                                runSpacing: 20.0,
                                spacing: 20.0,
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  InfoCard(
                                      icon: "credit-card.svg",
                                      label: "transfer via Card number",
                                      amount: "\$1200"
                                  ),
                                  InfoCard(
                                      icon: "transfer.svg",
                                      label: "transfer via Card number",
                                      amount: "\$1200"
                                  ),
                                  InfoCard(
                                      icon: "bank.svg",
                                      label: "transfer via Card number",
                                      amount: "\$1200"
                                  ),
                                  InfoCard(
                                      icon: "invoice.svg",
                                      label: "transfer via Card number",
                                      amount: "\$1200"
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 4,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PrimaryText(text: "Balance",size: 16,fontWeight: FontWeight.w800,color: AppColors.secondary,),
                                    PrimaryText(text: "\$1500",size: 30,fontWeight: FontWeight.bold,color: AppColors.black,),
                                  ],
                                ),
                                PrimaryText(text: "past 30 DAYS",size: 16,color: AppColors.secondary,)
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
                            Container(
                              height: 180,
                              child: BarChartComponent(),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(text: 'History',size: 30,color: AppColors.secondary,),
                                PrimaryText(text: 'Transactions in the last 6 months',size: 16,fontWeight: FontWeight.w800,)
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
                            SingleChildScrollView(
                              scrollDirection: Responsive.isDesktop(context)? Axis.vertical: Axis.horizontal,
                              child: SizedBox(
                                width:Responsive.isDesktop(context)? double.infinity :SizeConfig.screenWidth,
                                child: Table(
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      children:[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(top: 10,bottom:10,left: 20 ),
                                          child: CircleAvatar(
                                            radius: 17,
                                              // backgroundImage: NetworkImage(''),
                                            backgroundColor: Colors.blue,
                                          ),
                                        ),
                                        PrimaryText(text: 'Car Insurance',size: 16,color: AppColors.secondary,),
                                        PrimaryText(text: '10;42:23 AM',size: 16,color: AppColors.secondary,),
                                        PrimaryText(text: '\$350',size: 16,color: AppColors.secondary,),
                                        PrimaryText(text: 'Completed',size: 16,color: AppColors.secondary,),
                                      ]
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              ),
              if(Responsive.isDesktop(context))
              Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    color: AppColors.secondaryBg,
                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                    child: Column(
                      children: [
                        AppBarActionItems(),
                        Column(
                          children: [
                            // SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [BoxShadow(
                                  color: AppColors.iconGray,
                                  blurRadius: 15.0,
                                  offset: Offset(10.0, 15.0)
                                )]
                              ),
                              child: Image.asset('card.png'),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(text: 'Recent Activities', size: 18, fontWeight: FontWeight.w800,),
                                PrimaryText(text: '02 Mar 2021', size: 14, fontWeight: FontWeight.w400,color: AppColors.secondary,)
                              ],
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                            ListTile(
                              contentPadding: EdgeInsets.only(left: 0,right: 20),
                              visualDensity: VisualDensity.standard,
                              leading: Container(
                                width: 50.0,
                                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SvgPicture.asset('drop.svg',width: 20.0,),
                              ),
                              title: PrimaryText(text: "Water Bill",size: 14.0, fontWeight: FontWeight.w300,),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryText(text: "Succesfully", size: 12.0,color: AppColors.secondary,),
                                  PrimaryText(text: "676", size: 16.0,color: AppColors.black,fontWeight: FontWeight.w600,)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
              )

            ],
          )
      ),
    );
  }
}
