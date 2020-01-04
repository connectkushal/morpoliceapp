import 'dart:async';

import 'package:flutter/foundation.dart' show AsyncCallback;
import 'package:flutter/material.dart';

enum StartupState { Busy, Success, Error }

class AsyncInitWrapper extends StatefulWidget {
  final AsyncCallback onInit;
  final AsyncWidgetBuilder builder;
  final StreamController<StartupState> _startupStatus =
      StreamController<StartupState>();

  AsyncInitWrapper({
    Key key,
    this.onInit,
    this.builder,
  }) : super(key: key);
  _AsyncInitWrapperState createState() => _AsyncInitWrapperState();

  dispose() {
    _startupStatus.close();
  }

  Future bootstrap({bool isError = false}) async {
    _startupStatus.add(StartupState.Busy);
    //initializtions
    await onInit();
    if (isError) {
      _startupStatus.add(StartupState.Error);
    } else {
      _startupStatus.add(StartupState.Success);
    }
  }
}

class _AsyncInitWrapperState extends State<AsyncInitWrapper> {
  @override
  void initState() {
    widget.bootstrap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StartupState>(
      stream: widget._startupStatus.stream,
      builder: widget.builder,
    );
  }
}
