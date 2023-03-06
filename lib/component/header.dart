import 'package:flutter/material.dart';
import 'package:web1/config/responsive.dart';

import '../style/colors.dart';
import '../style/style.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Column(
            children: [
              PrimaryText(text: 'Dashboard',size: 30.0,fontWeight: FontWeight.w800,),
              PrimaryText(text: 'Payments Updates',size: 16.0,color: AppColors.secondary,),
            ],
          ),
        ),
        Spacer(flex: 1,),
        Expanded(
          flex: Responsive.isDesktop(context) ? 1 : 2,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: EdgeInsets.only(left: 40,right: 3.0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.white)
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.black,),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: AppColors.secondary,fontSize: 14.0)
              ),
            )
        )
      ],
    );
  }
}
