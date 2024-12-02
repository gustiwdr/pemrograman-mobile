import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class SettingsPage extends StatelessWidget {
  final HomeController controller;

  SettingsPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Center(
        child: Text('Settings Page'),
      ),
      selectedIndex: 2,
      controller: controller,
    );
  }
}
