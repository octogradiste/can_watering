import 'package:flutter/material.dart';

class ScreenService {
  static final GlobalKey<NavigatorState> _navigatorState = GlobalKey();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorState;

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
}
