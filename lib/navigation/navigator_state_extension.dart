import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'navigation_history_observer.dart';

extension NavigatorStateExtension on NavigatorState {
  bool _isRouteInStack(String routeName) {
    return NavigationHistoryObserver.instance.history.any((route) => route.settings.name == routeName);
  }

  void pushNamedOrPopTo(String routeName, {Object? arguments}) {
    if (!_isRouteInStack(routeName)) {
      pushNamed(routeName, arguments: arguments);
    } else {
      popUntil(ModalRoute.withName(routeName));
    }
  }
}
