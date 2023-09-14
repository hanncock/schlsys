import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/SizeConfig.dart';
import '../style/colors.dart';
import '../style/style.dart';

class InfoCard extends StatelessWidget {
  final String? icon;
  final String label;
  final String amount;

  const InfoCard({
    Key? key,
    this.icon,
    required this.label,
    required this.amount

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 250),
      padding: const EdgeInsets.only(top: 20,left: 20,bottom: 40.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('$icon',width: 35.0,),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          PrimaryText(text: label,color: AppColors.secondary,size: 16.0,),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          PrimaryText(text: amount,fontWeight: FontWeight.w700,size: 18.0,)
        ],
      ),
    );
  }
}
