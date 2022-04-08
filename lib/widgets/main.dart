import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:video_player_hook/widgets/background_video_wrapper.dart';

import '../routing/router.gr.dart';
import 'background_video.dart';

void main() => runApp(MyApp());

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: const RouteInformation(
          location: "/",
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundVideoWrapper(
      videoPlayer: const BackgroundVideo(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Home Page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.navigateTo(const Route1());
            },
            child: const Text(
              "Click to go to page 1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundVideoWrapper(
      videoPlayer: BackgroundVideo(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Page 1",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.navigateTo(const Route2());
            },
            child: const Text(
              "Click to go to page 2",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundVideoWrapper(
      videoPlayer: const BackgroundVideo(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Page 2",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.router.popUntilRoot();
            },
            child: const Text(
              "Click to go back to home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
