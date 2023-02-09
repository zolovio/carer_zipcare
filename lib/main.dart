import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/app_utils/app_router.dart';
import 'package:zip_care/src/core/constants/app_theme.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/feature/splash/splash_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 683),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: themeData,
        title: strAppName,
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
