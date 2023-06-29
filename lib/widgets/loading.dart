import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoadingSpinCircle extends StatelessWidget {
  const LoadingSpinCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthh = MediaQuery.of(context).size.width;
    return Center(
      child: CircularProgressIndicator(
        color: Colors.redAccent,
        // strokeWidth: widthh* 0.01,
      ),
    );
  }
}

PageRouteBuilder customePageTransion(newRoute) {
  return PageRouteBuilder(
      pageBuilder: (_, __, ___) => newRoute,
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.easeInOut, parent: animation);
        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
            axisAlignment: 0.0,
          ),
        );
      });
}


class Dialogutil{
  static openLoginPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => LoadingSpinCircle());
  }
}

Future<dynamic> buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) => LoadingSpinCircle());
}

showReturnMessage(BuildContext context, color,message){
  var showToast = Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
