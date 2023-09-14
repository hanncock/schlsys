import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/SizeConfig.dart';
import 'style/colors.dart';

class Homedrawwer extends StatefulWidget {
  const Homedrawwer({Key? key}) : super(key: key);

  @override
  State<Homedrawwer> createState() => _HomedrawwerState();
}

class _HomedrawwerState extends State<Homedrawwer> {
  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        color: AppColors.secondaryBg,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Center(
                    child: SvgPicture.asset('mac-action.svg'),
                  ),
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'home.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'pie-chart.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'clipboard.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'credit-card.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'trophy.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'invoice.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
