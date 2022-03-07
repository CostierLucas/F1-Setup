import 'package:app/home/home_page.dart';
import 'package:app/settings/settings_page.dart';
import 'package:flutter/material.dart';

class NavbarService extends ChangeNotifier {
  int _currentTab = 0;

  final List<Widget> _screens = [const HomePage(), const SettingsPage()];

  currentTab(int tab) {
    _currentTab = tab;
    notifyListeners();
  }

  get currentTabId => _currentTab;

  get currentScreen => _screens[_currentTab];
}
