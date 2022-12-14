import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web1/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveLayout({Key? key, required this.mobileBody, required this.desktopBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth < mobileWidth){
          return mobileBody;
        }else{
          return desktopBody;
        }
      },
    );
  }
}