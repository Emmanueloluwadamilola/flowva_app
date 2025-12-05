import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign Up with Email and Password
  Future<AuthResponse> signUp(String email, String password) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  // Sign In with Email and Password
  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Sign In with Google
  Future<bool> signInWithGoogle() async {
    return await _supabase.auth.signInWithOAuth(OAuthProvider.google);
  }

  // Sign In with Apple
  Future<bool> signInWithApple() async {
    return await _supabase.auth.signInWithOAuth(OAuthProvider.apple);
  }

  // Forgot Password
  Future<void> forgotPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  // Sign Out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get Current User
  User? get currentUser => _supabase.auth.currentUser;
}
