import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flowva_app/core/extensions/navigation.dart';
import 'package:flowva_app/core/extensions/validation.dart';
import 'package:flowva_app/core/resources/colors.dart';
import 'package:flowva_app/features/auth/data/auth_repository.dart';
import 'package:flowva_app/features/home/screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  TextEditingController emailControlloer = TextEditingController();
  TextEditingController passwordControlloer = TextEditingController();
  final PageController pageController = PageController();
  int pageIndex = 0;

  String email = '';
  String password = '';
  String? emailError;
  String? passwordError;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setPageIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    emailError = email.validateEmail();

    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    passwordError = password.validatePassword();
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _showSnackBar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isError ? Colors.red.shade900 : primaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            gradient: LinearGradient(
              colors: isError
                  ? [Colors.red.shade900, Colors.red.shade700]
                  : [primaryColor, homeColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isError ? Icons.error_outline : Icons.check_circle_outline,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    if (emailError != null ||
        passwordError != null ||
        email.isEmpty ||
        password.isEmpty) {
      _showSnackBar(context, 'Please fix the errors', isError: true);
      return;
    }

    _setLoading(true);
    try {
      final response = await _authRepository.signUp(email, password);
      if (response.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('has_logged_in_explicitly', false);

        _showSnackBar(context, 'Sign up successful! Welcome.');
        context.pushNamedAndClear(HomeScreen.id);
      }
    } on AuthException catch (e) {
      _showSnackBar(context, e.message, isError: true);
    } catch (e) {
      _showSnackBar(context, 'An unexpected error occurred', isError: true);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signIn(BuildContext context) async {
    if (emailError != null ||
        passwordError != null ||
        email.isEmpty ||
        password.isEmpty) {
      _showSnackBar(context, 'Please fix the errors', isError: true);
      return;
    }

    _setLoading(true);
    try {
      final response = await _authRepository.signIn(email, password);
      if (response.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('has_logged_in_explicitly', true);

        _showSnackBar(context, 'Login successful!');
        context.pushNamedAndClear(HomeScreen.id);
      }
    } on AuthException catch (e) {
      _showSnackBar(context, e.message, isError: true);
    } catch (e) {
      _showSnackBar(context, 'An unexpected error occurred', isError: true);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    _showSnackBar(context, 'Coming soon');
  }

  Future<void> signInWithApple(BuildContext context) async {
    _showSnackBar(context, 'Coming soon');
  }

  Future<void> forgotPassword(BuildContext context) async {
    if (emailError != null || email.isEmpty) {
      _showSnackBar(context, 'Please enter a valid email', isError: true);
      return;
    }

    _setLoading(true);
    try {
      await _authRepository.forgotPassword(email);
      _showSnackBar(context, 'Password reset email sent!');
    } on AuthException catch (e) {
      _showSnackBar(context, e.message, isError: true);
    } catch (e) {
      _showSnackBar(context, 'An unexpected error occurred', isError: true);
    } finally {
      _setLoading(false);
    }
  }
}
