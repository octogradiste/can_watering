import 'package:flutter/material.dart';

class ScreenService {
  static final GlobalKey<NavigatorState> _navigatorState = GlobalKey();
  static final GlobalKey<ScaffoldMessengerState> _messengerState = GlobalKey();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorState;
  GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerState;

  Future<dynamic> navigateTo(Widget page) {
    return _navigatorState.currentState!
        .push(MaterialPageRoute(builder: (_) => page));
  }

  void popAll() {
    _navigatorState.currentState!.popUntil(ModalRoute.withName('/'));
  }

  void pop() {
    _navigatorState.currentState!.pop();
  }

  void showSnackBar(
    SnackBar snackBar, {
    void Function(SnackBarClosedReason)? onClosed,
  }) {
    _messengerState.currentState!
        .showSnackBar(snackBar)
        .closed
        .then((reason) => onClosed?.call(reason));
  }
}
