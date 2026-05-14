import 'package:base_module/base_module.dart';

class SettingsProvider extends BaseProvider{
  bool darkMode = true;

  bool notifications = true;

  bool autoConnect = false;

  void toggleDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }

  void toggleNotifications() {
    notifications = !notifications;
    notifyListeners();
  }

  void toggleAutoConnect() {
    autoConnect = !autoConnect;
    notifyListeners();
  }
}