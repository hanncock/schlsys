import 'dart:async';

import 'package:flutter/cupertino.dart';

class Session{
  BuildContext? context;
  StreamController? streamController;
  bool enableLoginPage = false;

  void startListener({
    required StreamController streamController,
    required BuildContext context,
  }){
    this.streamController = streamController;
    this.context = context;
    Map<String, dynamic> map = {
      "context": context, "timer":true
    };
    streamController.add(map);
  }


  void stopListener({
    required StreamController streamController,
    required BuildContext context,
  }){
    this.streamController = streamController;
    this.context = context;
    Map<String, dynamic> map = {
      "context": context, "timer":false
    };
    streamController.add(map);
  }


}