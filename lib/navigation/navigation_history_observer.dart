import 'package:flutter/widgets.dart';

class NavigationHistoryObserver  extends NavigatorObserver {
  static final NavigationHistoryObserver _singleton = NavigationHistoryObserver._internal();
  static NavigationHistoryObserver get instance => _singleton;

  final List<Route<dynamic>?> _history = <Route<dynamic>?>[];

  List<Route<dynamic>> get history => List<Route<dynamic>>.from(_history);

  NavigationHistoryObserver._internal();
  factory NavigationHistoryObserver() {
    return _singleton;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.removeLast();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.add(route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.remove(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final int oldRouteIndex = _history.indexOf(oldRoute);
    _history.replaceRange(oldRouteIndex, oldRouteIndex + 1, [newRoute]);
  }
}
