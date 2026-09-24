import 'package:flutter/foundation.dart';

enum UserRole { guest, student }

class UserProvider with ChangeNotifier {
  UserRole _role = UserRole.guest;

  UserRole get role => _role;
  bool get isGuest => _role == UserRole.guest;

  String get displayName => isGuest ? 'Guest User' : 'Student User';

  String get greeting => isGuest ? 'Hello, Guest! 👋' : 'Hello, Student! 👋';

  String get email => isGuest ? 'Guest Browsing Mode' : 'student@university.edu';

  String get studentIdInfo => isGuest ? 'Guest Account' : 'Student ID: ST1024';

  void loginAsGuest() {
    _role = UserRole.guest;
    notifyListeners();
  }

  void loginAsStudent() {
    _role = UserRole.student;
    notifyListeners();
  }
}
