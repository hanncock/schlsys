// import 'dart:async';
// import 'package:local_session_timeout/local_session_timeout.dart';
// import 'package:flutter/material.dart';
// import 'package:web1/allmodules.dart';
// import 'package:web1/config/SizeConfig.dart';
// import 'package:web1/screens_with_models/authentication/login.dart';
// import 'package:web1/session_manager/session.dart';
// import 'package:web1/session_manager/session_manager.dart';
// import 'package:web1/smsscreen/sms.dart';
// import 'package:web1/style/colors.dart';
// import 'HomePage.dart';
//
// final globalNavigatorKey = GlobalKey<NavigatorState>();

// void main(){
//
//   runApp(myApp());
// }
//
//  var screenWidth;
//  var screenHeight;
//  var blockSizeHorizontal;
//  var blockSizeVertical;
//
// class myApp extends StatelessWidget {
//
//   // final Session session = Session();
//   // final StreamController streamController = StreamController();
//
//   final _navigatorKey = GlobalKey<NavigatorState>();
//   NavigatorState get _navigator => _navigatorKey.currentState!;
//
//   final sessionStateStream = StreamController<SessionState>();
//
//
//    myApp({Key? key}) : super(key: key);
//
//   // void redirect(){
//   //   if(globalNavigatorKey.currentContext!=null){
//   //     Navigator.pop(globalNavigatorKey.currentContext!);
//   //     Navigator.push(globalNavigatorKey.currentContext!, MaterialPageRoute(builder: (context)=>
//   //         Login(session: session,))
//   //     );
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     // if(globalNavigatorKey.currentContext!=null){
//     //   session.startListener(streamController: streamController,
//     //       context: globalNavigatorKey.currentContext!);
//     // }
//
//     final sessionConfig = SessionConfig(
//       invalidateSessionForAppLostFocus: const Duration(seconds: 5),
//       invalidateSessionForUserInactivity: const Duration(seconds: 5),
//     );
//     sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
//       // stop listening, as user will already be in auth page
//       sessionStateStream.add(SessionState.stopListening);
//       if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
//         // handle user  inactive timeout
//         _navigator.push(MaterialPageRoute(
//           builder: (_) => Login(
//               session: sessionStateStream,
//               // loggedOutReason: "Logged out because of user inactivity"
//           ),
//         ));
//       } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
//         // handle user  app lost focus timeout
//         _navigator.push(MaterialPageRoute(
//           builder: (_) => Login(
//               session: sessionStateStream,
//               // loggedOutReason: "Logged out because app lost focus"
//           ),
//         ));
//       }
//     });
//
//     return SessionTimeoutManager(
//       userActivityDebounceDuration: const Duration(seconds: 1),
//       sessionConfig: sessionConfig,
//       sessionStateStream: sessionStateStream.stream,
//       child: MaterialApp(
//         navigatorKey: _navigatorKey,
//         // title: 'Flutter Demo',
//         theme: ThemeData(
//             primarySwatch: Colors.blue,
//             scaffoldBackgroundColor: AppColors.primaryBg
//         ),
//         // home: AuthPage(sessionStateStream: sessionStateStream,),
//         home: Login(session: sessionStateStream,),
//       ),
//     );
//
//     // return SessionManager(
//     //   onSessionExpired: (){
//     //     if(globalNavigatorKey.currentContext!=null && session.enableLoginPage==true){
//     //       print('session expired');
//     //       ScaffoldMessenger.of(globalNavigatorKey.currentContext!).showSnackBar(SnackBar(content: Container(
//     //         color: Colors.black,
//     //         child: Text('Session Expired',style: TextStyle(color: Colors.white),),
//     //       )));
//     //       redirect();
//     //     }
//     //   },
//     //   streamController: streamController,
//     //   duration: Duration(seconds: 2),
//     //   child: MaterialApp(
//     //     debugShowCheckedModeBanner: false,
//     //     navigatorKey: globalNavigatorKey,
//     //     theme: ThemeData(
//     //       primarySwatch: Colors.blue,
//     //       scaffoldBackgroundColor: AppColors.primaryBg
//     //     ),
//     //     // home: HomePage(),
//     //     home: Login(session: session,),
//     //     // home: Messaging(),
//     //   ),
//     // );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:web1/screens_with_models/authentication/login.dart';
import 'package:web1/style/colors.dart';
import 'package:web1/widgets/loading.dart';
import 'package:web1/wrapper.dart';

void main() {
  runApp(MyApp());
}


class Dialogutil{
  static openLoginPopup(BuildContext context) {
    //
    showDialog(
        context: context,
        builder: (_) => LoadingSpinCircle());
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  /// Make this stream available throughout the widget tree with with any state management library
  /// like bloc, provider, GetX, ..
  final sessionStateStream = StreamController<SessionState>();

  clearlogs()async{
    SharedPreferences _prefs = await  SharedPreferences.getInstance();
    _prefs.get('Userdata');
    _prefs.clear();
  }

  popup(BuildContext context){
     Dialogutil.openLoginPopup(context);
    }

  @override
  Widget build(BuildContext context) {
    final sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: const Duration(minutes: 15),
      invalidateSessionForUserInactivity: const Duration(minutes: 15),
    );
    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      // stop listening, as user will already be in auth page
      sessionStateStream.add(SessionState.stopListening);
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        print('logging you out');
        clearlogs();
        // popup(context);
        // Builder(builder: (BuildContext context) { return popup(context); },);
        print('logged out');
        // handle user  inactive timeout

        _navigator.push(MaterialPageRoute(
          builder: (_) => Login(
              sessionStateStream: sessionStateStream,
              // loggedOutReason: "Logged out because of user inactivity"
          ),
        ));

        // _navigator.push(MaterialPageRoute(
        //   builder: (_) => Login(
        //     sessionStateStream: sessionStateStream,
        //     // loggedOutReason: "Logged out because of user inactivity"
        //   ),
        // ));


      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        // handle user  app lost focus timeout
        print('locking');
        _navigator.push(MaterialPageRoute(
          builder: (_) => Login(
              sessionStateStream: sessionStateStream,
              // loggedOutReason: "Logged out because app lost focus"
          ),
        ));
      }
    });
    return SessionTimeoutManager(
      userActivityDebounceDuration: const Duration(seconds: 1),
      sessionConfig: sessionConfig,
      sessionStateStream: sessionStateStream.stream,
      child: Sizer(
        builder: (context,orientation,deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: AppColors.primaryBg
            ),
            //
            home: Builder(
                builder: (context)=> Wrapper(sessionStateStream: sessionStateStream,)
            ),
          );
        }
      ),
    );
  }
}

// ignore: must_be_immutable
// class AuthPage extends StatelessWidget {
//   AuthPage({
//     required this.sessionStateStream,
//     this.loggedOutReason = "",
//     super.key,
//   });
//
//   final StreamController<SessionState> sessionStateStream;
//   late String loggedOutReason;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (loggedOutReason != "")
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 15,
//                   ),
//                   child: Text(loggedOutReason),
//                 ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   // start listening only after user logs in
//                   sessionStateStream.add(SessionState.startListening);
//                   loggedOutReason = await Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => Messaging(
//                         sessionStateStream: sessionStateStream,
//                       ),
//                     ),
//                   );
//                 },
//                 child: const Text("Login"),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final StreamController<SessionState> sessionStateStream;
//
//   const MyHomePage({
//     required this.sessionStateStream,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("Home page"),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () async {
//                 // stop listening only after user goes to this page
//
//                 //! Its better to handle listening logic in state management
//                 //! libraries rather than writing them at random places in your app
//
//                 sessionStateStream.add(SessionState.stopListening);
//                 await Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => const ReadingPage(),
//                   ),
//                 );
//
//                 //! after user returns from that page start listening again
//                 sessionStateStream.add(SessionState.startListening);
//               },
//               child: const Text("Reading page"),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (_) => WritingPage(
//                       sessionStream: sessionStateStream,
//                     ),
//                   ),
//                 );
//               },
//               child: const Text("Writing Page"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// This [age can text content, which user might be reading without any user activity
// If you want to disable the session timeout listeners when user enters such pages
// follow the below code
// class ReadingPage extends StatefulWidget {
//   const ReadingPage({super.key});
//
//   @override
//   State<ReadingPage> createState() => _ReadingPageState();
// }
//
// class _ReadingPageState extends State<ReadingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const Center(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//               "This page can have lot of extent content, and user might be reading this without performing any user activity. So you might want to disable sesison timeout listeners only for this page"),
//         ),
//       ),
//     );
//   }
// }
//
// // If the user is typing into the textbox, you may want to disable the session
// // timeout listeners because typing events aren't captured by session timeout
// // manager and it may conclude that user is inactive
// class WritingPage extends StatefulWidget {
//   final StreamController<SessionState> sessionStream;
//   const WritingPage({
//     required this.sessionStream,
//     super.key,
//   });
//
//   @override
//   State<WritingPage> createState() => _WritingPageState();
// }
//
// class _WritingPageState extends State<WritingPage> {
//   @override
//   Widget build(BuildContext context) {
//     if (MediaQuery.of(context).viewInsets.bottom > 0) {
//       // softkeyboard is open
//       widget.sessionStream.add(SessionState.stopListening);
//     } else {
//       // keyboard is closed
//       widget.sessionStream.add(SessionState.startListening);
//     }
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Text(
//                 "If the user is typing into the textbox, you may want to disable the session timeout listeners because typing events aren't captured by session timeout manager and it may conclude that user is inactive"),
//             SizedBox(
//               height: 20,
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderSide:
//                     BorderSide(color: Color.fromARGB(255, 16, 17, 17))),
//                 hintText: 'Start typing here',
//                 helperText: 'when keyboard is open, session won"t expire',
//                 prefixText: ' ',
//                 suffixText: 'USD',
//                 suffixStyle: TextStyle(
//                   color: Color.fromARGB(255, 14, 14, 14),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }