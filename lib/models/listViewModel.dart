// import 'package:flutter/cupertino.dart';
//
// class Modules extends StatelessWidget {
//   const Modules({Key? key, required this.title, required this.icon, required this.btnAction}) : super(key: key);
// final String title;
//   final Icon icon;
//   final ButtonActivateIntent btnAction;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

class ModuleDetail{
  final String title;
  final String label;
  final Icon icon;
  final ButtonActivateIntent btnAction;

  ModuleDetail({
    required this.label,
    required this.title,
    required this.icon,
    required this.btnAction});
}
