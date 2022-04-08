import 'package:auto_route/annotations.dart';

import '../widgets/main.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: Page1),
    AutoRoute(page: Page2),
  ],
)
class $AppRouter {}
