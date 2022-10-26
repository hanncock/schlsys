import 'package:flutter/material.dart';
import 'package:web1/homepage.dart';

import 'listViewModel.dart';

class ModuleViewer extends StatelessWidget {
  final ModuleDetail moduleDetail;
  const ModuleViewer({Key? key, required this.moduleDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: GestureDetector(
        onTap: (){
          moduleSent = moduleDetail.label;
          print('nedds updating');
          print(moduleSent);
          // print(moduleSent);
          // if(modules.contains('SchoolSys')){
          //   print('exists');
          //   modinitPosition = modules.indexOf('SchoolSys');
          //   setState((){});
          // }else{
          //   setState(() {
          //     print('will add ');
          //     modules.add('SchoolSys');
          //   });
          //   modinitPosition = modules.indexOf('SchoolSys');
          //   print('this is the position $modinitPosition');
          //   setState((){});
          // }
          // print('${moduleDetail.label}');
        },
        child: Card(
          color: Colors.white10,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              moduleDetail.icon,
              Text('${moduleDetail.title}'),
            ],
          )),
        ),
      ),
    );
  }
}

// class ModuleViewer extends StatefulWidget {
//   final ModuleDetail moduleDetail;
//   const ModuleViewer({Key? key, required this.moduleDetail}) : super(key: key);
//
//   @override
//   State<ModuleViewer> createState() => _ModuleViewerState();
// }
//
// class _ModuleViewerState extends State<ModuleViewer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       height: 80,
//       child: GestureDetector(
//         onTap: (){
//           HomePage.moduleChanger();
//           setState((){
//             moduleSent = widget.moduleDetail.label;
//           });
//
//           // if(modules.contains('SchoolSys')){
//           //   print('exists');
//           //   modinitPosition = modules.indexOf('SchoolSys');
//           //   setState((){});
//           // }else{
//           //   setState(() {
//           //     print('will add ');
//           //     modules.add('SchoolSys');
//           //   });
//           //   modinitPosition = modules.indexOf('SchoolSys');
//           //   print('this is the position $modinitPosition');
//           //   setState((){});
//           // }
//           print('${widget.moduleDetail.label}');
//         },
//         child: Card(
//           color: Colors.white10,
//           child: Center(child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               widget.moduleDetail.icon,
//               Text('${widget.moduleDetail.title}'),
//             ],
//           )),
//         ),
//       ),
//     );
//   }
// }
