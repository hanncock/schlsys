import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../style/colors.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: (){},
          icon: SvgPicture.asset(
            'calendar.svg',
            width: 20.0,
          ),
        ),
        const SizedBox(width: 10,),
        IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('ring.svg')
        ),
        const SizedBox(width: 15.0,),
        const Row(
          children: [
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.blue,
              // backgroundImage: NetworkImage(''),
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              color: AppColors.black,
            )
          ],
        )
      ],
    );
  }
}
