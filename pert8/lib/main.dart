import 'package:flutter/material.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/profile_page.dart';
import 'presentation/pages/settings_page.dart';
import 'presentation/pages/login_page.dart';
import 'core/navigation/navigation_service.dart';
import 'presentation/controllers/home_controller.dart';
import 'domain/usecases/navigate_to_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize services and controllers
    final navigationService = NavigationService();
    final navigateToPageUseCase = NavigateToPageUseCase(navigationService);
    final homeController = HomeController(navigateToPageUseCase);

    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey, // Use global navigator key
      title: 'Pert8',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(homeController),
        '/profile': (context) => ProfilePage(homeController),
        '/settings': (context) => SettingsPage(homeController),
        '/login': (context) => LoginPage(homeController),
      },
    );
  }
}
