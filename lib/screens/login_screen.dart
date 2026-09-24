import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onLogin(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).loginAsStudent();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Welcome back! Login successful.'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _onGuestAccess(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).loginAsGuest();
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              // Brand Icon Card
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.restaurant_menu_rounded,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Welcome to QuickBite',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Skip canteen queues, order pre-made meals, and pick up hot food on campus.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 28),

              // Feature badges row
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildFeatureBadge('⚡', 'Fast Pickup'),
                    Container(height: 24, width: 1, color: Colors.grey.shade300),
                    _buildFeatureBadge('🍱', 'Fresh Menu'),
                    Container(height: 24, width: 1, color: Colors.grey.shade300),
                    _buildFeatureBadge('📱', 'No Queues'),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Mock Input Fields
              TextField(
                decoration: InputDecoration(
                  hintText: 'Student / Staff Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                ),
              ),

              const SizedBox(height: 28),

              // Login Button
              ElevatedButton.icon(
                onPressed: () => _onLogin(context),
                icon: const Icon(Icons.login_rounded),
                label: const Text(
                  'Student / Staff Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),

              const SizedBox(height: 14),

              // Guest Access Button
              OutlinedButton.icon(
                onPressed: () => _onGuestAccess(context),
                icon: const Icon(Icons.person_outline_rounded),
                label: const Text(
                  'Continue as Guest',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureBadge(String emoji, String text) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF424242),
          ),
        ),
      ],
    );
  }
}
