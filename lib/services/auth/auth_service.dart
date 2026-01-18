import '../../core/config/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  /// Get the current authenticated user
  /// Returns null if no user is logged in
  static User? get currentUser => SupabaseConfig.client.auth.currentUser;

  /// Check if a user is currently authenticated
  static bool get isAuthenticated => currentUser != null;

  /// Sign up a new user with email and password
  /// 
  /// [email] - User's email address
  /// [password] - User's password
  /// 
  /// Returns the created user on success
  /// Throws an exception on failure
  static Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await SupabaseConfig.client.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Sign in an existing user with email and password
  /// 
  /// [email] - User's email address
  /// [password] - User's password
  /// 
  /// Returns the authenticated user on success
  /// Throws an exception on failure
  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await SupabaseConfig.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Sign out the current user
  /// 
  /// Throws an exception on failure
  static Future<void> signOut() async {
    try {
      await SupabaseConfig.client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  /// Listen to auth state changes
  /// 
  /// Useful for reactive UI updates when user logs in/out
  /// Returns a stream of AuthState
  static Stream<AuthState> get authStateChanges =>
      SupabaseConfig.client.auth.onAuthStateChange;
}
