import 'package:flutter/material.dart';
import 'presentation/pages/profilepagewithassets.dart';
import 'presentation/pages/profilepagewithassets.dart';
import 'core/navigation_service.dart';
import 'presentation/pages/homepage.dart';
import 'presentation/pages/profilepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey, // Global navigation key
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/profilewithassets': (context) =>
            ProfilePageWithAssets(), // Named route for SecondPage
      },
    );
  }
}
