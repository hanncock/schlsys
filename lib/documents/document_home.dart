// import 'package:flutter/material.dart';
//
// class Documents extends StatefulWidget {
//   const Documents({Key? key}) : super(key: key);
//
//   @override
//   State<Documents> createState() => _DocumentsState();
// }
//
// class _DocumentsState extends State<Documents> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text('documents is here')
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = ['Page 0', 'Page 1', 'Page 2'];
  int initPosition = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('soke'),
          Container(
            width: 400,
            height: 200,
            child: CustomTabView(
              initPosition: initPosition,
              itemCount: data.length,
              tabBuilder: (context, index) => Tab(text: data[index]),
              pageBuilder: (context, index) => Center(child: Text(data[index])),
              onPositionChange: (index){
                print('current position: $index');
                initPosition = index;
              },
              onScroll: (position) => print('$position'), stub: Container(),
            ),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton.extended(
          onPressed: (){},
          label: Container(
            width: 100,
            height: 100,
            child: Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      data.add('Page ${data.length}');
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    print('will remove');
                    setState(() {
                      data.remove('Page ${data.length}');
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.remove),
                    ],
                  ),
                ),
              ],
            ),
          ),
      )

      // Row(
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         setState(() {
      //           data.add('Page ${data.length}');
      //         });
      //       },
      //       child: Row(
      //         children: [
      //           Icon(Icons.add),
      //         ],
      //       ),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         setState(() {
      //           data.remove('Page ${data.length}');
      //         });
      //       },
      //       child: Row(
      //         children: [
      //           Icon(Icons.add),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

    );
  }
}

/// Implementation

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget stub;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<double> onScroll;
  final int initPosition;

  CustomTabView({
    required this.itemCount,
    required this.tabBuilder,
    required this.pageBuilder,
    required this.stub,
    required this.onPositionChange,
    required this.onScroll,
    required this.initPosition,
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabView> with TickerProviderStateMixin {
  late TabController controller;
  late int _currentCount;
  late int _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation?.addListener(onScroll);
    _currentCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      controller.animation?.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();

      if (widget.initPosition != null) {
        _currentPosition = widget.initPosition;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 :
        _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            if(mounted) {
              widget.onPositionChange(_currentPosition);
            }
          });
        }
      }

      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation?.addListener(onScroll);
      });
    } else if (widget.initPosition != null) {
      controller.animateTo(widget.initPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation!.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).hintColor,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            tabs: List.generate(
              widget.itemCount,
                  (index) => widget.tabBuilder(context, index),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: List.generate(
              widget.itemCount,
                  (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }

  onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange(_currentPosition);
      }
    }
  }

  onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll(controller.animation!.value);
    }
  }
}


