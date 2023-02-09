import 'package:flutter/material.dart';
import 'package:zip_care/src/feature/welcome/welcome_screen.dart';

import '../../feature/splash/splash_screen.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String welcome = '/welcome';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreens());
      default:
        return MaterialPageRoute(
            builder: (_) => RouteErrorScreen(
                  title: 'Route Not Found',
                  message: 'Error! The route ${settings.name} not found.',
                ));
    }
  }
}

class RouteErrorScreen extends StatelessWidget {
  final String title;
  final String message;

  const RouteErrorScreen({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
