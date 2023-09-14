import 'package:flutter/material.dart';

class LoadingSpinCircle extends StatelessWidget {


  // var message;

  const LoadingSpinCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthh = MediaQuery.of(context).size.width;
    return const Center(
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
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.easeInOut, parent: animation);
        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: child,
          ),
        );
      });
}


class Dialogutil{
  static openLoginPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const LoadingSpinCircle());
  }
}

Future<dynamic> buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) => const LoadingSpinCircle());
}

showReturnMessage(BuildContext context, color,message){
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('me'),
  ));
  // var showToast = Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 3,
  //     backgroundColor: color,
  //     textColor: Colors.white,
  //     fontSize: 16.0
  // );
}
