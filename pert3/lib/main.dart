import 'package:flutter/material.dart';
import 'core/navigation_service.dart';
import 'presentation/pages/homepage.dart';
import 'presentation/pages/profilepage.dart';
import 'presentation/pages/profilepagewithassets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        // Menggunakan MD2 karena MD3 tidak menggunakan primarySwatch
        useMaterial3: false, // Tidak menggunakan MD3
        primarySwatch: Colors.blue,
        // Jika menggunakan MD3:
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey, // Global navigation key
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(), // Named route for SecondPage
        '/profile_with_assets': (context) =>
            ProfilePageWithAssets(), // Named route for SecondPage
      },
    );
  }
}
