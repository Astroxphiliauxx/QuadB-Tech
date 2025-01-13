import 'package:flutter/material.dart';
import 'package:movie_app/screens/route_not_found.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.red),
        textTheme: const TextTheme(),
      ),
      home: SplashScreen(),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => RouteNotFoundScreen(),
      ),
    );
  }
}
