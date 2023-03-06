import 'package:flutter/material.dart';
import 'listViewModel.dart';

class ModuleViewer extends StatelessWidget {
  final ModuleDetail moduleDetail;
  const ModuleViewer({Key? key, required this.moduleDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      child: Card(
        color: Color(0xffececf6),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            moduleDetail.icon,
            Text('${moduleDetail.title}'),
          ],
        )),
      ),
    );
  }
}
